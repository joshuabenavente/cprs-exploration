"""Conservative exact-byte semantics for complete, very small x86 function bodies.

This does not infer Pascal types or field names. Effects are normal-path machine semantics.
"""
import struct

def recognize(raw, address):
    if not raw:return None
    def result(kind,effect,**extra):
        return {'kind':kind,'effect':effect,'bytes':raw.hex(),'address':f'{address:08x}',**extra}
    if raw==b'\xc3' or raw==b'\x55\x8b\xec\x5d\xc3':
        return result('return-only','Returns to caller; no net general-register change from these instructions')
    if len(raw)==3 and raw[0]==0xc2:
        return result('return-with-stack-adjust','Returns and advances stack by the encoded immediate',stack_adjust_bytes=int.from_bytes(raw[1:],'little'))
    if len(raw)==6 and raw[0]==0xb8 and raw[-1]==0xc3:
        return result('constant-eax','Sets EAX to a 32-bit immediate and returns',constant_u32=int.from_bytes(raw[1:5],'little'))
    if len(raw)==3 and raw[0]==0xb0 and raw[-1]==0xc3:
        return result('constant-al','Sets AL to an 8-bit immediate and returns; upper EAX bits are unchanged',constant_u8=raw[1])
    if raw in [b'\x33\xc0\xc3',b'\x31\xc0\xc3']:
        return result('zero-eax','XOR EAX,EAX then returns; arithmetic flags are changed')
    if raw==b'\x8b\xc2\xc3':
        return result('copy-edx-to-eax','Copies EDX into EAX and returns')
    if len(raw)==5 and raw[0]==0xe9:
        target=(address+5+struct.unpack_from('<i',raw,1)[0])&0xffffffff
        return result('direct-tail-transfer','Unconditional relative jump; delegates remaining behavior',target_address=f'{target:08x}')
    # The ModR/M forms below all use EAX as base, with optional signed displacement.
    patterns=[(b'\x8b',0x00,0x40,0x80,'read',4,'EAX'),
              (b'\x8a',0x00,0x40,0x80,'read',1,'AL'),
              (b'\x89',0x10,0x50,0x90,'write',4,'EDX'),
              (b'\x88',0x10,0x50,0x90,'write',1,'DL'),
              (b'\x0f\xb6',0x00,0x40,0x80,'read-zero-extend',1,'EAX'),
              (b'\x0f\xb7',0x00,0x40,0x80,'read-zero-extend',2,'EAX')]
    for op,plain,disp8,disp32,access,width,reg in patterns:
        if not raw.startswith(op) or raw[-1]!=0xc3:continue
        n=len(op)
        if len(raw)==n+2 and raw[n]==plain:offset=0
        elif len(raw)==n+3 and raw[n]==disp8:offset=struct.unpack_from('<b',raw,n+1)[0]
        elif len(raw)==n+6 and raw[n]==disp32:offset=struct.unpack_from('<i',raw,n+1)[0]
        else:continue
        return result('scalar-field-'+access,
            f'{access} {width} byte(s) at incoming EAX plus signed offset {offset}, using {reg}, then returns',
            access=access,width_bytes=width,base_register='EAX',offset=offset,value_register=reg)
    return None
