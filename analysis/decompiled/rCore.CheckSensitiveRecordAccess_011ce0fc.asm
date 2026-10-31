; Static instruction listing. Function bodies and indirect exception flow require review.
011ce0fc  55  PUSH EBP
011ce0fd  8bec  MOV EBP,ESP
011ce0ff  83c4ec  ADD ESP,-0x14
011ce102  53  PUSH EBX
011ce103  56  PUSH ESI
011ce104  57  PUSH EDI
011ce105  33db  XOR EBX,EBX
011ce107  895dec  MOV dword ptr [EBP + -0x14],EBX
011ce10a  895df0  MOV dword ptr [EBP + -0x10],EBX
011ce10d  8bf1  MOV ESI,ECX
011ce10f  8bda  MOV EBX,EDX
011ce111  8bf8  MOV EDI,EAX
011ce113  33c0  XOR EAX,EAX
011ce115  55  PUSH EBP
011ce116  68f4e11c01  PUSH 0x11ce1f4
011ce11b  64ff30  PUSH dword ptr FS:[EAX]
011ce11e  648920  MOV dword ptr FS:[EAX],ESP
011ce121  b201  MOV DL,0x1
011ce123  a100734a00  MOV EAX,[0x004a7300]
011ce128  e8c7a030ff  CALL 0x004d81f4
011ce12d  8945fc  MOV dword ptr [EBP + -0x4],EAX
011ce130  33c0  XOR EAX,EAX
011ce132  55  PUSH EBP
011ce133  68d0e11c01  PUSH 0x11ce1d0
011ce138  64ff30  PUSH dword ptr FS:[EAX]
011ce13b  648920  MOV dword ptr FS:[EAX],ESP
011ce13e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce141  50  PUSH EAX
011ce142  6a00  PUSH 0x0
011ce144  897df4  MOV dword ptr [EBP + -0xc],EDI
011ce147  c645f811  MOV byte ptr [EBP + -0x8],0x11
011ce14b  8d55f4  LEA EDX,[EBP + -0xc]
011ce14e  33c9  XOR ECX,ECX
011ce150  b810e21c01  MOV EAX,0x11ce210
011ce155  e826f97dff  CALL 0x009ada80
011ce15a  c703ffffffff  MOV dword ptr [EBX],0xffffffff
011ce160  8bc6  MOV EAX,ESI
011ce162  e86dce23ff  CALL 0x0040afd4
011ce167  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce16a  8b10  MOV EDX,dword ptr [EAX]
011ce16c  ff5214  CALL dword ptr [EDX + 0x14]
011ce16f  85c0  TEST EAX,EAX
011ce171  7e45  JLE 0x011ce1b8
011ce173  8d4df0  LEA ECX,[EBP + -0x10]
011ce176  33d2  XOR EDX,EDX
011ce178  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce17b  8b38  MOV EDI,dword ptr [EAX]
011ce17d  ff570c  CALL dword ptr [EDI + 0xc]
011ce180  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011ce183  83caff  OR EDX,0xffffffff
011ce186  e8adf025ff  CALL 0x0042d238
011ce18b  8903  MOV dword ptr [EBX],EAX
011ce18d  33d2  XOR EDX,EDX
011ce18f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce192  8b08  MOV ECX,dword ptr [EAX]
011ce194  ff514c  CALL dword ptr [ECX + 0x4c]
011ce197  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce19a  8b10  MOV EDX,dword ptr [EAX]
011ce19c  ff5214  CALL dword ptr [EDX + 0x14]
011ce19f  85c0  TEST EAX,EAX
011ce1a1  7e15  JLE 0x011ce1b8
011ce1a3  8d55ec  LEA EDX,[EBP + -0x14]
011ce1a6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce1a9  8b08  MOV ECX,dword ptr [EAX]
011ce1ab  ff511c  CALL dword ptr [ECX + 0x1c]
011ce1ae  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011ce1b1  8bc6  MOV EAX,ESI
011ce1b3  e80cd223ff  CALL 0x0040b3c4
011ce1b8  33c0  XOR EAX,EAX
011ce1ba  5a  POP EDX
011ce1bb  59  POP ECX
011ce1bc  59  POP ECX
011ce1bd  648910  MOV dword ptr FS:[EAX],EDX
011ce1c0  68d7e11c01  PUSH 0x11ce1d7
011ce1c5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ce1c8  e8efae23ff  CALL 0x004090bc
011ce1cd  58  POP EAX
011ce1ce  ffe0  JMP EAX
