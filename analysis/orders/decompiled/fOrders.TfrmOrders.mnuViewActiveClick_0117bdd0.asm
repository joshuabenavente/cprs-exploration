; Static instruction listing. Function bodies and indirect exception flow require review.
0117bdd0  55  PUSH EBP
0117bdd1  8bec  MOV EBP,ESP
0117bdd3  83c4f8  ADD ESP,-0x8
0117bdd6  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117bdd9  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117bddc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bddf  8b8034050000  MOV EAX,dword ptr [EAX + 0x534]
0117bde5  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
0117bdeb  ba0a000000  MOV EDX,0xa
0117bdf0  e8eb014fff  CALL 0x0066bfe0
0117bdf5  33d2  XOR EDX,EDX
0117bdf7  e840ff4eff  CALL 0x0066bd3c
0117bdfc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bdff  e8c0190000  CALL 0x0117d7c4
0117be04  6834be1701  PUSH 0x117be34
0117be09  6a00  PUSH 0x0
0117be0b  6a00  PUSH 0x0
0117be0d  e82a2b0600  CALL 0x011de93c
0117be12  8bc8  MOV ECX,EAX
0117be14  ba02000000  MOV EDX,0x2
0117be19  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117be1c  e8b3f9ffff  CALL 0x0117b7d4
0117be21  59  POP ECX
0117be22  59  POP ECX
0117be23  5d  POP EBP
0117be24  c3  RET
