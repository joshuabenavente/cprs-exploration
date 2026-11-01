; Static instruction listing. Function bodies and indirect exception flow require review.
00a0c248  55  PUSH EBP
00a0c249  8bec  MOV EBP,ESP
00a0c24b  83c4f8  ADD ESP,-0x8
00a0c24e  50  PUSH EAX
00a0c24f  6a00  PUSH 0x0
00a0c251  6a00  PUSH 0x0
00a0c253  8d4508  LEA EAX,[EBP + 0x8]
00a0c256  8945f8  MOV dword ptr [EBP + -0x8],EAX
00a0c259  c645fc10  MOV byte ptr [EBP + -0x4],0x10
00a0c25d  8d55f8  LEA EDX,[EBP + -0x8]
00a0c260  33c9  XOR ECX,ECX
00a0c262  b880c2a000  MOV EAX,0xa0c280
00a0c267  e8b816faff  CALL 0x009ad924
00a0c26c  59  POP ECX
00a0c26d  59  POP ECX
00a0c26e  5d  POP EBP
00a0c26f  c20800  RET 0x8
