; Static instruction listing. Function bodies and indirect exception flow require review.
011cdeb0  55  PUSH EBP
011cdeb1  8bec  MOV EBP,ESP
011cdeb3  83c4f0  ADD ESP,-0x10
011cdeb6  53  PUSH EBX
011cdeb7  56  PUSH ESI
011cdeb8  57  PUSH EDI
011cdeb9  8bf9  MOV EDI,ECX
011cdebb  8bf2  MOV ESI,EDX
011cdebd  8bd8  MOV EBX,EAX
011cdebf  53  PUSH EBX
011cdec0  6a00  PUSH 0x0
011cdec2  8975f0  MOV dword ptr [EBP + -0x10],ESI
011cdec5  c645f411  MOV byte ptr [EBP + -0xc],0x11
011cdec9  897df8  MOV dword ptr [EBP + -0x8],EDI
011cdecc  c645fc00  MOV byte ptr [EBP + -0x4],0x0
011cded0  8d55f0  LEA EDX,[EBP + -0x10]
011cded3  b901000000  MOV ECX,0x1
011cded8  b804df1c01  MOV EAX,0x11cdf04
011cdedd  e89efb7dff  CALL 0x009ada80
011cdee2  8bc3  MOV EAX,EBX
011cdee4  e80f4e7eff  CALL 0x009b2cf8
011cdee9  8bc3  MOV EAX,EBX
011cdeeb  8b10  MOV EDX,dword ptr [EAX]
011cdeed  ff5214  CALL dword ptr [EDX + 0x14]
011cdef0  5f  POP EDI
011cdef1  5e  POP ESI
011cdef2  5b  POP EBX
011cdef3  8be5  MOV ESP,EBP
011cdef5  5d  POP EBP
011cdef6  c3  RET
