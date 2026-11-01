; Static instruction listing. Function bodies and indirect exception flow require review.
01004578  55  PUSH EBP
01004579  8bec  MOV EBP,ESP
0100457b  83c4f8  ADD ESP,-0x8
0100457e  8955f8  MOV dword ptr [EBP + -0x8],EDX
01004581  8945fc  MOV dword ptr [EBP + -0x4],EAX
01004584  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
01004587  a1a0a62501  MOV EAX,[0x0125a6a0]
0100458c  e8c3d7feff  CALL 0x00ff1d54
01004591  8bd0  MOV EDX,EAX
01004593  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
01004596  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
0100459c  8b08  MOV ECX,dword ptr [EAX]
0100459e  ff917c010000  CALL dword ptr [ECX + 0x17c]
010045a4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
010045a7  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
010045ad  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
010045b0  e833d5feff  CALL 0x00ff1ae8
010045b5  59  POP ECX
010045b6  59  POP ECX
010045b7  5d  POP EBP
010045b8  c3  RET
