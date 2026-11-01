; Static instruction listing. Function bodies and indirect exception flow require review.
00e1f8e8  55  PUSH EBP
00e1f8e9  8bec  MOV EBP,ESP
00e1f8eb  53  PUSH EBX
00e1f8ec  56  PUSH ESI
00e1f8ed  8bf1  MOV ESI,ECX
00e1f8ef  8bd8  MOV EBX,EAX
00e1f8f1  66833e0d  CMP word ptr [ESI],0xd
00e1f8f5  7534  JNZ 0x00e1f92b
00e1f8f7  8b83cc040000  MOV EAX,dword ptr [EBX + 0x4cc]
00e1f8fd  e83a2885ff  CALL 0x0067213c
00e1f902  85c0  TEST EAX,EAX
00e1f904  7425  JZ 0x00e1f92b
00e1f906  8b83cc040000  MOV EAX,dword ptr [EBX + 0x4cc]
00e1f90c  e82b2885ff  CALL 0x0067213c
00e1f911  8b5008  MOV EDX,dword ptr [EAX + 0x8]
00e1f914  b840f9e100  MOV EAX,0xe1f940
00e1f919  e80a8461ff  CALL 0x00437d28
00e1f91e  85c0  TEST EAX,EAX
00e1f920  7e09  JLE 0x00e1f92b
00e1f922  33d2  XOR EDX,EDX
00e1f924  8bc3  MOV EAX,EBX
00e1f926  e8ed3c0000  CALL 0x00e23618
00e1f92b  5e  POP ESI
00e1f92c  5b  POP EBX
00e1f92d  5d  POP EBP
00e1f92e  c20400  RET 0x4
