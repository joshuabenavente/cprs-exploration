"""Package the saved analysis and evidence; omit caches and redundant intermediate inventories."""
import hashlib
import json
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    files=set()
    for p in ROOT.iterdir():
        if p.is_file() and p.suffix in ['.md','.json','.log']:files.add(p)
    for directory in ['input','scripts','reference-input','catalog','projects','batches','evidence','validation']:
        for p in (ROOT/directory).rglob('*'):
            if not p.is_file() or '__pycache__' in p.parts or 'compiled-scripts' in p.parts:continue
            rel=p.relative_to(ROOT)
            # Preserve the complete reviewed inventory; intermediate summaries/logs retain provenance.
            if directory=='evidence' and any(part in ['inventory-baseline','inventory-seeded','inventory-final'] for part in rel.parts):
                if p.name!='program.json':continue
            files.add(p)
    manifest=[]
    for p in sorted(files):
        h=hashlib.sha256()
        with p.open('rb') as source:
            for chunk in iter(lambda:source.read(1024*1024),b''):h.update(chunk)
        manifest.append({'path':str(p.relative_to(ROOT)),'bytes':p.stat().st_size,'sha256':h.hexdigest()})
    bundle=ROOT/'cprs-reverse-engineering.zip'
    with zipfile.ZipFile(bundle,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=5,allowZip64=True) as z:
        for p in sorted(files):z.write(p,'cprs-reverse-engineering/'+str(p.relative_to(ROOT)))
        z.writestr('cprs-reverse-engineering/BUNDLE-MANIFEST.json',json.dumps({'files':manifest,'target_executed':False},indent=2)+'\n')
    with zipfile.ZipFile(bundle) as z:assert z.testzip() is None
    h=hashlib.sha256()
    with bundle.open('rb') as source:
        for chunk in iter(lambda:source.read(1024*1024),b''):h.update(chunk)
    receipt={'path':str(bundle),'bytes':bundle.stat().st_size,'sha256':h.hexdigest(),
        'files':len(manifest)+1,'zip_crc_validation':'passed','includes_saved_ghidra_project':True}
    (ROOT/'validation/bundle-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print(json.dumps(receipt,indent=2))

if __name__=='__main__':main()
