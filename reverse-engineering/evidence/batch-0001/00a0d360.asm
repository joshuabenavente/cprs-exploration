00a0d360  55  PUSH EBP
00a0d361  8bec  MOV EBP,ESP
00a0d363  83c4e0  ADD ESP,-0x20
00a0d366  53  PUSH EBX
00a0d367  56  PUSH ESI
00a0d368  33d2  XOR EDX,EDX
00a0d36a  8955e0  MOV dword ptr [EBP + -0x20],EDX
00a0d36d  8bf0  MOV ESI,EAX
00a0d36f  33c0  XOR EAX,EAX
00a0d371  55  PUSH EBP
00a0d372  6872d4a000  PUSH 0xa0d472
00a0d377  64ff30  PUSH dword ptr FS:[EAX]
00a0d37a  648920  MOV dword ptr FS:[EAX],ESP
00a0d37d  b201  MOV DL,0x1
00a0d37f  a100734a00  MOV EAX,[0x004a7300]
00a0d384  e86baeacff  CALL 0x004d81f4
00a0d389  8945fc  MOV dword ptr [EBP + -0x4],EAX
00a0d38c  33c0  XOR EAX,EAX
00a0d38e  55  PUSH EBP
00a0d38f  6853d4a000  PUSH 0xa0d453
00a0d394  64ff30  PUSH dword ptr FS:[EAX]
00a0d397  648920  MOV dword ptr FS:[EAX],ESP
00a0d39a  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d39d  8378fc01  CMP dword ptr [EAX + -0x4],0x1
00a0d3a1  7504  JNZ 0x00a0d3a7
00a0d3a3  b301  MOV BL,0x1
00a0d3a5  eb1d  JMP 0x00a0d3c4
00a0d3a7  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d3aa  8378f801  CMP dword ptr [EAX + -0x8],0x1
00a0d3ae  7412  JZ 0x00a0d3c2
00a0d3b0  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d3b3  8b40f4  MOV EAX,dword ptr [EAX + -0xc]
00a0d3b6  8b5508  MOV EDX,dword ptr [EBP + 0x8]
00a0d3b9  3b42f8  CMP EAX,dword ptr [EDX + -0x8]
00a0d3bc  7c04  JL 0x00a0d3c2
00a0d3be  33db  XOR EBX,EBX
00a0d3c0  eb02  JMP 0x00a0d3c4
00a0d3c2  b301  MOV BL,0x1
00a0d3c4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00a0d3c7  50  PUSH EAX
00a0d3c8  53  PUSH EBX
00a0d3c9  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d3cc  83c008  ADD EAX,0x8
00a0d3cf  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00a0d3d2  c645e810  MOV byte ptr [EBP + -0x18],0x10
00a0d3d6  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d3d9  8b40f0  MOV EAX,dword ptr [EAX + -0x10]
00a0d3dc  8945ec  MOV dword ptr [EBP + -0x14],EAX
00a0d3df  c645f00e  MOV byte ptr [EBP + -0x10],0xe
00a0d3e3  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0d3e6  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00a0d3e9  8945f4  MOV dword ptr [EBP + -0xc],EAX
00a0d3ec  c645f800  MOV byte ptr [EBP + -0x8],0x0
00a0d3f0  8d55e4  LEA EDX,[EBP + -0x1c]
00a0d3f3  b902000000  MOV ECX,0x2
00a0d3f8  b88cd4a000  MOV EAX,0xa0d48c
00a0d3fd  e87e06faff  CALL 0x009ada80
00a0d402  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00a0d405  8b10  MOV EDX,dword ptr [EAX]
00a0d407  ff5214  CALL dword ptr [EDX + 0x14]
00a0d40a  85c0  TEST EAX,EAX
00a0d40c  7e21  JLE 0x00a0d42f
00a0d40e  56  PUSH ESI
00a0d40f  8d4de0  LEA ECX,[EBP + -0x20]
00a0d412  33d2  XOR EDX,EDX
00a0d414  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00a0d417  8b18  MOV EBX,dword ptr [EAX]
00a0d419  ff530c  CALL dword ptr [EBX + 0xc]
00a0d41c  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00a0d41f  b904000000  MOV ECX,0x4
00a0d424  66ba5e00  MOV DX,0x5e
00a0d428  e83f5bfaff  CALL 0x009b2f6c
00a0d42d  eb0c  JMP 0x00a0d43b
00a0d42f  8bc6  MOV EAX,ESI
00a0d431  bac4d4a000  MOV EDX,0xa0d4c4
00a0d436  e889df9fff  CALL 0x0040b3c4
00a0d43b  33c0  XOR EAX,EAX
00a0d43d  5a  POP EDX
00a0d43e  59  POP ECX
00a0d43f  59  POP ECX
00a0d440  648910  MOV dword ptr FS:[EAX],EDX
00a0d443  685ad4a000  PUSH 0xa0d45a
00a0d448  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00a0d44b  e86cbc9fff  CALL 0x004090bc
00a0d450  58  POP EAX
00a0d451  ffe0  JMP EAX
