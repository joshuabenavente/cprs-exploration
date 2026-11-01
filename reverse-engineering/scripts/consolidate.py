"""Build address-keyed coverage and cross-linked catalogs from static Ghidra exports."""
import bisect
import collections
import csv
import hashlib
import json
import re
import struct
import sys
from pathlib import Path
from extract_static import ROOT, REFERENCE, PE, save, jsonl, subsystem
from leaf_semantics import recognize

def records(path):
    if path.exists():
        with path.open() as source:
            for line in source:
                if line.strip():yield json.loads(line)

def main():
    static=ROOT/'evidence/static';inv=ROOT/'evidence/inventory-reviewed'
    if not (inv/'program.json').exists():inv=ROOT/'evidence/inventory-final'
    if not (inv/'program.json').exists():inv=ROOT/'evidence/inventory-seeded'
    program=json.loads((inv/'program.json').read_text())
    summary=json.loads((static/'summary.json').read_text());pe=PE(Path(summary['executable']['path']))
    out=ROOT/'catalog';out.mkdir(exist_ok=True)
    modules=json.loads((static/'map-modules.json').read_text())
    code=sorted([m for m in modules if m['kind'] in ('CODE','ICODE')],key=lambda r:int(r['start'],16))
    starts=[int(m['start'],16) for m in code]
    symbols=collections.defaultdict(list)
    for s in records(static/'map-symbols.jsonl'):symbols[s['address']].append(s['name'])
    imports={i['iat_address']:i for i in records(static/'imports.jsonl')}
    archives=collections.defaultdict(list)
    for a in records(static/'archived-functions.jsonl'):archives[a['address']].append(a)
    batch=collections.defaultdict(list)
    for b in (ROOT/'evidence').glob('batch-*/*.json'):
        if not re.fullmatch('[0-9a-fA-F]+',b.stem):continue
        j=json.loads(b.read_text());batch[j['address']].append({**j,'source':str(b.relative_to(ROOT))})
    functions=[];byaddress={};thunks=[];leaf_proofs=[]
    for f in records(inv/'functions.jsonl'):
        at=f['address'];module=None;basis=None
        if re.fullmatch('[0-9a-fA-F]+',at):
            val=int(at,16);idx=bisect.bisect_right(starts,val)-1
            if idx>=0 and val<int(code[idx]['end_exclusive'],16):module=code[idx]['module'];basis='containing MAP CODE/ICODE region'
        if f['external']:
            module='external';group='external-libraries';basis='Ghidra external function'
        else:
            if module is None:
                aliases=symbols.get(at,[])
                module=(aliases[0].split('.',1)[0] if aliases else 'unmapped-code');basis='symbol prefix' if aliases else 'no MAP attribution'
            group=subsystem(module)
            if group.startswith('other-module:'):group='other-application-modules'
        f.update(module=module,subsystem=group,assignment_basis=basis,
                 subsystem_confidence='provisional name-based logical grouping; physical module attribution recorded separately',
                 map_aliases=symbols.get(at,[]),evidence=[],uncertainties=[])
        if f['external']:
            f['status']='unresolved';f['uncertainties']=['External implementation and effective caller contract not recovered']
        elif at in archives or at in batch:
            f['status']='partially_analyzed'
            f['evidence']=[{'source_c':a['source_c'],'source_asm':a['source_asm'],'instructions_checked':a['instructions_checked']} for a in archives[at]]
            f['evidence'] += batch[at]
            f['uncertainties']=['Decompiler ABI, exception continuations, branch predicates, field layouts and full effects require per-function review']
        else:
            f['status']='unresolved';f['uncertainties']=['Inventoried and assigned to a subsystem; semantic paths not reviewed']
        if not f['external'] and f['body_address_count']==6:
            try:
                off=pe.offset(int(at,16)-pe.image_base);raw=pe.data[off:off+6]
                if raw[:2]==b'\xff\x25':
                    target=f'{struct.unpack_from("<I",raw,2)[0]:08x}'
                    if target in imports:
                        proof={'address':at,'bytes':raw.hex(),'instruction':'JMP dword ptr ['+target+']','iat':imports[target],
                            'scope':'Forwarding behavior only; external implementation unresolved'}
                        thunks.append(proof);f['status']='analyzed';f['analysis_scope']=proof['scope'];f['evidence'].append(proof)
                        f['uncertainties']=['External callee behavior and signature remain delegated to the unresolved external interface']
            except (ValueError,struct.error):pass
        if not f['external'] and 0<f['body_address_count']<=12:
            try:
                start=int(at,16);end=int(f['body_max'],16)
                if start==int(f['body_min'],16) and end-start+1==f['body_address_count']:
                    off=pe.offset(start-pe.image_base);raw=pe.data[off:off+f['body_address_count']]
                    proof=recognize(raw,start)
                    if proof:
                        leaf_proofs.append(proof);f['status']='analyzed'
                        f['analysis_scope']='Exact small-body x86 semantics on normal execution; caller ABI and delegated implementations unresolved'
                        f['evidence'].append(proof)
                        f['uncertainties']=['Pascal-level meaning, field names/types, caller preconditions and memory-fault/exception effects are not inferred from the instruction pattern']
            except (ValueError,struct.error):pass
        functions.append(f);byaddress[at]=f
    jsonl(out/'verified-import-thunks.jsonl',thunks)
    jsonl(out/'verified-small-function-semantics.jsonl',leaf_proofs)
    jsonl(out/'verified-field-accesses.jsonl',(r for r in leaf_proofs if r['kind'].startswith('scalar-field-')))
    # Every exported call site is preserved, including unresolved indirect dispatch.
    graph=collections.Counter();call_counts=collections.Counter();unresolved=[];total_calls=0
    profiles={f['address']:{'address':f['address'],'callees':set(),'callers':set(),'call_sites':0,
        'unresolved_indirect_calls':0,'literal_addresses':set(),'rpc_name_candidates':set()} for f in functions}
    for edge in records(inv/'calls.jsonl'):
        total_calls+=1;caller=byaddress.get(edge['caller']);call_counts[edge['caller']]+=1
        profile=profiles.get(edge['caller'])
        if profile:profile['call_sites']+=1
        if not edge['resolved']:
            unresolved.append(edge)
            if profile:profile['unresolved_indirect_calls']+=1
        for target in edge['targets']:
            callee=byaddress.get(target['address'])
            if profile:profile['callees'].add(target['address'])
            if target['address'] in profiles:profiles[target['address']]['callers'].add(edge['caller'])
            graph[(caller['subsystem'] if caller else 'unknown',callee['subsystem'] if callee else 'target-not-function-entry')]+=1
    save(out/'subsystem-call-graph.json',[{'caller_subsystem':a,'callee_subsystem':b,'static_call_edges':n} for (a,b),n in sorted(graph.items())])
    jsonl(out/'unresolved-indirect-calls.jsonl',unresolved)
    stats={}
    for f in functions:
        group=stats.setdefault(f['subsystem'],{'functions':0,'status':collections.Counter(),'modules':set(),'representative_entries':[]})
        group['functions']+=1;group['status'][f['status']]+=1;group['modules'].add(f['module'])
        if len(group['representative_entries'])<12:group['representative_entries'].append({'address':f['address'],'name':f['name']})
    for s in stats.values():s['modules']=sorted(s['modules']);s['status']=dict(s['status'])
    save(out/'subsystems.json',stats)
    # Cross-references to validated managed literals are use-site evidence, not recovered server contracts.
    literals={s['address']:s for s in records(static/'managed-literals.jsonl')}
    uses=[];rpc_uses=[]
    for r in records(inv/'instruction-xrefs.jsonl'):
        if r['to'] in literals:
            s=literals[r['to']];use={**r,'text':s['text'],'function_name':byaddress.get(r['function'],{}).get('name'),
                'rpc_name_candidate':s['rpc_name_candidate'],'limit':'Referenced literal; argument role and server contract require dataflow verification'}
            uses.append(use)
            if s['rpc_name_candidate']:rpc_uses.append(use)
            profile=profiles.get(r['function'])
            if profile:
                profile['literal_addresses'].add(s['address'])
                if s['rpc_name_candidate']:profile['rpc_name_candidates'].add(s['text'])
    jsonl(out/'literal-use-sites.jsonl',uses);jsonl(out/'rpc-literal-use-sites.jsonl',rpc_uses)
    for f in functions:
        profile=profiles[f['address']]
        for key in ['callees','callers','literal_addresses','rpc_name_candidates']:profile[key]=sorted(profile[key])
        f['static_relationships']=profile
        if profile['unresolved_indirect_calls']:
            f['uncertainties'].append(str(profile['unresolved_indirect_calls'])+' indirect call site(s) have no resolved call-reference target')
    jsonl(out/'function-relationships.jsonl',profiles.values())
    jsonl(out/'function-inventory.jsonl',functions);save(out/'function-inventory.json',functions)
    with (out/'function-inventory.tsv').open('w') as file:
        fields=['address','name','module','subsystem','status','external','thunk','signature']
        w=csv.DictWriter(file,fields,delimiter='\t',extrasaction='ignore');w.writeheader();w.writerows(functions)
    # Validate archived direct E8 call destinations directly against uploaded bytes.
    edges={};bad=[]
    for p in (REFERENCE/'analysis').rglob('workflow-calls.tsv'):
        for r in csv.DictReader(p.open(),delimiter='\t'):
            if not r['callee_address']:continue
            try:
                site=int(r['call_site'],16);off=pe.offset(site-pe.image_base)
                if pe.data[off]!=0xe8:continue
                target=(site+5+struct.unpack_from('<i',pe.data,off+1)[0])&0xffffffff
                if target!=int(r['callee_address'],16):bad.append(r);continue
                key=(r['caller_address'],r['call_site'],r['callee_address'])
                edges[key]={**r,'validation':'E8 rel32 destination independently checked against uploaded executable','source':str(p)}
            except (ValueError,struct.error):bad.append(r)
    assert not bad,bad[:3]
    jsonl(out/'verified-archived-call-edges.jsonl',edges.values())
    missing_archives=[{'address':a,'names':sorted({r['function'] for r in rows}),'status':'unresolved-current-boundary'} for a,rows in archives.items() if a not in byaddress]
    save(out/'historical-entry-discovery-gaps.json',missing_archives)
    discovery=json.loads((ROOT/'evidence/inventory-final/program.json').read_text())
    coverage={'schema_version':1,'target_sha256':program['sha256'],'inventory_source':str(inv.relative_to(ROOT)),'internal_functions':sum(not f['external'] for f in functions),
        'external_functions':sum(f['external'] for f in functions),'total_functions':len(functions),
        'statuses':dict(collections.Counter(f['status'] for f in functions)),
        'all_inventory_entries_classified':all(f['subsystem'] and f['status'] in ['analyzed','partially_analyzed','unresolved'] and f['uncertainties'] for f in functions),
        'full_behavioral_recovery_complete':False,'discovery_complete_for_executable':False,
        'analysis_timeout':discovery.get('analysis_timeout'),'automatic_analysis_enabled':discovery.get('automatic_analysis_enabled'),
        'final_snapshot_analysis_enabled':program.get('automatic_analysis_enabled'),
        'static_call_sites':total_calls,'unresolved_indirect_call_sites':len(unresolved),
        'verified_import_thunks':len(thunks),'verified_small_function_semantics':len(leaf_proofs),
        'literal_use_sites':len(uses),'rpc_literal_use_sites':len(rpc_uses),'verified_archived_direct_call_sites':len(edges),
        'historical_entries_absent_from_current_function_inventory':len(missing_archives),
        'subsystems':{k:{'functions':v['functions'],'status':v['status']} for k,v in stats.items()},
        'limits':['Classification is not behavioral recovery','Automatic discovery may include false functions and miss code',
                  'A direct call/reference is a static edge, not proof of runtime reachability',
                  'MAP labels include data, RTTI and literals; only function manager entries counted as functions']}
    save(out/'coverage.json',coverage);print(json.dumps({k:v for k,v in coverage.items() if k!='subsystems'},indent=2))

if __name__=='__main__':main()
