; Static instruction listing. Function bodies and indirect exception flow require review.
0117b7d4  55  PUSH EBP
0117b7d5  8bec  MOV EBP,ESP
0117b7d7  83c4f4  ADD ESP,-0xc
0117b7da  894df4  MOV dword ptr [EBP + -0xc],ECX
0117b7dd  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117b7e0  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117b7e3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b7e6  e88dfeffff  CALL 0x0117b678
0117b7eb  84c0  TEST AL,AL
0117b7ed  7426  JZ 0x0117b815
0117b7ef  8b4510  MOV EAX,dword ptr [EBP + 0x10]
0117b7f2  50  PUSH EAX
0117b7f3  8a450c  MOV AL,byte ptr [EBP + 0xc]
0117b7f6  50  PUSH EAX
0117b7f7  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117b7fa  50  PUSH EAX
0117b7fb  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
0117b7fe  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117b801  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b804  e86f000000  CALL 0x0117b878
0117b809  33c9  XOR ECX,ECX
0117b80b  b201  MOV DL,0x1
0117b80d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b810  e8ebf7ffff  CALL 0x0117b000
0117b815  8be5  MOV ESP,EBP
0117b817  5d  POP EBP
0117b818  c20c00  RET 0xc
