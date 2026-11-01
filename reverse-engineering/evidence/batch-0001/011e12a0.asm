011e12a0  55  PUSH EBP
011e12a1  8bec  MOV EBP,ESP
011e12a3  83c4d0  ADD ESP,-0x30
011e12a6  894df4  MOV dword ptr [EBP + -0xc],ECX
011e12a9  8955f8  MOV dword ptr [EBP + -0x8],EDX
011e12ac  8945fc  MOV dword ptr [EBP + -0x4],EAX
011e12af  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011e12b2  ba30131e01  MOV EDX,0x11e1330
011e12b7  e868b022ff  CALL 0x0040c324
011e12bc  7515  JNZ 0x011e12d3
011e12be  a1dcf92401  MOV EAX,[0x0124f9dc]
011e12c3  8b00  MOV EAX,dword ptr [EAX]
011e12c5  8b5008  MOV EDX,dword ptr [EAX + 0x8]
011e12c8  8955e8  MOV dword ptr [EBP + -0x18],EDX
011e12cb  8b500c  MOV EDX,dword ptr [EAX + 0xc]
011e12ce  8955ec  MOV dword ptr [EBP + -0x14],EDX
011e12d1  eb13  JMP 0x011e12e6
011e12d3  a1a0e22401  MOV EAX,[0x0124e2a0]
011e12d8  8b00  MOV EAX,dword ptr [EAX]
011e12da  8b5020  MOV EDX,dword ptr [EAX + 0x20]
011e12dd  8955e8  MOV dword ptr [EBP + -0x18],EDX
011e12e0  8b5024  MOV EDX,dword ptr [EAX + 0x24]
011e12e3  8955ec  MOV dword ptr [EBP + -0x14],EDX
011e12e6  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011e12e9  50  PUSH EAX
011e12ea  6a00  PUSH 0x0
011e12ec  6a00  PUSH 0x0
011e12ee  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011e12f1  8945d0  MOV dword ptr [EBP + -0x30],EAX
011e12f4  c645d411  MOV byte ptr [EBP + -0x2c],0x11
011e12f8  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011e12fb  8945d8  MOV dword ptr [EBP + -0x28],EAX
011e12fe  c645dc11  MOV byte ptr [EBP + -0x24],0x11
011e1302  8d45e8  LEA EAX,[EBP + -0x18]
011e1305  8945e0  MOV dword ptr [EBP + -0x20],EAX
011e1308  c645e410  MOV byte ptr [EBP + -0x1c],0x10
011e130c  8d55d0  LEA EDX,[EBP + -0x30]
011e130f  b902000000  MOV ECX,0x2
011e1314  b844131e01  MOV EAX,0x11e1344
011e1319  e806c67cff  CALL 0x009ad924
011e131e  8be5  MOV ESP,EBP
011e1320  5d  POP EBP
011e1321  c3  RET
