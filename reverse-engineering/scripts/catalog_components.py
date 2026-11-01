"""Extract DLL dependency/export surfaces and the byte-verified XWB pad table."""
import hashlib
import json
import struct
from extract_static import ROOT, PE, save

def main():
    components=[]
    for path in sorted((ROOT/'input/cprs').glob('*.dll')):
        pe=PE(path);d=pe.data;nt=struct.unpack_from('<I',d,0x3c)[0];opt=nt+24
        rva,size=struct.unpack_from('<II',d,opt+96);exports=[]
        def cstr(r):
            p=pe.offset(r);return d[p:d.index(0,p)].decode('ascii',errors='replace')
        if rva:
            _,_,_,_,dll,base,nfunc,nnames,funcs,names,ordinals=struct.unpack_from('<IIHH7I',d,pe.offset(rva))
            named={struct.unpack_from('<H',d,pe.offset(ordinals)+i*2)[0]:cstr(struct.unpack_from('<I',d,pe.offset(names)+i*4)[0]) for i in range(nnames)}
            for i in range(nfunc):
                dest=struct.unpack_from('<I',d,pe.offset(funcs)+i*4)[0]
                if dest:exports.append({'ordinal':base+i,'name':named.get(i),'address':f'{pe.image_base+dest:08x}',
                    'forwarder':cstr(dest) if rva<=dest<rva+size else None,'contract_status':'unresolved'})
        components.append({'file':str(path.relative_to(ROOT)),'sha256':hashlib.sha256(d).hexdigest(),
            'bytes':len(d),'machine':hex(pe.machine),'image_base':f'{pe.image_base:08x}',
            'entry':f'{pe.image_base+pe.entry_rva:08x}','normal_import_dlls':pe.imports(),'exports':exports,
            'implementation_status':'not semantically analyzed; exported interface metadata only'})
    save(ROOT/'catalog/components.json',components)
    pe=PE(ROOT/'input/cprs/CPRSChart.exe')
    literals={r['address']:r for r in (json.loads(s) for s in (ROOT/'evidence/static/managed-literals.jsonl').read_text().splitlines())}
    pads=[]
    for i in range(20):
        word=0x012350e8+i*4;ptr=struct.unpack_from('<I',pe.data,pe.offset(word-pe.image_base))[0]
        lit=literals[f'{ptr:08x}'];assert lit['length']==len(set(lit['text']))==94
        pads.append({'index':i,'table_word_address':f'{word:08x}','literal':lit,'unique_characters':94})
    assert all(set(p['literal']['text'])==set(pads[0]['literal']['text']) for p in pads)
    save(ROOT/'catalog/cipher-pads.json',pads)
    print('DLL components:',len(components),'export entries:',sum(len(c['exports']) for c in components),'XWB pads:',len(pads))

if __name__=='__main__':main()
