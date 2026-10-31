; Static instruction listing. Function bodies and indirect exception flow require review.
00bf0374  55  PUSH EBP
00bf0375  8bec  MOV EBP,ESP
00bf0377  83c4e8  ADD ESP,-0x18
00bf037a  53  PUSH EBX
00bf037b  56  PUSH ESI
00bf037c  8bf0  MOV ESI,EAX
00bf037e  b201  MOV DL,0x1
00bf0380  a100734a00  MOV EAX,[0x004a7300]
00bf0385  e86a7e8eff  CALL 0x004d81f4
00bf038a  8bd8  MOV EBX,EAX
00bf038c  53  PUSH EBX
00bf038d  6a00  PUSH 0x0
00bf038f  a1e0f22401  MOV EAX,[0x0124f2e0]
00bf0394  8b00  MOV EAX,dword ptr [EAX]
00bf0396  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bf0399  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bf039c  c645ec11  MOV byte ptr [EBP + -0x14],0x11
00bf03a0  8975f0  MOV dword ptr [EBP + -0x10],ESI
00bf03a3  c645f400  MOV byte ptr [EBP + -0xc],0x0
00bf03a7  33c0  XOR EAX,EAX
00bf03a9  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bf03ac  c645fc11  MOV byte ptr [EBP + -0x4],0x11
00bf03b0  8d55e8  LEA EDX,[EBP + -0x18]
00bf03b3  b902000000  MOV ECX,0x2
00bf03b8  b8d803bf00  MOV EAX,0xbf03d8
00bf03bd  e8bed6dbff  CALL 0x009ada80
00bf03c2  8bc3  MOV EAX,EBX
00bf03c4  5e  POP ESI
00bf03c5  5b  POP EBX
00bf03c6  8be5  MOV ESP,EBP
00bf03c8  5d  POP EBP
00bf03c9  c3  RET
