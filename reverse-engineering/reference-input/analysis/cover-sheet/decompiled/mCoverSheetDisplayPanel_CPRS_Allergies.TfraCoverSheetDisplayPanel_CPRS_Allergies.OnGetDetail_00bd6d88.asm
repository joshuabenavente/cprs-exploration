; Static instruction listing. Function bodies and indirect exception flow require review.
00bd6d88  55  PUSH EBP
00bd6d89  8bec  MOV EBP,ESP
00bd6d8b  83c4e0  ADD ESP,-0x20
00bd6d8e  53  PUSH EBX
00bd6d8f  56  PUSH ESI
00bd6d90  33db  XOR EBX,EBX
00bd6d92  895df8  MOV dword ptr [EBP + -0x8],EBX
00bd6d95  895de0  MOV dword ptr [EBP + -0x20],EBX
00bd6d98  895df4  MOV dword ptr [EBP + -0xc],EBX
00bd6d9b  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd6d9e  8bf2  MOV ESI,EDX
00bd6da0  8bd8  MOV EBX,EAX
00bd6da2  33c0  XOR EAX,EAX
00bd6da4  55  PUSH EBP
00bd6da5  682f6ebd00  PUSH 0xbd6e2f
00bd6daa  64ff30  PUSH dword ptr FS:[EAX]
00bd6dad  648920  MOV dword ptr FS:[EAX],ESP
00bd6db0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd6db3  50  PUSH EAX
00bd6db4  6a00  PUSH 0x0
00bd6db6  8d55f4  LEA EDX,[EBP + -0xc]
00bd6db9  8bc3  MOV EAX,EBX
00bd6dbb  e864caffff  CALL 0x00bd3824
00bd6dc0  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd6dc3  8d55f8  LEA EDX,[EBP + -0x8]
00bd6dc6  8b08  MOV ECX,dword ptr [EAX]
00bd6dc8  ff5138  CALL dword ptr [ECX + 0x38]
00bd6dcb  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6dce  50  PUSH EAX
00bd6dcf  a1e0f22401  MOV EAX,[0x0124f2e0]
00bd6dd4  8b00  MOV EAX,dword ptr [EAX]
00bd6dd6  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bd6dd9  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00bd6ddc  c645e811  MOV byte ptr [EBP + -0x18],0x11
00bd6de0  8d4de0  LEA ECX,[EBP + -0x20]
00bd6de3  ba01000000  MOV EDX,0x1
00bd6de8  8bc6  MOV EAX,ESI
00bd6dea  e84d8bffff  CALL 0x00bcf93c
00bd6def  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00bd6df2  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd6df5  c645f011  MOV byte ptr [EBP + -0x10],0x11
00bd6df9  8d55e4  LEA EDX,[EBP + -0x1c]
00bd6dfc  b901000000  MOV ECX,0x1
00bd6e01  58  POP EAX
00bd6e02  e8796cddff  CALL 0x009ada80
00bd6e07  33c0  XOR EAX,EAX
00bd6e09  5a  POP EDX
00bd6e0a  59  POP ECX
00bd6e0b  59  POP ECX
00bd6e0c  648910  MOV dword ptr FS:[EAX],EDX
00bd6e0f  68366ebd00  PUSH 0xbd6e36
00bd6e14  8d45e0  LEA EAX,[EBP + -0x20]
00bd6e17  e8b84183ff  CALL 0x0040afd4
00bd6e1c  8d45f4  LEA EAX,[EBP + -0xc]
00bd6e1f  e8149983ff  CALL 0x00410738
00bd6e24  8d45f8  LEA EAX,[EBP + -0x8]
00bd6e27  e8a84183ff  CALL 0x0040afd4
00bd6e2c  58  POP EAX
00bd6e2d  ffe0  JMP EAX
