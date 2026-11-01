"""Verify selected architectural claims directly against uploaded executable bytes."""
import json
import struct
from pathlib import Path
from extract_static import ROOT, PE, save

def main():
    pe=PE(ROOT/'input/cprs/CPRSChart.exe');claims=[]
    checks=[
      ('START-01','Entry calls Delphi initialization helper',0x01224048,0x00413340),
      ('START-02','Entry calls a boolean-tested startup helper',0x01224061,0x009b8440),
      ('CTX-01','New-patient menu calls patient selector',0x00ff50d3,0x00e81038),
      ('CTX-02','New-patient menu calls chart patient setup',0x00ff5276,0x00ff1f14),
      ('CTX-03','OK handler calls sensitive-patient access helper',0x00e82e08,0x011d3630),
      ('CTX-04','OK handler calls death-date helper',0x00e82e14,0x011ce34c),
      ('CTX-05','Commit helper calls patient setter',0x00e830cb,0x011d4918),
      ('CTX-06','Commit helper calls encounter clearing',0x00e830d7,0x011d4e80),
      ('CTX-07','Commit helper calls change clearing',0x00e830e3,0x011d5ac8),
      ('CTX-08','Patient setter calls patient retrieval wrapper',0x011d496c,0x011cec4c),
      ('RPC-01','Subset wrapper calls central CallVistA overload',0x011cdedd,0x009ada80),
      ('RPC-02','CallVistA overload creates temporary TStringList',0x009ad78e,0x004d81f4),
      ('RPC-03','CallVistA overload calls central overload',0x009ad7b3,0x009ada80),
      ('RPC-04','CallVistA overload frees temporary object',0x009ad7d0,0x004090bc),
      ('NOTE-01','Note selection calls document text wrapper',0x00e196f8,0x00a0b870),
      ('ORDER-01','Order double-click calls detail handler',0x0117f5ee,0x0117cc00),
      ('LAB-01','Lab date selection calls interim wrapper',0x00eaa438,0x00c867c8),
      ('LAB-02','Selected-test branch calls interim-selection wrapper',0x00eaa533,0x00c86c80),
      ('VITAL-01','Vitals action calls write-access helper',0x00be2356,0x01011c80),
      ('VITAL-02','Vitals action calls external-integration wrapper',0x00be23d5,0x00ae6cb0),
      ('VIEW-01','Common Cover Sheet show handler calls report viewer',0x00bd4979,0x01007fec),
      ('MED-01','Medication population calls medication preprocessing',0x00bd5f72,0x00add94c),
    ]
    for ident,statement,site,target in checks:
        off=pe.offset(site-pe.image_base);raw=pe.data[off:off+5]
        assert raw[0]==0xe8,(ident,raw.hex())
        actual=(site+5+struct.unpack_from('<i',raw,1)[0])&0xffffffff
        assert actual==target,(ident,hex(actual),hex(target))
        claims.append({'id':ident,'statement':statement,'instruction_address':f'{site:08x}',
            'target_address':f'{target:08x}','bytes':raw.hex(),'verification':'E8 rel32 decoded independently from uploaded bytes',
            'status':'verified-static-edge','limits':['Does not prove runtime reachability, branch predicates, argument meanings or downstream effects']})
    # Read the fixed version structure, independently of historical version metadata.
    at=0x0155ba84;off=pe.offset(at-pe.image_base);words=struct.unpack_from('<13I',pe.data,off)
    assert words[0]==0xfeef04bd
    version=[words[2]>>16,words[2]&65535,words[3]>>16,words[3]&65535];assert version==[1,33,214,5]
    claims.append({'id':'IDENTITY-01','statement':'File version is 1.33.214.5','data_address':f'{at:08x}',
        'verification':'VS_FIXEDFILEINFO signature and file-version words decoded from resource bytes','status':'verified-static-data'})
    # Bounded VMT entries plus class metadata prefix are individually checked by extract_static.py.
    save(ROOT/'catalog/verified-claims.json',claims)
    print('Verified',len(claims),'address-backed claims')

if __name__=='__main__':main()
