; Static instruction listing. Function bodies and indirect exception flow require review.
00bcdb70  55  PUSH EBP
00bcdb71  8bec  MOV EBP,ESP
00bcdb73  53  PUSH EBX
00bcdb74  56  PUSH ESI
00bcdb75  57  PUSH EDI
00bcdb76  8bf9  MOV EDI,ECX
00bcdb78  8bf2  MOV ESI,EDX
00bcdb7a  8bd8  MOV EBX,EAX
00bcdb7c  8bd6  MOV EDX,ESI
00bcdb7e  8bc3  MOV EAX,EBX
00bcdb80  e80fffffff  CALL 0x00bcda94
00bcdb85  8b4310  MOV EAX,dword ptr [EBX + 0x10]
00bcdb88  8b14f0  MOV EDX,dword ptr [EAX + ESI*0x8]
00bcdb8b  8917  MOV dword ptr [EDI],EDX
00bcdb8d  8b54f004  MOV EDX,dword ptr [EAX + ESI*0x8 + 0x4]
00bcdb91  895704  MOV dword ptr [EDI + 0x4],EDX
00bcdb94  5f  POP EDI
00bcdb95  5e  POP ESI
00bcdb96  5b  POP EBX
00bcdb97  5d  POP EBP
00bcdb98  c3  RET
