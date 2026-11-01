; Static instruction listing. Function bodies and indirect exception flow require review.
00a0b870  55  PUSH EBP
00a0b871  8bec  MOV EBP,ESP
00a0b873  83c4f8  ADD ESP,-0x8
00a0b876  50  PUSH EAX
00a0b877  6a00  PUSH 0x0
00a0b879  8955f8  MOV dword ptr [EBP + -0x8],EDX
00a0b87c  c645fc00  MOV byte ptr [EBP + -0x4],0x0
00a0b880  8d45f8  LEA EAX,[EBP + -0x8]
00a0b883  8bd0  MOV EDX,EAX
00a0b885  33c9  XOR ECX,ECX
00a0b887  b8a4b8a000  MOV EAX,0xa0b8a4
00a0b88c  e8ef21faff  CALL 0x009ada80
00a0b891  59  POP ECX
00a0b892  59  POP ECX
00a0b893  5d  POP EBP
00a0b894  c3  RET
