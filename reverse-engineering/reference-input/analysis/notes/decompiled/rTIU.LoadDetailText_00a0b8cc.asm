; Static instruction listing. Function bodies and indirect exception flow require review.
00a0b8cc  55  PUSH EBP
00a0b8cd  8bec  MOV EBP,ESP
00a0b8cf  83c4f8  ADD ESP,-0x8
00a0b8d2  50  PUSH EAX
00a0b8d3  6a00  PUSH 0x0
00a0b8d5  8955f8  MOV dword ptr [EBP + -0x8],EDX
00a0b8d8  c645fc00  MOV byte ptr [EBP + -0x4],0x0
00a0b8dc  8d45f8  LEA EAX,[EBP + -0x8]
00a0b8df  8bd0  MOV EDX,EAX
00a0b8e1  33c9  XOR ECX,ECX
00a0b8e3  b800b9a000  MOV EAX,0xa0b900
00a0b8e8  e89321faff  CALL 0x009ada80
00a0b8ed  59  POP ECX
00a0b8ee  59  POP ECX
00a0b8ef  5d  POP EBP
00a0b8f0  c3  RET
