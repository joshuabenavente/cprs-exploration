; Static instruction listing. Function bodies and indirect exception flow require review.
011cd988  55  PUSH EBP
011cd989  8bec  MOV EBP,ESP
011cd98b  b906000000  MOV ECX,0x6
011cd990  6a00  PUSH 0x0
011cd992  6a00  PUSH 0x0
011cd994  49  DEC ECX
011cd995  75f9  JNZ 0x011cd990
011cd997  53  PUSH EBX
011cd998  56  PUSH ESI
011cd999  57  PUSH EDI
011cd99a  8bda  MOV EBX,EDX
011cd99c  8bf0  MOV ESI,EAX
011cd99e  33c0  XOR EAX,EAX
011cd9a0  55  PUSH EBP
011cd9a1  686fdb1c01  PUSH 0x11cdb6f
011cd9a6  64ff30  PUSH dword ptr FS:[EAX]
011cd9a9  648920  MOV dword ptr FS:[EAX],ESP
011cd9ac  8d45fc  LEA EAX,[EBP + -0x4]
011cd9af  8bd3  MOV EDX,EBX
011cd9b1  e856da23ff  CALL 0x0040b40c
011cd9b6  b901000000  MOV ECX,0x1
011cd9bb  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011cd9be  b88cdb1c01  MOV EAX,0x11cdb8c
011cd9c3  e8e8ea23ff  CALL 0x0040c4b0
011cd9c8  8bd8  MOV EBX,EAX
011cd9ca  85db  TEST EBX,EBX
011cd9cc  7e52  JLE 0x011cda20
011cd9ce  8d45ec  LEA EAX,[EBP + -0x14]
011cd9d1  50  PUSH EAX
011cd9d2  8d5301  LEA EDX,[EBX + 0x1]
011cd9d5  b90c000000  MOV ECX,0xc
011cd9da  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cd9dd  e87ae923ff  CALL 0x0040c35c
011cd9e2  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011cd9e5  50  PUSH EAX
011cd9e6  8d45e8  LEA EAX,[EBP + -0x18]
011cd9e9  50  PUSH EAX
011cd9ea  8bcb  MOV ECX,EBX
011cd9ec  49  DEC ECX
011cd9ed  ba01000000  MOV EDX,0x1
011cd9f2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cd9f5  e862e923ff  CALL 0x0040c35c
011cd9fa  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
011cd9fd  8d45fc  LEA EAX,[EBP + -0x4]
011cda00  59  POP ECX
011cda01  e886e723ff  CALL 0x0040c18c
011cda06  b901000000  MOV ECX,0x1
011cda0b  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011cda0e  b88cdb1c01  MOV EAX,0x11cdb8c
011cda13  e898ea23ff  CALL 0x0040c4b0
011cda18  8bf8  MOV EDI,EAX
011cda1a  8bdf  MOV EBX,EDI
011cda1c  85db  TEST EBX,EBX
011cda1e  7fae  JG 0x011cd9ce
011cda20  56  PUSH ESI
011cda21  6a00  PUSH 0x0
011cda23  8d55dc  LEA EDX,[EBP + -0x24]
011cda26  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cda29  e87ae725ff  CALL 0x0042c1a8
011cda2e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011cda31  8945e0  MOV dword ptr [EBP + -0x20],EAX
011cda34  c645e411  MOV byte ptr [EBP + -0x1c],0x11
011cda38  8d55e0  LEA EDX,[EBP + -0x20]
011cda3b  33c9  XOR ECX,ECX
011cda3d  b89cdb1c01  MOV EAX,0x11cdb9c
011cda42  e839007eff  CALL 0x009ada80
011cda47  6a00  PUSH 0x0
011cda49  b902000000  MOV ECX,0x2
011cda4e  66ba5e00  MOV DX,0x5e
011cda52  8bc6  MOV EAX,ESI
011cda54  e82f587eff  CALL 0x009b3288
011cda59  8bc6  MOV EAX,ESI
011cda5b  8b10  MOV EDX,dword ptr [EAX]
011cda5d  ff5214  CALL dword ptr [EDX + 0x14]
011cda60  48  DEC EAX
011cda61  85c0  TEST EAX,EAX
011cda63  0f8cc8000000  JL 0x011cdb31
011cda69  40  INC EAX
011cda6a  8945f0  MOV dword ptr [EBP + -0x10],EAX
011cda6d  33db  XOR EBX,EBX
011cda6f  8d4dfc  LEA ECX,[EBP + -0x4]
011cda72  8bd3  MOV EDX,EBX
011cda74  8bc6  MOV EAX,ESI
011cda76  8b38  MOV EDI,dword ptr [EAX]
011cda78  ff570c  CALL dword ptr [EDI + 0xc]
011cda7b  8d45f8  LEA EAX,[EBP + -0x8]
011cda7e  50  PUSH EAX
011cda7f  b903000000  MOV ECX,0x3
011cda84  66ba5e00  MOV DX,0x5e
011cda88  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cda8b  e85cd25cff  CALL 0x0079acec
011cda90  8d45f4  LEA EAX,[EBP + -0xc]
011cda93  50  PUSH EAX
011cda94  b904000000  MOV ECX,0x4
011cda99  66ba5e00  MOV DX,0x5e
011cda9d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdaa0  e847d25cff  CALL 0x0079acec
011cdaa5  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011cdaa8  e8a7cbffff  CALL 0x011ca654
011cdaad  84c0  TEST AL,AL
011cdaaf  741b  JZ 0x011cdacc
011cdab1  8d4dd8  LEA ECX,[EBP + -0x28]
011cdab4  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011cdab7  b8c4db1c01  MOV EAX,0x11cdbc4
011cdabc  e8d33c7eff  CALL 0x009b1794
011cdac1  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
011cdac4  8d45f8  LEA EAX,[EBP + -0x8]
011cdac7  e840d923ff  CALL 0x0040b40c
011cdacc  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011cdacf  e834cbffff  CALL 0x011ca608
011cdad4  84c0  TEST AL,AL
011cdad6  7416  JZ 0x011cdaee
011cdad8  8d55d4  LEA EDX,[EBP + -0x2c]
011cdadb  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011cdade  e80dcaffff  CALL 0x011ca4f0
011cdae3  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
011cdae6  8d45f4  LEA EAX,[EBP + -0xc]
011cdae9  e81ed923ff  CALL 0x0040b40c
011cdaee  ff75f4  PUSH dword ptr [EBP + -0xc]
011cdaf1  68e8db1c01  PUSH 0x11cdbe8
011cdaf6  ff75f8  PUSH dword ptr [EBP + -0x8]
011cdaf9  8d45d0  LEA EAX,[EBP + -0x30]
011cdafc  ba03000000  MOV EDX,0x3
011cdb01  e80ee723ff  CALL 0x0040c214
011cdb06  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
011cdb09  50  PUSH EAX
011cdb0a  8d45fc  LEA EAX,[EBP + -0x4]
011cdb0d  b903000000  MOV ECX,0x3
011cdb12  66ba5e00  MOV DX,0x5e
011cdb16  e81dd45cff  CALL 0x0079af38
011cdb1b  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
011cdb1e  8bd3  MOV EDX,EBX
011cdb20  8bc6  MOV EAX,ESI
011cdb22  8b38  MOV EDI,dword ptr [EAX]
011cdb24  ff5720  CALL dword ptr [EDI + 0x20]
011cdb27  43  INC EBX
011cdb28  ff4df0  DEC dword ptr [EBP + -0x10]
011cdb2b  0f853effffff  JNZ 0x011cda6f
011cdb31  8bc6  MOV EAX,ESI
011cdb33  e8c0517eff  CALL 0x009b2cf8
011cdb38  33c0  XOR EAX,EAX
011cdb3a  5a  POP EDX
011cdb3b  59  POP ECX
011cdb3c  59  POP ECX
011cdb3d  648910  MOV dword ptr FS:[EAX],EDX
011cdb40  6876db1c01  PUSH 0x11cdb76
011cdb45  8d45d0  LEA EAX,[EBP + -0x30]
011cdb48  ba04000000  MOV EDX,0x4
011cdb4d  e8e2d423ff  CALL 0x0040b034
011cdb52  8d45e8  LEA EAX,[EBP + -0x18]
011cdb55  ba02000000  MOV EDX,0x2
011cdb5a  e8d5d423ff  CALL 0x0040b034
011cdb5f  8d45f4  LEA EAX,[EBP + -0xc]
011cdb62  ba03000000  MOV EDX,0x3
011cdb67  e8c8d423ff  CALL 0x0040b034
011cdb6c  58  POP EAX
011cdb6d  ffe0  JMP EAX
