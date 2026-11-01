"""Produce bounded, byte-checked call/literal annotations for a selected export batch."""
import collections
import json
import re
import struct
import sys
from pathlib import Path
from extract_static import ROOT, PE, save

def main():
    batch=ROOT/'evidence'/(sys.argv[1] if len(sys.argv)>1 else 'batch-0001')
    static=ROOT/'evidence/static';pe=PE(ROOT/'input/cprs/CPRSChart.exe')
    names=collections.defaultdict(list)
    for line in (static/'map-symbols.jsonl').read_text().splitlines():
        s=json.loads(line);names[s['address']].append(s['name'])
    literals={s['address']:s for s in (json.loads(l) for l in (static/'managed-literals.jsonl').read_text().splitlines())}
    findings=[]
    for path in sorted(batch.glob('*.json')):
        if not re.fullmatch('[0-9a-fA-F]+',path.stem):continue
        f=json.loads(path.read_text());asm=path.with_suffix('.asm');calls=[];uses=[];instructions=[]
        if not asm.exists():continue
        for line in asm.read_text().splitlines():
            m=re.match(r'^([0-9a-fA-F]+)  ([0-9a-fA-F]+)  (.+)$',line)
            if not m:continue
            site,raw,ins=m.groups();siteval=int(site,16);rawbytes=bytes.fromhex(raw)
            off=pe.offset(siteval-pe.image_base);assert pe.data[off:off+len(rawbytes)]==rawbytes
            instructions.append((site,ins))
            if rawbytes[0]==0xe8 and len(rawbytes)==5:
                target=f'{(siteval+5+struct.unpack_from("<i",rawbytes,1)[0])&0xffffffff:08x}'
                calls.append({'site':site,'target':target,'names':names.get(target,[]),'bytes':raw})
            for value in re.findall(r'0x([0-9a-fA-F]{6,8})',ins):
                at=f'{int(value,16):08x}'
                if at in literals:
                    uses.append({'site':site,'instruction':ins,'literal':literals[at]})
        rec={**f,'instructions_verified':len(instructions),'direct_calls':calls,'literal_references':uses,
            'indirect_calls':[{'site':at,'instruction':s} for at,s in instructions if s.startswith('CALL') and '0x' not in s.split(' ',1)[1].split('[')[0]],
            'control_flow_limits':[{'site':at,'instruction':s} for at,s in instructions if s.startswith('JMP') and not re.match(r'JMP 0x[0-9a-f]+$',s)],
            'scope':'Call/literal annotations verified; full behavioral/ABI recovery remains partial'}
        findings.append(rec)
        print(f['address'],f['name'],'instructions',len(instructions))
        for c in calls:
            relevant=[n for n in c['names'] if not n.startswith(('System.','SysInit.','Winapi.','Vcl.'))]
            if relevant:print(' CALL',c['site'],c['target'],', '.join(relevant))
        for u in uses:
            if u['literal']['rpc_name_candidate'] or any(s in u['literal']['text'].lower() for s in ['.dll','connect','error','signature','broker','logon','login']):
                print(' LITERAL',u['site'],u['literal']['address'],repr(u['literal']['text'][:240]))
    save(batch/'annotations.json',findings)

if __name__=='__main__':main()
