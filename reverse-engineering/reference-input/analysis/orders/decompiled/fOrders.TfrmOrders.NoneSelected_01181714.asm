; Static instruction listing. Function bodies and indirect exception flow require review.
01181714  55  PUSH EBP
01181715  8bec  MOV EBP,ESP
01181717  83c4f4  ADD ESP,-0xc
0118171a  8955f8  MOV dword ptr [EBP + -0x8],EDX
0118171d  8945fc  MOV dword ptr [EBP + -0x4],EAX
01181720  c645f701  MOV byte ptr [EBP + -0x9],0x1
01181724  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
01181727  e8f0a0ffff  CALL 0x0117b81c
0118172c  85c0  TEST EAX,EAX
0118172e  7e04  JLE 0x01181734
01181730  c645f700  MOV byte ptr [EBP + -0x9],0x0
01181734  807df700  CMP byte ptr [EBP + -0x9],0x0
01181738  740f  JZ 0x01181749
0118173a  33c9  XOR ECX,ECX
0118173c  ba5c171801  MOV EDX,0x118175c
01181741  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
01181744  e85f2d83ff  CALL 0x009b44a8
01181749  8a45f7  MOV AL,byte ptr [EBP + -0x9]
0118174c  8be5  MOV ESP,EBP
0118174e  5d  POP EBP
0118174f  c3  RET
