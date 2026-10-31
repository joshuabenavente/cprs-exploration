; Static instruction listing. Function bodies and indirect exception flow require review.
01179ba0  55  PUSH EBP
01179ba1  8bec  MOV EBP,ESP
01179ba3  51  PUSH ECX
01179ba4  8945fc  MOV dword ptr [EBP + -0x4],EAX
01179ba7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
01179baa  e821990800  CALL 0x012034d0
01179baf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
01179bb2  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
01179bb8  8b10  MOV EDX,dword ptr [EAX]
01179bba  ff9278010000  CALL dword ptr [EDX + 0x178]
01179bc0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
01179bc3  e8383c0000  CALL 0x0117d800
01179bc8  a1e0a92501  MOV EAX,[0x0125a9e0]
01179bcd  e8ee1b0600  CALL 0x011db7c0
01179bd2  833de4a9250100  CMP dword ptr [0x0125a9e4],0x0
01179bd9  740a  JZ 0x01179be5
01179bdb  a1e4a92501  MOV EAX,[0x0125a9e4]
01179be0  8b10  MOV EDX,dword ptr [EAX]
01179be2  ff5208  CALL dword ptr [EDX + 0x8]
01179be5  833de8a9250100  CMP dword ptr [0x0125a9e8],0x0
01179bec  740a  JZ 0x01179bf8
01179bee  a1e8a92501  MOV EAX,[0x0125a9e8]
01179bf3  8b10  MOV EDX,dword ptr [EAX]
01179bf5  ff5208  CALL dword ptr [EDX + 0x8]
01179bf8  e8f733bbff  CALL 0x00d2cff4
01179bfd  59  POP ECX
01179bfe  5d  POP EBP
01179bff  c3  RET
