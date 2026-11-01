"""Identify provisional code-entry candidates from independently extracted metadata."""
import collections
import json
import struct
from extract_static import ROOT, PE, jsonl

def main():
    static=ROOT/'evidence/static';pe=PE(ROOT/'input/cprs/CPRSChart.exe');symbols=collections.defaultdict(list)
    for line in (static/'map-symbols.jsonl').read_text().splitlines():
        r=json.loads(line);symbols[r['address']].append(r['name'])
    def executable(at):
        return any(pe.image_base+s['rva']<=at<pe.image_base+s['rva']+s['virtual_size'] for s in pe.sections if s['name'] in ['.text','.itext'])
    candidates={}
    def add(at,name,kind,source):
        if not executable(int(at,16)) or '..' in name:return
        r=candidates.setdefault(at,{'address':at,'name':name,'sources':[]})
        r['sources'].append({'kind':kind,'source':source})
    for line in (static/'form-bindings.jsonl').read_text().splitlines():
        r=json.loads(line)
        for m in r['map_matches']:add(m['address'],m['name'],'serialized-form-handler',r['form']+'.'+r['component']+'.'+r['event'])
    for line in (static/'classes.jsonl').read_text().splitlines():
        c=json.loads(line);base=int(c['vmt_base'],16);end=int(c['class_name_address'],16)
        # This bounded metadata interval supplies code pointers, not verified complete virtual-method semantics.
        if not base<end<=base+4096:continue
        for at in range(base,end-3,4):
            try:target=struct.unpack_from('<I',pe.data,pe.offset(at-pe.image_base))[0]
            except ValueError:continue
            key=f'{target:08x}'
            if key not in symbols:continue
            name=next((n for n in symbols[key] if '..' not in n),None)
            if name and executable(target):add(key,name,'class-table-code-pointer',f'{at:08x} in '+c['symbol'])
    for line in (static/'archived-functions.jsonl').read_text().splitlines():
        r=json.loads(line);add(r['address'],r['function'],'archived-function',r['source_c'])
    for line in (ROOT/'batches/review-targets.tsv').read_text().splitlines()[1:]:
        at,name=line.split('\t');add(at,name,'selected-MAP-entry','review-targets.tsv')
    jsonl(ROOT/'batches/discovery-targets.jsonl',(v for _,v in sorted(candidates.items())))
    print('Provisional discovery candidates:',len(candidates))

if __name__=='__main__':main()
