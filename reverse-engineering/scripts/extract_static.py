"""Read target bytes/MAP and independently validate archived evidence. Never execute target."""
import bisect
import collections
import csv
import hashlib
import json
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REFERENCE = ROOT / 'reference-input'
sys.path.insert(0, str(ROOT / 'scripts/support'))
from inspect_chart import PE
from decode_dfm import Reader

def digest(data): return hashlib.sha256(data).hexdigest()
def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')
def jsonl(path, records):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open('w') as out:
        for record in records: out.write(json.dumps(record, ensure_ascii=False) + '\n')

def subsystem(module):
    m=module.lower()
    if m.startswith(('system','sysinit','vcl.','winapi.','xml.','soap.','data.','datasnap.','midas','web.','id')):
        return 'compiler-runtime-and-libraries'
    if any(s in m for s in ['trpcb','rpc','ornet','xwb','bapi','wsock','wcrypt','sspi','sso','ccow','contextor','vistaweb','webview']):
        return 'transport-authentication-and-integration'
    if any(s in m for s in ['cover','mvitals','vitals']): return 'cover-sheet-and-vitals'
    if m in ['fptsel','rcore','ucore','fframe','fpage'] or m.startswith(('fptsel','fduppt','fpatient')):
        return 'patient-context-and-shell'
    if any(s in m for s in ['order','uod','fod','surgery','consult','fcon','rcon','meds','pharm']):
        return 'orders-medications-and-consults'
    if any(s in m for s in ['note','tiu','dcsumm','fsign','fcosign','pce','encounter','remind','clinicalproc']):
        return 'documentation-encounters-and-reminders'
    if any(s in m for s in ['labs','report','rpt','graph','vital']): return 'results-reports-and-graphs'
    if any(s in m for s in ['orctrl','orfn','orclasses','orlist','orcombo','oraccess','508','accessib']):
        return 'shared-controls-and-accessibility'
    return 'other-module:' + module

def main():
    out=ROOT/'evidence/static'; out.mkdir(parents=True,exist_ok=True)
    exe=ROOT/'input/cprs/CPRSChart.exe'; mapfile=exe.with_suffix('.map')
    pe=PE(exe); data=pe.data
    assert digest(data)=='7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544'
    assert digest(mapfile.read_bytes())=='70fa1e8287a30895778711fe2a38d33eb095962b290b9985ec084700d9f4d08a'
    source_files=[{'path':str(x.relative_to(ROOT)),'bytes':x.stat().st_size,'sha256':digest(x.read_bytes())}
                  for x in sorted((ROOT/'input').rglob('*')) if x.is_file()]
    lines=mapfile.read_text(errors='replace').splitlines()
    bases={}; modules=[]; symbols={}
    for n,line in enumerate(lines,1):
        m=re.match(r'\s+([0-9A-F]{4}):([0-9A-F]{8}) ([0-9A-F]{8})H (\S+)\s+(\S+)',line)
        if m:
            seg,start,size,name,kind=m.groups();bases[int(seg,16)]=(int(start,16),int(size,16),name,kind)
    for n,line in enumerate(lines,1):
        m=re.match(r'\s+([0-9A-F]{4}):([0-9A-F]{8}) ([0-9A-F]{8}) C=(\S+)\s+S=(\S+)\s+G=(\S+)\s+M=(\S+)',line)
        if m:
            seg,off,size,kind,section,group,module=m.groups();seg=int(seg,16)
            if seg in bases:
                start=bases[seg][0]+int(off,16)
                modules.append({'module':module,'start':f'{start:08x}','end_exclusive':f'{start+int(size,16):08x}',
                                'size':int(size,16),'kind':kind,'section':section,'map_line':n,'subsystem':subsystem(module)})
        m=re.match(r'^ ([0-9A-F]{4}):([0-9A-F]{8})\s{2,}(\S+)\s*$',line)
        if m:
            seg,off,name=m.groups();seg=int(seg,16);off=int(off,16)
            if seg not in bases or off>=bases[seg][1]:continue
            at=bases[seg][0]+off
            try:offset=pe.offset(at-pe.image_base)
            except ValueError:continue
            symbols.setdefault((at,name),{'address':f'{at:08x}','name':name,'segment':seg,
                'map_line':n,'file_offset':offset,'kind':'public-symbol-not-proven-function'})
    jsonl(out/'map-symbols.jsonl',symbols.values());save(out/'map-modules.json',modules)
    with (out/'map-symbols.tsv').open('w') as target:
        target.write('address\tname\tmap_line\n')
        for symbol in symbols.values():target.write(f"{symbol['address']}\t{symbol['name']}\t{symbol['map_line']}\n")
    classes=[]
    for symbol in symbols.values():
        if '..' not in symbol['name']:continue
        at=int(symbol['address'],16);off=symbol['file_offset']
        try:
            words=struct.unpack_from('<11I',data,off)
            base=words[0]
            if base!=at+0x58:continue
            nameoff=pe.offset(words[8]-pe.image_base);n=data[nameoff]
            classname=data[nameoff+1:nameoff+1+n].decode('cp1252')
            if classname!=symbol['name'].split('..',1)[1] or not 4<=words[9]<=16_777_216:continue
            parentbase=None
            if words[10]:parentbase=struct.unpack_from('<I',data,pe.offset(words[10]-pe.image_base))[0]
            classes.append({'symbol':symbol['name'],'metadata_address':symbol['address'],
                'vmt_base':f'{base:08x}','class_name':classname,'class_name_address':f'{words[8]:08x}',
                'instance_size_bytes':words[9],'parent_reference_address':f'{words[10]:08x}' if words[10] else None,
                'parent_vmt_base':f'{parentbase:08x}' if parentbase else None,
                'prefix_words':[f'{v:08x}' for v in words],
                'validation':'self-pointer + MAP class name + bounded ShortString + instance size; field layouts unresolved'})
        except (ValueError,struct.error,UnicodeDecodeError):continue
    class_by_base={c['vmt_base']:c for c in classes}
    for c in classes:c['parent_class']=class_by_base.get(c['parent_vmt_base'],{}).get('symbol')
    jsonl(out/'classes.jsonl',classes)
    original=list(csv.DictReader((REFERENCE/'analysis/inventory/chart-symbols.tsv').open(),delimiter='\t'))
    assert {(r['address'],r['name']) for r in original}=={(r['address'],r['name']) for r in symbols.values()}
    # All imports, including IMAGE_DELAYLOAD_DESCRIPTOR entries; never resolve or call DLL code.
    nt=struct.unpack_from('<I',data,0x3c)[0]; opt=nt+24
    def cstr(rva):
        at=pe.offset(rva);return data[at:data.index(0,at)].decode('ascii',errors='replace')
    imports=[]
    for delayed,index,step in [(False,1,20),(True,13,32)]:
        rva,size=struct.unpack_from('<II',data,opt+96+index*8)
        if not rva:continue
        desc=pe.offset(rva)
        while any(data[desc:desc+step]):
            if delayed:
                attrs,name,_,iat,intab,_,_,_=struct.unpack_from('<8I',data,desc)
                if not attrs&1: name-=pe.image_base;iat-=pe.image_base;intab-=pe.image_base
            else:
                intab,_,_,name,iat=struct.unpack_from('<5I',data,desc)
            dll=cstr(name); thunks=pe.offset(intab or iat); k=0
            while entry:=struct.unpack_from('<I',data,thunks+k*4)[0]:
                symbol=f'ordinal:{entry&0xffff}' if entry&0x80000000 else cstr(entry+2)
                imports.append({'dll':dll,'symbol':symbol,'delayed':delayed,
                    'iat_address':f'{pe.image_base+iat+k*4:08x}','status':'external-contract-unresolved'})
                k+=1
            desc+=step
    jsonl(out/'imports.jsonl',imports)
    exports=[];rva,size=struct.unpack_from('<II',data,opt+96+0*8)
    if rva:
        at=pe.offset(rva);fields=struct.unpack_from('<IIHH7I',data,at)
        _,_,_,_,dll,base,nfunc,nnames,funcs,names,ordinals=fields
        byord={struct.unpack_from('<H',data,pe.offset(ordinals)+2*k)[0]:cstr(struct.unpack_from('<I',data,pe.offset(names)+4*k)[0]) for k in range(nnames)}
        for k in range(nfunc):
            target=struct.unpack_from('<I',data,pe.offset(funcs)+4*k)[0]
            if target:exports.append({'ordinal':base+k,'name':byord.get(k),'address':f'{pe.image_base+target:08x}',
                                      'forwarder':cstr(target) if rva<=target<rva+size else None})
    save(out/'exports.json',exports)
    # Managed literal candidates have a validated Delphi header, extent and terminator.
    literals=[]
    for sec in pe.sections:
        start=sec['raw_offset'];end=start+sec['raw_size'];pos=start
        while True:
            rc=data.find(b'\xff\xff\xff\xff',pos,end)
            if rc<0:break
            pos=rc+4
            if rc<start+4 or rc+8>end:continue
            cp,width=struct.unpack_from('<HH',data,rc-4);length=struct.unpack_from('<i',data,rc+4)[0];at=rc+8
            if width not in (1,2) or cp not in (0,1200,1252,65001) or not 1<=length<=1_000_000:continue
            stop=at+length*width
            if stop+width>end or data[stop:stop+width]!=b'\0'*width:continue
            try:text=data[at:stop].decode('utf-16-le' if width==2 else 'utf-8' if cp==65001 else 'cp1252')
            except UnicodeDecodeError:continue
            if any(not(c.isprintable() or c in '\r\n\t') for c in text):continue
            literals.append({'address':f'{pe.image_base+sec["rva"]+at-start:08x}','header_address':f'{pe.image_base+sec["rva"]+at-start-12:08x}',
                'file_offset':at,'codepage':cp,'element_width':width,'length':length,'text':text,
                'rpc_name_candidate':bool(re.fullmatch(r'(?:OR[A-Z0-9]*|TIU|DG|XWB|GMV|XUS|SD|USR|HDR|GMPL|GMR[A-Z]*) [A-Z0-9 /&_.-]+',text)),
                'validation':'header-and-file-bytes; use sites require separate review'})
    jsonl(out/'managed-literals.jsonl',literals)
    resources=pe.resources();resource_inventory=[];bindings=[]
    handler_index=collections.defaultdict(list)
    for symbol in symbols.values():
        parts=symbol['name'].rsplit('.',2)
        if len(parts)==3:handler_index[parts[1]+'.'+parts[2]].append(symbol)
    for index,r in enumerate(resources):
        raw=data[r['file_offset']:r['file_offset']+r['size']]
        rec={**r,'address':f'{pe.image_base+r["rva"]:08x}','sha256':digest(raw)}
        if raw.startswith(b'TPF0'):
            try:
                reader=Reader(raw);reader.take(4);form=reader.component()
                assert reader.at==len(raw),f'trailing bytes at {reader.at}'
                name=re.sub('[^A-Za-z0-9_.-]','_',str(r['path'][1]));dest=out/'forms'/f'{index:04}-{name}.json'
                save(dest,form);rec.update({'decode_status':'complete','decoded':str(dest.relative_to(ROOT)),
                    'root_class':form['class'],'root_name':form['name']})
                def visit(node,path):
                    for key,value in node['properties'].items():
                        if key.startswith('On') and isinstance(value,str):
                            matches=handler_index.get(form['class']+'.'+value,[])
                            bindings.append({'resource_address':rec['address'],'form':form['class'],'component':path,
                                'event':key,'handler':value,'map_matches':matches,'source':str(dest.relative_to(ROOT))})
                    for child in node['children']:visit(child,path+'.'+child['name'])
                visit(form,form['name'])
            except (ValueError,IndexError,AssertionError,UnicodeDecodeError,struct.error) as e:
                rec.update({'decode_status':'failed','error':str(e)})
        resource_inventory.append(rec)
    save(out/'resources.json',resource_inventory);jsonl(out/'form-bindings.jsonl',bindings)
    # Verify all archived instructions, annotated literals, and bounded VMT words against uploaded bytes.
    archive_records=[];mismatches=[];insn_count=0;literal_count=0;vmt_count=0
    for tsv in sorted((REFERENCE/'analysis').rglob('workflow-functions.tsv')):
        for fn in csv.DictReader(tsv.open(),delimiter='\t'):
            if fn['status']!='decompiled':continue
            source=tsv.parent/fn['file'];asm=source.with_suffix('.asm');count=0;bad=[]
            for line in (asm.read_text().splitlines() if asm.exists() else []):
                m=re.match(r'^([0-9a-fA-F]+)  ([0-9a-fA-F]+)  (.+)$',line)
                if not m:continue
                address,raw,_=m.groups();address=int(address,16);raw=bytes.fromhex(raw)
                try:at=pe.offset(address-pe.image_base);valid=data[at:at+len(raw)]==raw
                except ValueError:valid=False
                if not valid:bad.append(f'{address:08x}')
                count+=1
            insn_count+=count
            record={**fn,'source_c':str(source),'source_asm':str(asm) if asm.exists() else None,'instructions_checked':count,
                'byte_mismatches':bad,'sha256_c':digest(source.read_bytes()),'sha256_asm':digest(asm.read_bytes()) if asm.exists() else None,
                'analysis_status':'partially_analyzed','limit':'Matching instruction bytes does not prove complete function bounds, paths, ABI or decompiler semantics'}
            archive_records.append(record);mismatches+=bad
    for p in (REFERENCE/'analysis').rglob('workflow-evidence.json'):
        for record in json.loads(p.read_text()):
            for lit in record.get('delphi_string_literals',[]):
                at=pe.offset(int(lit['address'],16)-pe.image_base);width=lit['element_width']
                raw=lit['text'].encode('utf-16-le' if width==2 else 'utf-8' if lit['codepage']==65001 else 'cp1252')
                if data[at:at+len(raw)]!=raw:mismatches.append('literal:'+lit['address'])
                literal_count+=1
    for p in (REFERENCE/'analysis').rglob('vmt.json'):
        j=json.loads(p.read_text())
        for word in [j['class_pointer']]+j['slots']:
            at=pe.offset(int(word['address'],16)-pe.image_base)
            if data[at:at+4].hex()!=word['bytes']:mismatches.append('vmt:'+word['address'])
            vmt_count+=1
    jsonl(out/'archived-functions.jsonl',archive_records)
    summary={'schema_version':1,'executable':{'name':exe.name,'path':str(exe),'sha256':digest(data),'bytes':len(data),
        'machine':hex(pe.machine),'image_base':f'{pe.image_base:08x}','entry':f'{pe.image_base+pe.entry_rva:08x}'},
        'inputs':source_files,'map_symbols':len(symbols),'map_module_regions':len(modules),
        'managed_literal_candidates':len(literals),'rpc_name_candidates':sum(s['rpc_name_candidate'] for s in literals),
        'normal_imports':sum(not i['delayed'] for i in imports),'delayed_imports':sum(i['delayed'] for i in imports),
        'classes_validated':len(classes),'exports':len(exports),'resources':len(resources),'forms_decoded':sum(r.get('decode_status')=='complete' for r in resource_inventory),
        'forms_failed':sum(r.get('decode_status')=='failed' for r in resource_inventory),'form_event_bindings':len(bindings),
        'archived_function_records':len(archive_records),'archived_unique_functions':len({f['address'] for f in archive_records}),
        'archived_instructions_checked':insn_count,'archived_literals_checked':literal_count,'archived_vmt_words_checked':vmt_count,
        'byte_mismatches':mismatches,'target_executed':False}
    save(out/'summary.json',summary);print(json.dumps({k:v for k,v in summary.items() if k!='inputs'},indent=2))
    if mismatches:raise SystemExit('Archived evidence differs from target bytes')

if __name__=='__main__':main()
