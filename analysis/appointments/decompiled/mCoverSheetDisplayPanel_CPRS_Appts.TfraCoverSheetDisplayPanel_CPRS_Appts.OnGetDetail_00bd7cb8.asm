; Static instruction listing. Function bodies and indirect exception flow require review.
00bd7cb8  55  PUSH EBP
00bd7cb9  8bec  MOV EBP,ESP
00bd7cbb  83c4d8  ADD ESP,-0x28
00bd7cbe  53  PUSH EBX
00bd7cbf  56  PUSH ESI
00bd7cc0  33db  XOR EBX,EBX
00bd7cc2  895df8  MOV dword ptr [EBP + -0x8],EBX
00bd7cc5  895dd8  MOV dword ptr [EBP + -0x28],EBX
00bd7cc8  895df4  MOV dword ptr [EBP + -0xc],EBX
00bd7ccb  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd7cce  8bf2  MOV ESI,EDX
00bd7cd0  8bd8  MOV EBX,EAX
00bd7cd2  33c0  XOR EAX,EAX
00bd7cd4  55  PUSH EBP
00bd7cd5  68687dbd00  PUSH 0xbd7d68
00bd7cda  64ff30  PUSH dword ptr FS:[EAX]
00bd7cdd  648920  MOV dword ptr FS:[EAX],ESP
00bd7ce0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd7ce3  50  PUSH EAX
00bd7ce4  6a00  PUSH 0x0
00bd7ce6  8d55f4  LEA EDX,[EBP + -0xc]
00bd7ce9  8bc3  MOV EAX,EBX
00bd7ceb  e834bbffff  CALL 0x00bd3824
00bd7cf0  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd7cf3  8d55f8  LEA EDX,[EBP + -0x8]
00bd7cf6  8b08  MOV ECX,dword ptr [EAX]
00bd7cf8  ff5138  CALL dword ptr [ECX + 0x38]
00bd7cfb  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7cfe  50  PUSH EAX
00bd7cff  a1e0f22401  MOV EAX,[0x0124f2e0]
00bd7d04  8b00  MOV EAX,dword ptr [EAX]
00bd7d06  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bd7d09  8945dc  MOV dword ptr [EBP + -0x24],EAX
00bd7d0c  c645e011  MOV byte ptr [EBP + -0x20],0x11
00bd7d10  33c0  XOR EAX,EAX
00bd7d12  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00bd7d15  c645e811  MOV byte ptr [EBP + -0x18],0x11
00bd7d19  8d4dd8  LEA ECX,[EBP + -0x28]
00bd7d1c  ba01000000  MOV EDX,0x1
00bd7d21  8bc6  MOV EAX,ESI
00bd7d23  e8147cffff  CALL 0x00bcf93c
00bd7d28  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
00bd7d2b  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd7d2e  c645f011  MOV byte ptr [EBP + -0x10],0x11
00bd7d32  8d55dc  LEA EDX,[EBP + -0x24]
00bd7d35  b902000000  MOV ECX,0x2
00bd7d3a  58  POP EAX
00bd7d3b  e8405dddff  CALL 0x009ada80
00bd7d40  33c0  XOR EAX,EAX
00bd7d42  5a  POP EDX
00bd7d43  59  POP ECX
00bd7d44  59  POP ECX
00bd7d45  648910  MOV dword ptr FS:[EAX],EDX
00bd7d48  686f7dbd00  PUSH 0xbd7d6f
00bd7d4d  8d45d8  LEA EAX,[EBP + -0x28]
00bd7d50  e87f3283ff  CALL 0x0040afd4
00bd7d55  8d45f4  LEA EAX,[EBP + -0xc]
00bd7d58  e8db8983ff  CALL 0x00410738
00bd7d5d  8d45f8  LEA EAX,[EBP + -0x8]
00bd7d60  e86f3283ff  CALL 0x0040afd4
00bd7d65  58  POP EAX
00bd7d66  ffe0  JMP EAX
