; Static instruction listing. Function bodies and indirect exception flow require review.
00bd6b7c  55  PUSH EBP
00bd6b7d  8bec  MOV EBP,ESP
00bd6b7f  b905000000  MOV ECX,0x5
00bd6b84  6a00  PUSH 0x0
00bd6b86  6a00  PUSH 0x0
00bd6b88  49  DEC ECX
00bd6b89  75f9  JNZ 0x00bd6b84
00bd6b8b  51  PUSH ECX
00bd6b8c  53  PUSH EBX
00bd6b8d  56  PUSH ESI
00bd6b8e  8bda  MOV EBX,EDX
00bd6b90  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bd6b93  33c0  XOR EAX,EAX
00bd6b95  55  PUSH EBP
00bd6b96  687a6dbd00  PUSH 0xbd6d7a
00bd6b9b  64ff30  PUSH dword ptr FS:[EAX]
00bd6b9e  648920  MOV dword ptr FS:[EAX],ESP
00bd6ba1  33d2  XOR EDX,EDX
00bd6ba3  55  PUSH EBP
00bd6ba4  684e6dbd00  PUSH 0xbd6d4e
00bd6ba9  64ff32  PUSH dword ptr FS:[EDX]
00bd6bac  648922  MOV dword ptr FS:[EDX],ESP
00bd6baf  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6bb2  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd6bb8  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd6bbe  e8b164aaff  CALL 0x0067d074
00bd6bc3  33c0  XOR EAX,EAX
00bd6bc5  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bd6bc8  8bcb  MOV ECX,EBX
00bd6bca  b201  MOV DL,0x1
00bd6bcc  a190594a00  MOV EAX,[0x004a5990]
00bd6bd1  e88ae88fff  CALL 0x004d5460
00bd6bd6  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bd6bd9  33c0  XOR EAX,EAX
00bd6bdb  55  PUSH EBP
00bd6bdc  68236dbd00  PUSH 0xbd6d23
00bd6be1  64ff30  PUSH dword ptr FS:[EAX]
00bd6be4  648920  MOV dword ptr FS:[EAX],ESP
00bd6be7  e9f1000000  JMP 0x00bd6cdd
00bd6bec  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd6bef  ff4004  INC dword ptr [EAX + 0x4]
00bd6bf2  8d55fc  LEA EDX,[EBP + -0x4]
00bd6bf5  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd6bf8  e8a7e88fff  CALL 0x004d54a4
00bd6bfd  6a5e  PUSH 0x5e
00bd6bff  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bd6c02  b201  MOV DL,0x1
00bd6c04  a17cecbc00  MOV EAX,[0x00bcec7c]
00bd6c09  e8628bffff  CALL 0x00bcf770
00bd6c0e  8bd8  MOV EBX,EAX
00bd6c10  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6c13  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd6c19  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd6c1f  e85c62aaff  CALL 0x0067ce80
00bd6c24  85c0  TEST EAX,EAX
00bd6c26  7522  JNZ 0x00bd6c4a
00bd6c28  ba01000000  MOV EDX,0x1
00bd6c2d  8bc3  MOV EAX,EBX
00bd6c2f  e8a09fffff  CALL 0x00bd0bd4
00bd6c34  84c0  TEST AL,AL
00bd6c36  740a  JZ 0x00bd6c42
00bd6c38  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6c3b  e860caffff  CALL 0x00bd36a0
00bd6c40  eb08  JMP 0x00bd6c4a
00bd6c42  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6c45  e896cfffff  CALL 0x00bd3be0
00bd6c4a  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6c4d  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd6c53  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd6c59  e88261aaff  CALL 0x0067cde0
00bd6c5e  8bf0  MOV ESI,EAX
00bd6c60  8d4de4  LEA ECX,[EBP + -0x1c]
00bd6c63  ba02000000  MOV EDX,0x2
00bd6c68  8bc3  MOV EAX,EBX
00bd6c6a  e8cd8cffff  CALL 0x00bcf93c
00bd6c6f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bd6c72  8d4de8  LEA ECX,[EBP + -0x18]
00bd6c75  33d2  XOR EDX,EDX
00bd6c77  e8ecbdddff  CALL 0x009b2a68
00bd6c7c  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00bd6c7f  8bc6  MOV EAX,ESI
00bd6c81  e85258aaff  CALL 0x0067c4d8
00bd6c86  8d4ddc  LEA ECX,[EBP + -0x24]
00bd6c89  ba03000000  MOV EDX,0x3
00bd6c8e  8bc3  MOV EAX,EBX
00bd6c90  e8a78cffff  CALL 0x00bcf93c
00bd6c95  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00bd6c98  8d4de0  LEA ECX,[EBP + -0x20]
00bd6c9b  33d2  XOR EDX,EDX
00bd6c9d  e8c6bdddff  CALL 0x009b2a68
00bd6ca2  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00bd6ca5  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bd6ca8  8b08  MOV ECX,dword ptr [EAX]
00bd6caa  ff513c  CALL dword ptr [ECX + 0x3c]
00bd6cad  8d4dd4  LEA ECX,[EBP + -0x2c]
00bd6cb0  ba04000000  MOV EDX,0x4
00bd6cb5  8bc3  MOV EAX,EBX
00bd6cb7  e8808cffff  CALL 0x00bcf93c
00bd6cbc  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bd6cbf  8d4dd8  LEA ECX,[EBP + -0x28]
00bd6cc2  33d2  XOR EDX,EDX
00bd6cc4  e89fbdddff  CALL 0x009b2a68
00bd6cc9  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
00bd6ccc  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bd6ccf  8b08  MOV ECX,dword ptr [EAX]
00bd6cd1  ff513c  CALL dword ptr [ECX + 0x3c]
00bd6cd4  8bd3  MOV EDX,EBX
00bd6cd6  8bc6  MOV EAX,ESI
00bd6cd8  e80359aaff  CALL 0x0067c5e0
00bd6cdd  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd6ce0  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bd6ce3  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd6ce6  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bd6ce9  8b10  MOV EDX,dword ptr [EAX]
00bd6ceb  ff5214  CALL dword ptr [EDX + 0x14]
00bd6cee  48  DEC EAX
00bd6cef  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
00bd6cf2  3b4204  CMP EAX,dword ptr [EDX + 0x4]
00bd6cf5  0f9f45ef  SETG byte ptr [EBP + -0x11]
00bd6cf9  807def00  CMP byte ptr [EBP + -0x11],0x0
00bd6cfd  0f85e9feffff  JNZ 0x00bd6bec
00bd6d03  33c0  XOR EAX,EAX
00bd6d05  5a  POP EDX
00bd6d06  59  POP ECX
00bd6d07  59  POP ECX
00bd6d08  648910  MOV dword ptr FS:[EAX],EDX
00bd6d0b  682a6dbd00  PUSH 0xbd6d2a
00bd6d10  837df400  CMP dword ptr [EBP + -0xc],0x0
00bd6d14  740a  JZ 0x00bd6d20
00bd6d16  b201  MOV DL,0x1
00bd6d18  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd6d1b  8b08  MOV ECX,dword ptr [EAX]
00bd6d1d  ff51fc  CALL dword ptr [ECX + -0x4]
00bd6d20  58  POP EAX
00bd6d21  ffe0  JMP EAX
