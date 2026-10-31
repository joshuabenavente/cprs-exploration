; Static instruction listing. Function bodies and indirect exception flow require review.
011df26c  55  PUSH EBP
011df26d  8bec  MOV EBP,ESP
011df26f  83c4f4  ADD ESP,-0xc
011df272  8945fc  MOV dword ptr [EBP + -0x4],EAX
011df275  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011df278  50  PUSH EAX
011df279  6a00  PUSH 0x0
011df27b  33c0  XOR EAX,EAX
011df27d  8945f4  MOV dword ptr [EBP + -0xc],EAX
011df280  c645f805  MOV byte ptr [EBP + -0x8],0x5
011df284  8d55f4  LEA EDX,[EBP + -0xc]
011df287  33c9  XOR ECX,ECX
011df289  b8a4f21d01  MOV EAX,0x11df2a4
011df28e  e8ede77cff  CALL 0x009ada80
011df293  8be5  MOV ESP,EBP
011df295  5d  POP EBP
011df296  c3  RET
