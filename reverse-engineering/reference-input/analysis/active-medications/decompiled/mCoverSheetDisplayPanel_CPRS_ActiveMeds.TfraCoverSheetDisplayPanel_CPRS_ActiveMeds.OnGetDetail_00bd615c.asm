; Static instruction listing. Function bodies and indirect exception flow require review.
00bd615c  55  PUSH EBP
00bd615d  8bec  MOV EBP,ESP
00bd615f  83c4e0  ADD ESP,-0x20
00bd6162  53  PUSH EBX
00bd6163  56  PUSH ESI
00bd6164  33db  XOR EBX,EBX
00bd6166  895df8  MOV dword ptr [EBP + -0x8],EBX
00bd6169  895de0  MOV dword ptr [EBP + -0x20],EBX
00bd616c  895df4  MOV dword ptr [EBP + -0xc],EBX
00bd616f  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd6172  8bf2  MOV ESI,EDX
00bd6174  8bd8  MOV EBX,EAX
00bd6176  33c0  XOR EAX,EAX
00bd6178  55  PUSH EBP
00bd6179  680362bd00  PUSH 0xbd6203
00bd617e  64ff30  PUSH dword ptr FS:[EAX]
00bd6181  648920  MOV dword ptr FS:[EAX],ESP
00bd6184  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd6187  50  PUSH EAX
00bd6188  6a00  PUSH 0x0
00bd618a  8d55f4  LEA EDX,[EBP + -0xc]
00bd618d  8bc3  MOV EAX,EBX
00bd618f  e890d6ffff  CALL 0x00bd3824
00bd6194  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd6197  8d55f8  LEA EDX,[EBP + -0x8]
00bd619a  8b08  MOV ECX,dword ptr [EAX]
00bd619c  ff5138  CALL dword ptr [ECX + 0x38]
00bd619f  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd61a2  50  PUSH EAX
00bd61a3  a1e0f22401  MOV EAX,[0x0124f2e0]
00bd61a8  8b00  MOV EAX,dword ptr [EAX]
00bd61aa  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bd61ad  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00bd61b0  c645e811  MOV byte ptr [EBP + -0x18],0x11
00bd61b4  8d4de0  LEA ECX,[EBP + -0x20]
00bd61b7  ba01000000  MOV EDX,0x1
00bd61bc  8bc6  MOV EAX,ESI
00bd61be  e87997ffff  CALL 0x00bcf93c
00bd61c3  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00bd61c6  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd61c9  c645f011  MOV byte ptr [EBP + -0x10],0x11
00bd61cd  8d55e4  LEA EDX,[EBP + -0x1c]
00bd61d0  b901000000  MOV ECX,0x1
00bd61d5  58  POP EAX
00bd61d6  e8a578ddff  CALL 0x009ada80
00bd61db  33c0  XOR EAX,EAX
00bd61dd  5a  POP EDX
00bd61de  59  POP ECX
00bd61df  59  POP ECX
00bd61e0  648910  MOV dword ptr FS:[EAX],EDX
00bd61e3  680a62bd00  PUSH 0xbd620a
00bd61e8  8d45e0  LEA EAX,[EBP + -0x20]
00bd61eb  e8e44d83ff  CALL 0x0040afd4
00bd61f0  8d45f4  LEA EAX,[EBP + -0xc]
00bd61f3  e840a583ff  CALL 0x00410738
00bd61f8  8d45f8  LEA EAX,[EBP + -0x8]
00bd61fb  e8d44d83ff  CALL 0x0040afd4
00bd6200  58  POP EAX
00bd6201  ffe0  JMP EAX
