; Static instruction listing. Function bodies and indirect exception flow require review.
011e3c68  55  PUSH EBP
011e3c69  8bec  MOV EBP,ESP
011e3c6b  83c4ec  ADD ESP,-0x14
011e3c6e  8955f8  MOV dword ptr [EBP + -0x8],EDX
011e3c71  8945fc  MOV dword ptr [EBP + -0x4],EAX
011e3c74  b201  MOV DL,0x1
011e3c76  a100734a00  MOV EAX,[0x004a7300]
011e3c7b  e874452fff  CALL 0x004d81f4
011e3c80  8945f4  MOV dword ptr [EBP + -0xc],EAX
011e3c83  33c0  XOR EAX,EAX
011e3c85  55  PUSH EBP
011e3c86  68d73c1e01  PUSH 0x11e3cd7
011e3c8b  64ff30  PUSH dword ptr FS:[EAX]
011e3c8e  648920  MOV dword ptr FS:[EAX],ESP
011e3c91  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011e3c94  50  PUSH EAX
011e3c95  6a00  PUSH 0x0
011e3c97  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011e3c9a  8945ec  MOV dword ptr [EBP + -0x14],EAX
011e3c9d  c645f011  MOV byte ptr [EBP + -0x10],0x11
011e3ca1  8d55ec  LEA EDX,[EBP + -0x14]
011e3ca4  33c9  XOR ECX,ECX
011e3ca6  b8f03c1e01  MOV EAX,0x11e3cf0
011e3cab  e8d09d7cff  CALL 0x009ada80
011e3cb0  84c0  TEST AL,AL
011e3cb2  740b  JZ 0x011e3cbf
011e3cb4  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011e3cb7  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011e3cba  8b08  MOV ECX,dword ptr [EAX]
011e3cbc  ff511c  CALL dword ptr [ECX + 0x1c]
011e3cbf  33c0  XOR EAX,EAX
011e3cc1  5a  POP EDX
011e3cc2  59  POP ECX
011e3cc3  59  POP ECX
011e3cc4  648910  MOV dword ptr FS:[EAX],EDX
011e3cc7  68de3c1e01  PUSH 0x11e3cde
011e3ccc  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011e3ccf  e8e85322ff  CALL 0x004090bc
011e3cd4  58  POP EAX
011e3cd5  ffe0  JMP EAX
