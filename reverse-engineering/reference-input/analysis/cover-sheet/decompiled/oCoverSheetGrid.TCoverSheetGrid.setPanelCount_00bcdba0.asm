; Static instruction listing. Function bodies and indirect exception flow require review.
00bcdba0  55  PUSH EBP
00bcdba1  8bec  MOV EBP,ESP
00bcdba3  81c488fdffff  ADD ESP,0xfffffd88
00bcdba9  53  PUSH EBX
00bcdbaa  56  PUSH ESI
00bcdbab  8bf2  MOV ESI,EDX
00bcdbad  8bd8  MOV EBX,EAX
00bcdbaf  8d4310  LEA EAX,[EBX + 0x10]
00bcdbb2  8b15fcd7bc00  MOV EDX,dword ptr [0x00bcd7fc]
00bcdbb8  e81f0f84ff  CALL 0x0040eadc
00bcdbbd  83fe01  CMP ESI,0x1
00bcdbc0  7c05  JL 0x00bcdbc7
00bcdbc2  83fe0c  CMP ESI,0xc
00bcdbc5  7e2e  JLE 0x00bcdbf5
00bcdbc7  89b588fdffff  MOV dword ptr [EBP + 0xfffffd88],ESI
00bcdbcd  c6858cfdffff00  MOV byte ptr [EBP + 0xfffffd8c],0x0
00bcdbd4  8d8588fdffff  LEA EAX,[EBP + 0xfffffd88]
00bcdbda  50  PUSH EAX
00bcdbdb  6a00  PUSH 0x0
00bcdbdd  b92ce8bc00  MOV ECX,0xbce82c
00bcdbe2  b201  MOV DL,0x1
00bcdbe4  a140454200  MOV EAX,[0x00424540]
00bcdbe9  e8ee8386ff  CALL 0x00435fdc
00bcdbee  e84dca83ff  CALL 0x0040a640
00bcdbf3  eb17  JMP 0x00bcdc0c
00bcdbf5  56  PUSH ESI
00bcdbf6  8d4310  LEA EAX,[EBX + 0x10]
00bcdbf9  b901000000  MOV ECX,0x1
00bcdbfe  8b15fcd7bc00  MOV EDX,dword ptr [0x00bcd7fc]
00bcdc04  e8af0d84ff  CALL 0x0040e9b8
00bcdc09  83c404  ADD ESP,0x4
00bcdc0c  83fe0c  CMP ESI,0xc
00bcdc0f  0f87fe0b0000  JA 0x00bce813
00bcdc15  ff24b51cdcbc00  JMP dword ptr [ESI*0x4 + 0xbcdc1c]
00bce813  33c0  XOR EAX,EAX
00bce815  89430c  MOV dword ptr [EBX + 0xc],EAX
00bce818  5e  POP ESI
00bce819  5b  POP EBX
00bce81a  8be5  MOV ESP,EBP
00bce81c  5d  POP EBP
00bce81d  c3  RET
