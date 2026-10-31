; Static instruction listing. Function bodies and indirect exception flow require review.
011db7c0  55  PUSH EBP
011db7c1  8bec  MOV EBP,ESP
011db7c3  83c4f0  ADD ESP,-0x10
011db7c6  8945fc  MOV dword ptr [EBP + -0x4],EAX
011db7c9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011db7cc  8b4008  MOV EAX,dword ptr [EAX + 0x8]
011db7cf  48  DEC EAX
011db7d0  85c0  TEST EAX,EAX
011db7d2  7c29  JL 0x011db7fd
011db7d4  40  INC EAX
011db7d5  8945f4  MOV dword ptr [EBP + -0xc],EAX
011db7d8  c745f800000000  MOV dword ptr [EBP + -0x8],0x0
011db7df  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011db7e2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011db7e5  e806782fff  CALL 0x004d2ff0
011db7ea  8945f0  MOV dword ptr [EBP + -0x10],EAX
011db7ed  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011db7f0  e8c7d822ff  CALL 0x004090bc
011db7f5  ff45f8  INC dword ptr [EBP + -0x8]
011db7f8  ff4df4  DEC dword ptr [EBP + -0xc]
011db7fb  75e2  JNZ 0x011db7df
011db7fd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011db800  8b10  MOV EDX,dword ptr [EAX]
011db802  ff5208  CALL dword ptr [EDX + 0x8]
011db805  8be5  MOV ESP,EBP
011db807  5d  POP EBP
011db808  c3  RET
