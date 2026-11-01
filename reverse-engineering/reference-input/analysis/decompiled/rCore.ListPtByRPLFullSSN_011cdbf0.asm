; Static instruction listing. Function bodies and indirect exception flow require review.
011cdbf0  55  PUSH EBP
011cdbf1  8bec  MOV EBP,ESP
011cdbf3  b906000000  MOV ECX,0x6
011cdbf8  6a00  PUSH 0x0
011cdbfa  6a00  PUSH 0x0
011cdbfc  49  DEC ECX
011cdbfd  75f9  JNZ 0x011cdbf8
011cdbff  53  PUSH EBX
011cdc00  56  PUSH ESI
011cdc01  57  PUSH EDI
011cdc02  8bda  MOV EBX,EDX
011cdc04  8bf0  MOV ESI,EAX
011cdc06  33c0  XOR EAX,EAX
011cdc08  55  PUSH EBP
011cdc09  68d7dd1c01  PUSH 0x11cddd7
011cdc0e  64ff30  PUSH dword ptr FS:[EAX]
011cdc11  648920  MOV dword ptr FS:[EAX],ESP
011cdc14  8d45fc  LEA EAX,[EBP + -0x4]
011cdc17  8bd3  MOV EDX,EBX
011cdc19  e8eed723ff  CALL 0x0040b40c
011cdc1e  b901000000  MOV ECX,0x1
011cdc23  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011cdc26  b8f4dd1c01  MOV EAX,0x11cddf4
011cdc2b  e880e823ff  CALL 0x0040c4b0
011cdc30  8bd8  MOV EBX,EAX
011cdc32  85db  TEST EBX,EBX
011cdc34  7e52  JLE 0x011cdc88
011cdc36  8d45ec  LEA EAX,[EBP + -0x14]
011cdc39  50  PUSH EAX
011cdc3a  8d5301  LEA EDX,[EBX + 0x1]
011cdc3d  b90c000000  MOV ECX,0xc
011cdc42  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdc45  e812e723ff  CALL 0x0040c35c
011cdc4a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011cdc4d  50  PUSH EAX
011cdc4e  8d45e8  LEA EAX,[EBP + -0x18]
011cdc51  50  PUSH EAX
011cdc52  8bcb  MOV ECX,EBX
011cdc54  49  DEC ECX
011cdc55  ba01000000  MOV EDX,0x1
011cdc5a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdc5d  e8fae623ff  CALL 0x0040c35c
011cdc62  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
011cdc65  8d45fc  LEA EAX,[EBP + -0x4]
011cdc68  59  POP ECX
011cdc69  e81ee523ff  CALL 0x0040c18c
011cdc6e  b901000000  MOV ECX,0x1
011cdc73  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011cdc76  b8f4dd1c01  MOV EAX,0x11cddf4
011cdc7b  e830e823ff  CALL 0x0040c4b0
011cdc80  8bf8  MOV EDI,EAX
011cdc82  8bdf  MOV EBX,EDI
011cdc84  85db  TEST EBX,EBX
011cdc86  7fae  JG 0x011cdc36
011cdc88  56  PUSH ESI
011cdc89  6a00  PUSH 0x0
011cdc8b  8d55dc  LEA EDX,[EBP + -0x24]
011cdc8e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdc91  e812e525ff  CALL 0x0042c1a8
011cdc96  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011cdc99  8945e0  MOV dword ptr [EBP + -0x20],EAX
011cdc9c  c645e411  MOV byte ptr [EBP + -0x1c],0x11
011cdca0  8d55e0  LEA EDX,[EBP + -0x20]
011cdca3  33c9  XOR ECX,ECX
011cdca5  b804de1c01  MOV EAX,0x11cde04
011cdcaa  e8d1fd7dff  CALL 0x009ada80
011cdcaf  6a00  PUSH 0x0
011cdcb1  b902000000  MOV ECX,0x2
011cdcb6  66ba5e00  MOV DX,0x5e
011cdcba  8bc6  MOV EAX,ESI
011cdcbc  e8c7557eff  CALL 0x009b3288
011cdcc1  8bc6  MOV EAX,ESI
011cdcc3  8b10  MOV EDX,dword ptr [EAX]
011cdcc5  ff5214  CALL dword ptr [EDX + 0x14]
011cdcc8  48  DEC EAX
011cdcc9  85c0  TEST EAX,EAX
011cdccb  0f8cc8000000  JL 0x011cdd99
011cdcd1  40  INC EAX
011cdcd2  8945f0  MOV dword ptr [EBP + -0x10],EAX
011cdcd5  33db  XOR EBX,EBX
011cdcd7  8d4dfc  LEA ECX,[EBP + -0x4]
011cdcda  8bd3  MOV EDX,EBX
011cdcdc  8bc6  MOV EAX,ESI
011cdcde  8b38  MOV EDI,dword ptr [EAX]
011cdce0  ff570c  CALL dword ptr [EDI + 0xc]
011cdce3  8d45f8  LEA EAX,[EBP + -0x8]
011cdce6  50  PUSH EAX
011cdce7  b903000000  MOV ECX,0x3
011cdcec  66ba5e00  MOV DX,0x5e
011cdcf0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdcf3  e8f4cf5cff  CALL 0x0079acec
011cdcf8  8d45f4  LEA EAX,[EBP + -0xc]
011cdcfb  50  PUSH EAX
011cdcfc  b904000000  MOV ECX,0x4
011cdd01  66ba5e00  MOV DX,0x5e
011cdd05  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdd08  e8dfcf5cff  CALL 0x0079acec
011cdd0d  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011cdd10  e83fc9ffff  CALL 0x011ca654
011cdd15  84c0  TEST AL,AL
011cdd17  741b  JZ 0x011cdd34
011cdd19  8d4dd8  LEA ECX,[EBP + -0x28]
011cdd1c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011cdd1f  b834de1c01  MOV EAX,0x11cde34
011cdd24  e86b3a7eff  CALL 0x009b1794
011cdd29  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
011cdd2c  8d45f8  LEA EAX,[EBP + -0x8]
011cdd2f  e8d8d623ff  CALL 0x0040b40c
011cdd34  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011cdd37  e8ccc8ffff  CALL 0x011ca608
011cdd3c  84c0  TEST AL,AL
011cdd3e  7416  JZ 0x011cdd56
011cdd40  8d55d4  LEA EDX,[EBP + -0x2c]
011cdd43  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011cdd46  e8a5c7ffff  CALL 0x011ca4f0
011cdd4b  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
011cdd4e  8d45f4  LEA EAX,[EBP + -0xc]
011cdd51  e8b6d623ff  CALL 0x0040b40c
011cdd56  ff75f4  PUSH dword ptr [EBP + -0xc]
011cdd59  6858de1c01  PUSH 0x11cde58
011cdd5e  ff75f8  PUSH dword ptr [EBP + -0x8]
011cdd61  8d45d0  LEA EAX,[EBP + -0x30]
011cdd64  ba03000000  MOV EDX,0x3
011cdd69  e8a6e423ff  CALL 0x0040c214
011cdd6e  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
011cdd71  50  PUSH EAX
011cdd72  8d45fc  LEA EAX,[EBP + -0x4]
011cdd75  b903000000  MOV ECX,0x3
011cdd7a  66ba5e00  MOV DX,0x5e
011cdd7e  e8b5d15cff  CALL 0x0079af38
011cdd83  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
011cdd86  8bd3  MOV EDX,EBX
011cdd88  8bc6  MOV EAX,ESI
011cdd8a  8b38  MOV EDI,dword ptr [EAX]
011cdd8c  ff5720  CALL dword ptr [EDI + 0x20]
011cdd8f  43  INC EBX
011cdd90  ff4df0  DEC dword ptr [EBP + -0x10]
011cdd93  0f853effffff  JNZ 0x011cdcd7
011cdd99  8bc6  MOV EAX,ESI
011cdd9b  e8584f7eff  CALL 0x009b2cf8
011cdda0  33c0  XOR EAX,EAX
011cdda2  5a  POP EDX
011cdda3  59  POP ECX
011cdda4  59  POP ECX
011cdda5  648910  MOV dword ptr FS:[EAX],EDX
011cdda8  68dedd1c01  PUSH 0x11cddde
011cddad  8d45d0  LEA EAX,[EBP + -0x30]
011cddb0  ba04000000  MOV EDX,0x4
011cddb5  e87ad223ff  CALL 0x0040b034
011cddba  8d45e8  LEA EAX,[EBP + -0x18]
011cddbd  ba02000000  MOV EDX,0x2
011cddc2  e86dd223ff  CALL 0x0040b034
011cddc7  8d45f4  LEA EAX,[EBP + -0xc]
011cddca  ba03000000  MOV EDX,0x3
011cddcf  e860d223ff  CALL 0x0040b034
011cddd4  58  POP EAX
011cddd5  ffe0  JMP EAX
