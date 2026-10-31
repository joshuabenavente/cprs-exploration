; Static instruction listing. Function bodies and indirect exception flow require review.
00bf05e8  55  PUSH EBP
00bf05e9  8bec  MOV EBP,ESP
00bf05eb  83c4f8  ADD ESP,-0x8
00bf05ee  53  PUSH EBX
00bf05ef  8bd8  MOV EBX,EAX
00bf05f1  53  PUSH EBX
00bf05f2  6a00  PUSH 0x0
00bf05f4  a1e0f22401  MOV EAX,[0x0124f2e0]
00bf05f9  8b00  MOV EAX,dword ptr [EAX]
00bf05fb  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bf05fe  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bf0601  c645fc11  MOV byte ptr [EBP + -0x4],0x11
00bf0605  8d55f8  LEA EDX,[EBP + -0x8]
00bf0608  33c9  XOR ECX,ECX
00bf060a  b82c06bf00  MOV EAX,0xbf062c
00bf060f  e86cd4dbff  CALL 0x009ada80
00bf0614  8bc3  MOV EAX,EBX
00bf0616  e8dd26dcff  CALL 0x009b2cf8
00bf061b  5b  POP EBX
00bf061c  59  POP ECX
00bf061d  59  POP ECX
00bf061e  5d  POP EBP
00bf061f  c3  RET
