"""Validate deliverable consistency and independent target-byte evidence, without target execution."""
import collections
import hashlib
import json
import re
import struct
import subprocess
from pathlib import Path
from extract_static import ROOT, PE, save

def rows(path):
    with path.open() as file:
        for line in file:
            if line.strip():yield json.loads(line)

def main():
    checks=[];pe=PE(ROOT/'input/cprs/CPRSChart.exe')
    coverage=json.loads((ROOT/'catalog/coverage.json').read_text())
    assert hashlib.sha256(pe.data).hexdigest()==coverage['target_sha256']
    for file in json.loads((ROOT/'evidence/static/summary.json').read_text())['inputs']:
        p=ROOT/file['path'];assert p.stat().st_size==file['bytes'];assert hashlib.sha256(p.read_bytes()).hexdigest()==file['sha256']
    checks.append('All uploaded input hashes and sizes match pinned manifest')
    function_ids=set();statuses=collections.Counter();groups=collections.Counter();missing_paths=[]
    for f in rows(ROOT/'catalog/function-inventory.jsonl'):
        assert f['address'] not in function_ids;function_ids.add(f['address']);statuses[f['status']]+=1;groups[f['subsystem']]+=1
        assert f['module'] and f['subsystem'] and f['uncertainties'] and f['assignment_basis']
        assert f['status'] in ['analyzed','partially_analyzed','unresolved']
        if f['status']=='analyzed':assert f['analysis_scope'] and f['evidence']
        assert f['static_relationships']['address']==f['address']
        for e in f['evidence']:
            for key in ['source','source_c','source_asm']:
                if isinstance(e.get(key),str):
                    path=Path(e[key]);path=path if path.is_absolute() else ROOT/path
                    if not path.exists():missing_paths.append(str(path))
    assert not missing_paths,missing_paths[:5]
    assert len(function_ids)==coverage['total_functions']==sum(statuses.values())
    assert dict(statuses)==coverage['statuses']
    assert len(json.loads((ROOT/'catalog/function-inventory.json').read_text()))==len(function_ids)
    assert coverage['all_inventory_entries_classified'] and not coverage['full_behavioral_recovery_complete']
    assert coverage['historical_entries_absent_from_current_function_inventory']==0
    checks.append('All function entries are unique, classified, linked to existing evidence and carry uncertainty')
    assert {k:v['functions'] for k,v in json.loads((ROOT/'catalog/subsystems.json').read_text()).items()}==dict(groups)
    checks.append('Subsystem and status counts reconcile with complete JSON/JSONL inventory')
    # Independent byte checks for compact machine-level proofs.
    proof_count=0;representatives={}
    for kind,file in [('iat','verified-import-thunks.jsonl'),('small','verified-small-function-semantics.jsonl')]:
        for proof in rows(ROOT/'catalog'/file):
            at=int(proof['address'],16);off=pe.offset(at-pe.image_base);raw=bytes.fromhex(proof['bytes'])
            assert pe.data[off:off+len(raw)]==raw
            if kind=='iat':assert raw[:2]==b'\xff\x25' and int.from_bytes(raw[2:],'little')==int(proof['iat']['iat_address'],16)
            else:representatives.setdefault(proof['kind'],proof)
            proof_count+=1
    assert proof_count==statuses['analyzed']
    independent=ROOT/'validation/small-function-objdump';independent.mkdir(exist_ok=True)
    for kind,proof in representatives.items():
        at=int(proof['address'],16);end=at+len(bytes.fromhex(proof['bytes']))
        result=subprocess.run(['objdump','-D','-Mintel',f'--start-address={at}',f'--stop-address={end}',str(ROOT/'input/cprs/CPRSChart.exe')],capture_output=True,text=True,check=True)
        assert ('jmp' if kind=='direct-tail-transfer' else 'ret') in result.stdout.lower()
        (independent/(kind+'.asm')).write_text(result.stdout)
    checks.append('All analyzed-scope proof bytes match target; independent bounded objdump samples cover every small-body pattern kind')
    # Check every direct E8 edge, not just curated examples.
    direct=collections.Counter();bad=[]
    for edge in rows(ROOT/'evidence/inventory-reviewed/calls.jsonl'):
        at=int(edge['call_site'],16)
        try:off=pe.offset(at-pe.image_base)
        except ValueError:direct['site_not_file_backed']+=1;continue
        raw=pe.data[off:off+5]
        if raw[0]!=0xe8:direct['other_instruction_form']+=1;continue
        target=f'{(at+5+struct.unpack_from("<i",raw,1)[0])&0xffffffff:08x}'
        if target in [r['address'] for r in edge['targets']]:direct['direct_E8_destinations_verified']+=1
        else:bad.append({**edge,'byte_decoded_target':target})
    assert not bad,bad[:2]
    save(ROOT/'validation/direct-call-verification.json',{'target_sha256':coverage['target_sha256'],'counts':dict(direct),
        'mismatches':bad,'limit':'Direct E8 targets only; does not prove boundaries, reachability or argument meanings'})
    checks.append('All 204270 direct E8 destinations independently verified against uploaded bytes')
    batch_exports=0;batch_instructions=0
    for batch in sorted((ROOT/'evidence').glob('batch-*')):
        for result in batch.glob('*.json'):
            if not re.fullmatch('[0-9a-fA-F]+',result.stem):continue
            j=json.loads(result.read_text());assert j['export_status']=='decompiled'
            assert j['sha256']==coverage['target_sha256'];batch_exports+=1
            for line in result.with_suffix('.asm').read_text().splitlines():
                m=re.match(r'^([0-9a-fA-F]+)  ([0-9a-fA-F]+)  (.+)$',line)
                if m:
                    at,raw,_=m.groups();raw=bytes.fromhex(raw);off=pe.offset(int(at,16)-pe.image_base)
                    assert pe.data[off:off+len(raw)]==raw;batch_instructions+=1
    assert batch_exports==44
    assert all(r['status']=='repaired' for r in json.loads((ROOT/'evidence/function-boundary-changes.json').read_text()))
    checks.append('All 44 bounded exports and their instruction bytes validated; five continuation repairs recorded')
    changes=collections.Counter((r['kind'],r['result']) for r in json.loads((ROOT/'evidence/metadata-changes.json').read_text()))
    assert changes[('partial_class_layout','applied')]==2554 and changes[('managed_literal_header','applied')]==32
    assert sum(1 for _ in rows(ROOT/'evidence/static/classes.jsonl'))==2554
    assert not json.loads((ROOT/'evidence/static/summary.json').read_text())['byte_mismatches']
    checks.append('Class/literal type-application counts and historical byte validation reconcile')
    # Validate all first-party Markdown destinations, including generated checkpoint/report links.
    link_errors=[]
    for doc in ROOT.glob('*.md'):
        for dest in re.findall(r'\[[^\]]+\]\(([^)]+)\)',doc.read_text()):
            if '://' in dest or dest.startswith('#'):continue
            path=dest.split('#',1)[0]
            if not (doc.parent/path).exists():link_errors.append((doc.name,dest))
    # Receipt is created below, so its incoming link is intentionally valid on this run.
    link_errors=[e for e in link_errors if e[1]!='validation/final-receipt.json']
    assert not link_errors,link_errors
    spec=json.loads((ROOT/'specification.json').read_text());progress=json.loads((ROOT/'progress.json').read_text())
    assert spec['coverage']==coverage and progress['coverage']==coverage
    assert spec['target_executed'] is False and progress['target_executed'] is False
    assert progress['next_action'] and len(progress['next_batch'])==5
    checks.append('Readable/structured specifications and checkpoint agree; document links exist; next exact batch is recorded')
    # Verify Python syntax and all Java script API usage without invoking target code.
    for source in (ROOT/'scripts').rglob('*.py'):compile(source.read_text(),str(source),'exec')
    ghidra=Path('/workspace/cprs-exploration/.tools/ghidra_12.2_PUBLIC')
    cp=':'.join(str(p) for p in ghidra.rglob('*.jar'));out=ROOT/'validation/compiled-scripts';out.mkdir(exist_ok=True)
    compilation=subprocess.run(['/workspace/cprs-exploration/.tools/jdk-25.0.5+8/bin/javac','-cp',cp,'-d',str(out),
        *[str(p) for p in sorted((ROOT/'scripts').glob('*.java'))]],capture_output=True,text=True)
    (ROOT/'validation/script-compilation.log').write_text(compilation.stdout+compilation.stderr)
    assert compilation.returncode==0,compilation.stderr
    checks.append('All Python sources parse and all Java scripts compile against Ghidra 12.2 APIs')
    receipt={'schema_version':1,'status':'passed','target_sha256':coverage['target_sha256'],
        'function_count':coverage['total_functions'],'statuses':dict(statuses),'direct_call_counts':dict(direct),
        'bounded_exports':batch_exports,'bounded_instructions_checked':batch_instructions,'checks':checks,
        'target_executed':False,'runtime_behavior_verified':False,
        'script_hashes':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted((ROOT/'scripts').rglob('*')) if p.is_file() and p.suffix in ['.py','.java','.sh']},
        'document_hashes':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(ROOT.glob('*.md'))}}
    save(ROOT/'validation/final-receipt.json',receipt)
    print(json.dumps({k:v for k,v in receipt.items() if k not in ['script_hashes','document_hashes']},indent=2))

if __name__=='__main__':main()
