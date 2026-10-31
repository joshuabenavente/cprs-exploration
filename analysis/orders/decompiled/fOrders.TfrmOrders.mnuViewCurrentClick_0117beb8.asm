; Static instruction listing. Function bodies and indirect exception flow require review.
0117beb8  55  PUSH EBP
0117beb9  8bec  MOV EBP,ESP
0117bebb  83c4f8  ADD ESP,-0x8
0117bebe  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117bec1  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117bec4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bec7  8b8034050000  MOV EAX,dword ptr [EAX + 0x534]
0117becd  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
0117bed3  ba0a000000  MOV EDX,0xa
0117bed8  e803014fff  CALL 0x0066bfe0
0117bedd  33d2  XOR EDX,EDX
0117bedf  e858fe4eff  CALL 0x0066bd3c
0117bee4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bee7  e8d8180000  CALL 0x0117d7c4
0117beec  681cbf1701  PUSH 0x117bf1c
0117bef1  6a00  PUSH 0x0
0117bef3  6a00  PUSH 0x0
0117bef5  e8422a0600  CALL 0x011de93c
0117befa  8bc8  MOV ECX,EAX
0117befc  ba17000000  MOV EDX,0x17
0117bf01  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bf04  e8cbf8ffff  CALL 0x0117b7d4
0117bf09  59  POP ECX
0117bf0a  59  POP ECX
0117bf0b  5d  POP EBP
0117bf0c  c3  RET
