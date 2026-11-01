; Static instruction listing. Function bodies and indirect exception flow require review.
011cde60  55  PUSH EBP
011cde61  8bec  MOV EBP,ESP
011cde63  83c4f8  ADD ESP,-0x8
011cde66  53  PUSH EBX
011cde67  8bd8  MOV EBX,EAX
011cde69  53  PUSH EBX
011cde6a  6a00  PUSH 0x0
011cde6c  33c0  XOR EAX,EAX
011cde6e  8945f8  MOV dword ptr [EBP + -0x8],EAX
011cde71  c645fc05  MOV byte ptr [EBP + -0x4],0x5
011cde75  8d55f8  LEA EDX,[EBP + -0x8]
011cde78  33c9  XOR ECX,ECX
011cde7a  b89cde1c01  MOV EAX,0x11cde9c
011cde7f  e8fcfb7dff  CALL 0x009ada80
011cde84  8bc3  MOV EAX,EBX
011cde86  e86d4e7eff  CALL 0x009b2cf8
011cde8b  5b  POP EBX
011cde8c  59  POP ECX
011cde8d  59  POP ECX
011cde8e  5d  POP EBP
011cde8f  c3  RET
