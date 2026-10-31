; Static instruction listing. Function bodies and indirect exception flow require review.
00bd3dd8  55  PUSH EBP
00bd3dd9  8bec  MOV EBP,ESP
00bd3ddb  83c4dc  ADD ESP,-0x24
00bd3dde  53  PUSH EBX
00bd3ddf  56  PUSH ESI
00bd3de0  57  PUSH EDI
00bd3de1  33db  XOR EBX,EBX
00bd3de3  895ddc  MOV dword ptr [EBP + -0x24],EBX
00bd3de6  895df8  MOV dword ptr [EBP + -0x8],EBX
00bd3de9  895de0  MOV dword ptr [EBP + -0x20],EBX
00bd3dec  895df4  MOV dword ptr [EBP + -0xc],EBX
00bd3def  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd3df2  8bf2  MOV ESI,EDX
00bd3df4  8bd8  MOV EBX,EAX
00bd3df6  33c0  XOR EAX,EAX
00bd3df8  55  PUSH EBP
00bd3df9  68d03ebd00  PUSH 0xbd3ed0
00bd3dfe  64ff30  PUSH dword ptr FS:[EAX]
00bd3e01  648920  MOV dword ptr FS:[EAX],ESP
00bd3e04  33c0  XOR EAX,EAX
00bd3e06  55  PUSH EBP
00bd3e07  68733ebd00  PUSH 0xbd3e73
00bd3e0c  64ff30  PUSH dword ptr FS:[EAX]
00bd3e0f  648920  MOV dword ptr FS:[EAX],ESP
00bd3e12  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd3e15  50  PUSH EAX
00bd3e16  6a00  PUSH 0x0
00bd3e18  8d55f4  LEA EDX,[EBP + -0xc]
00bd3e1b  8bc3  MOV EAX,EBX
00bd3e1d  e802faffff  CALL 0x00bd3824
00bd3e22  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd3e25  8d55f8  LEA EDX,[EBP + -0x8]
00bd3e28  8b08  MOV ECX,dword ptr [EAX]
00bd3e2a  ff5138  CALL dword ptr [ECX + 0x38]
00bd3e2d  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd3e30  50  PUSH EAX
00bd3e31  a1e0f22401  MOV EAX,[0x0124f2e0]
00bd3e36  8b00  MOV EAX,dword ptr [EAX]
00bd3e38  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bd3e3b  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00bd3e3e  c645e811  MOV byte ptr [EBP + -0x18],0x11
00bd3e42  8d4de0  LEA ECX,[EBP + -0x20]
00bd3e45  ba01000000  MOV EDX,0x1
00bd3e4a  8bc6  MOV EAX,ESI
00bd3e4c  e8ebbaffff  CALL 0x00bcf93c
00bd3e51  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00bd3e54  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd3e57  c645f011  MOV byte ptr [EBP + -0x10],0x11
00bd3e5b  8d55e4  LEA EDX,[EBP + -0x1c]
00bd3e5e  b901000000  MOV ECX,0x1
00bd3e63  58  POP EAX
00bd3e64  e8179cddff  CALL 0x009ada80
00bd3e69  33c0  XOR EAX,EAX
00bd3e6b  5a  POP EDX
00bd3e6c  59  POP ECX
00bd3e6d  59  POP ECX
00bd3e6e  648910  MOV dword ptr FS:[EAX],EDX
00bd3e71  eb30  JMP 0x00bd3ea3
00bd3ea3  33c0  XOR EAX,EAX
00bd3ea5  5a  POP EDX
00bd3ea6  59  POP ECX
00bd3ea7  59  POP ECX
00bd3ea8  648910  MOV dword ptr FS:[EAX],EDX
00bd3eab  68d73ebd00  PUSH 0xbd3ed7
00bd3eb0  8d45dc  LEA EAX,[EBP + -0x24]
00bd3eb3  ba02000000  MOV EDX,0x2
00bd3eb8  e8777183ff  CALL 0x0040b034
00bd3ebd  8d45f4  LEA EAX,[EBP + -0xc]
00bd3ec0  e873c883ff  CALL 0x00410738
00bd3ec5  8d45f8  LEA EAX,[EBP + -0x8]
00bd3ec8  e8077183ff  CALL 0x0040afd4
00bd3ecd  58  POP EAX
00bd3ece  ffe0  JMP EAX
