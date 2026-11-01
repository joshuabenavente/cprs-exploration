00ae6cb0  55  PUSH EBP
00ae6cb1  8bec  MOV EBP,ESP
00ae6cb3  51  PUSH ECX
00ae6cb4  b90f000000  MOV ECX,0xf
00ae6cb9  6a00  PUSH 0x0
00ae6cbb  6a00  PUSH 0x0
00ae6cbd  49  DEC ECX
00ae6cbe  75f9  JNZ 0x00ae6cb9
00ae6cc0  51  PUSH ECX
00ae6cc1  874dfc  XCHG dword ptr [EBP + -0x4],ECX
00ae6cc4  53  PUSH EBX
00ae6cc5  56  PUSH ESI
00ae6cc6  57  PUSH EDI
00ae6cc7  894dd0  MOV dword ptr [EBP + -0x30],ECX
00ae6cca  8955d4  MOV dword ptr [EBP + -0x2c],EDX
00ae6ccd  8bf8  MOV EDI,EAX
00ae6ccf  8b5d08  MOV EBX,dword ptr [EBP + 0x8]
00ae6cd2  8b450c  MOV EAX,dword ptr [EBP + 0xc]
00ae6cd5  e8ee4392ff  CALL 0x0040b0c8
00ae6cda  8d45d8  LEA EAX,[EBP + -0x28]
00ae6cdd  8b15d4db1801  MOV EDX,dword ptr [0x0118dbd4]
00ae6ce3  e8b45c92ff  CALL 0x0040c99c
00ae6ce8  33c0  XOR EAX,EAX
00ae6cea  55  PUSH EBP
00ae6ceb  684c70ae00  PUSH 0xae704c
00ae6cf0  64ff30  PUSH dword ptr FS:[EAX]
00ae6cf3  648920  MOV dword ptr FS:[EAX],ESP
00ae6cf6  8d45fc  LEA EAX,[EBP + -0x4]
00ae6cf9  ba6870ae00  MOV EDX,0xae7068
00ae6cfe  e8b14792ff  CALL 0x0040b4b4
00ae6d03  c60300  MOV byte ptr [EBX],0x0
00ae6d06  8d45d8  LEA EAX,[EBP + -0x28]
00ae6d09  e8c6feffff  CALL 0x00ae6bd4
00ae6d0e  33d2  XOR EDX,EDX
00ae6d10  55  PUSH EBP
00ae6d11  68e56fae00  PUSH 0xae6fe5
00ae6d16  64ff32  PUSH dword ptr FS:[EDX]
00ae6d19  648922  MOV dword ptr FS:[EDX],ESP
00ae6d1c  0fb645e4  MOVZX EAX,byte ptr [EBP + -0x1c]
00ae6d20  2c01  SUB AL,0x1
00ae6d22  7213  JC 0x00ae6d37
00ae6d24  0f845a020000  JZ 0x00ae6f84
00ae6d2a  fec8  DEC AL
00ae6d2c  0f8479020000  JZ 0x00ae6fab
00ae6d32  e999020000  JMP 0x00ae6fd0
00ae6d37  33d2  XOR EDX,EDX
00ae6d39  55  PUSH EBP
00ae6d3a  68416fae00  PUSH 0xae6f41
00ae6d3f  64ff32  PUSH dword ptr FS:[EDX]
00ae6d42  648922  MOV dword ptr FS:[EDX],ESP
00ae6d45  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ae6d48  e8d34b92ff  CALL 0x0040b920
00ae6d4d  50  PUSH EAX
00ae6d4e  a1c07f2301  MOV EAX,[0x01237fc0]
00ae6d53  50  PUSH EAX
00ae6d54  e8274393ff  CALL 0x0041b080
00ae6d59  89c6  MOV ESI,EAX
00ae6d5b  85f6  TEST ESI,ESI
00ae6d5d  0f84b6010000  JZ 0x00ae6f19
00ae6d63  a1e0f22401  MOV EAX,[0x0124f2e0]
00ae6d68  8b00  MOV EAX,dword ptr [EAX]
00ae6d6a  80783500  CMP byte ptr [EAX + 0x35],0x0
00ae6d6e  742a  JZ 0x00ae6d9a
00ae6d70  e8b3a594ff  CALL 0x00431328
00ae6d75  d8258070ae00  FSUB float ptr [0x00ae7080]
00ae6d7b  dd5dc8  FSTP double ptr [EBP + -0x38]
00ae6d7e  9b  WAIT
00ae6d7f  ff75cc  PUSH dword ptr [EBP + -0x34]
00ae6d82  ff75c8  PUSH dword ptr [EBP + -0x38]
00ae6d85  8d4df8  LEA ECX,[EBP + -0x8]
00ae6d88  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00ae6d8e  b89070ae00  MOV EAX,0xae7090
00ae6d93  e8b8b794ff  CALL 0x00432550
00ae6d98  eb33  JMP 0x00ae6dcd
00ae6d9a  e889a594ff  CALL 0x00431328
00ae6d9f  83c4f8  ADD ESP,-0x8
00ae6da2  dd1c24  FSTP double ptr [ESP]
00ae6da5  9b  WAIT
00ae6da6  b8faffffff  MOV EAX,0xfffffffa
00ae6dab  e8c8a594ff  CALL 0x00431378
00ae6db0  dd5dc0  FSTP double ptr [EBP + -0x40]
00ae6db3  9b  WAIT
00ae6db4  ff75c4  PUSH dword ptr [EBP + -0x3c]
00ae6db7  ff75c0  PUSH dword ptr [EBP + -0x40]
00ae6dba  8d4df8  LEA ECX,[EBP + -0x8]
00ae6dbd  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00ae6dc3  b89070ae00  MOV EAX,0xae7090
00ae6dc8  e883b794ff  CALL 0x00432550
00ae6dcd  68b070ae00  PUSH 0xae70b0
00ae6dd2  8d55b4  LEA EDX,[EBP + -0x4c]
00ae6dd5  8bc7  MOV EAX,EDI
00ae6dd7  e868a9ebff  CALL 0x009a1744
00ae6ddc  ff75b4  PUSH dword ptr [EBP + -0x4c]
00ae6ddf  68e470ae00  PUSH 0xae70e4
00ae6de4  ff7770  PUSH dword ptr [EDI + 0x70]
00ae6de7  68e470ae00  PUSH 0xae70e4
00ae6dec  8d55b0  LEA EDX,[EBP + -0x50]
00ae6def  8b4758  MOV EAX,dword ptr [EDI + 0x58]
00ae6df2  e8e56194ff  CALL 0x0042cfdc
00ae6df7  ff75b0  PUSH dword ptr [EBP + -0x50]
00ae6dfa  68e470ae00  PUSH 0xae70e4
00ae6dff  8d45ac  LEA EAX,[EBP + -0x54]
00ae6e02  50  PUSH EAX
00ae6e03  8b8788000000  MOV EAX,dword ptr [EDI + 0x88]
00ae6e09  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ae6e0c  b903000000  MOV ECX,0x3
00ae6e11  66ba5e00  MOV DX,0x5e
00ae6e15  e8d23ecbff  CALL 0x0079acec
00ae6e1a  ff75ac  PUSH dword ptr [EBP + -0x54]
00ae6e1d  8d45f4  LEA EAX,[EBP + -0xc]
00ae6e20  ba08000000  MOV EDX,0x8
00ae6e25  e8ea5392ff  CALL 0x0040c214
00ae6e2a  33c0  XOR EAX,EAX
00ae6e2c  8945f0  MOV dword ptr [EBP + -0x10],EAX
00ae6e2f  33c0  XOR EAX,EAX
00ae6e31  55  PUSH EBP
00ae6e32  68126fae00  PUSH 0xae6f12
00ae6e37  64ff30  PUSH dword ptr FS:[EAX]
00ae6e3a  648920  MOV dword ptr FS:[EAX],ESP
00ae6e3d  8d55f0  LEA EDX,[EBP + -0x10]
00ae6e40  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00ae6e43  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ae6e46  e8916194ff  CALL 0x0042cfdc
00ae6e4b  e8d8a494ff  CALL 0x00431328
00ae6e50  dd5db8  FSTP double ptr [EBP + -0x48]
00ae6e53  9b  WAIT
00ae6e54  8d55a4  LEA EDX,[EBP + -0x5c]
00ae6e57  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00ae6e5a  e8b9e06e00  CALL 0x011d4f18
00ae6e5f  ff75a4  PUSH dword ptr [EBP + -0x5c]
00ae6e62  68e470ae00  PUSH 0xae70e4
00ae6e67  ff750c  PUSH dword ptr [EBP + 0xc]
00ae6e6a  8d45a8  LEA EAX,[EBP + -0x58]
00ae6e6d  ba03000000  MOV EDX,0x3
00ae6e72  e89d5392ff  CALL 0x0040c214
00ae6e77  8b45a8  MOV EAX,dword ptr [EBP + -0x58]
00ae6e7a  50  PUSH EAX
00ae6e7b  8d45a0  LEA EAX,[EBP + -0x60]
00ae6e7e  50  PUSH EAX
00ae6e7f  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00ae6e82  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ae6e85  894590  MOV dword ptr [EBP + -0x70],EAX
00ae6e88  c6459411  MOV byte ptr [EBP + -0x6c],0x11
00ae6e8c  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00ae6e8f  8b4020  MOV EAX,dword ptr [EAX + 0x20]
00ae6e92  894598  MOV dword ptr [EBP + -0x68],EAX
00ae6e95  c6459c00  MOV byte ptr [EBP + -0x64],0x0
00ae6e99  8d5590  LEA EDX,[EBP + -0x70]
00ae6e9c  b901000000  MOV ECX,0x1
00ae6ea1  b8f470ae00  MOV EAX,0xae70f4
00ae6ea6  e86d8094ff  CALL 0x0042ef18
00ae6eab  8b45a0  MOV EAX,dword ptr [EBP + -0x60]
00ae6eae  50  PUSH EAX
00ae6eaf  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00ae6eb2  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ae6eb5  50  PUSH EAX
00ae6eb6  681471ae00  PUSH 0xae7114
00ae6ebb  ff75bc  PUSH dword ptr [EBP + -0x44]
00ae6ebe  ff75b8  PUSH dword ptr [EBP + -0x48]
00ae6ec1  8d4d8c  LEA ECX,[EBP + -0x74]
00ae6ec4  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00ae6eca  b89070ae00  MOV EAX,0xae7090
00ae6ecf  e87cb694ff  CALL 0x00432550
00ae6ed4  8b458c  MOV EAX,dword ptr [EBP + -0x74]
00ae6ed7  50  PUSH EAX
00ae6ed8  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00ae6edb  50  PUSH EAX
00ae6edc  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00ae6edf  50  PUSH EAX
00ae6ee0  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00ae6ee3  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ae6ee6  50  PUSH EAX
00ae6ee7  8d4588  LEA EAX,[EBP + -0x78]
00ae6eea  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00ae6eed  e8365192ff  CALL 0x0040c028
00ae6ef2  8b4588  MOV EAX,dword ptr [EBP + -0x78]
00ae6ef5  50  PUSH EAX
00ae6ef6  ffd6  CALL ESI
00ae6ef8  8803  MOV byte ptr [EBX],AL
00ae6efa  33c0  XOR EAX,EAX
00ae6efc  5a  POP EDX
00ae6efd  59  POP ECX
00ae6efe  59  POP ECX
00ae6eff  648910  MOV dword ptr FS:[EAX],EDX
00ae6f02  68346fae00  PUSH 0xae6f34
00ae6f07  8d45f0  LEA EAX,[EBP + -0x10]
00ae6f0a  e8c54092ff  CALL 0x0040afd4
00ae6f0f  58  POP EAX
00ae6f10  ffe0  JMP EAX
00ae6f19  6a00  PUSH 0x0
00ae6f1b  6aff  PUSH -0x1
00ae6f1d  6aff  PUSH -0x1
00ae6f1f  6a00  PUSH 0x0
00ae6f21  0fb70d2071ae00  MOVZX ECX,word ptr [0x00ae7120]
00ae6f28  b201  MOV DL,0x1
00ae6f2a  b83071ae00  MOV EAX,0xae7130
00ae6f2f  e84c36bcff  CALL 0x006aa580
00ae6f34  33c0  XOR EAX,EAX
00ae6f36  5a  POP EDX
00ae6f37  59  POP ECX
00ae6f38  59  POP ECX
00ae6f39  648910  MOV dword ptr FS:[EAX],EDX
00ae6f3c  e98f000000  JMP 0x00ae6fd0
00ae6f84  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00ae6f87  0fb7152071ae00  MOVZX EDX,word ptr [0x00ae7120]
00ae6f8e  52  PUSH EDX
00ae6f8f  6a00  PUSH 0x0
00ae6f91  6aff  PUSH -0x1
00ae6f93  6aff  PUSH -0x1
00ae6f95  6a00  PUSH 0x0
00ae6f97  b101  MOV CL,0x1
00ae6f99  894580  MOV dword ptr [EBP + -0x80],EAX
00ae6f9c  8b5580  MOV EDX,dword ptr [EBP + -0x80]
00ae6f9f  b8dc71ae00  MOV EAX,0xae71dc
00ae6fa4  e8df37bcff  CALL 0x006aa788
00ae6fa9  eb25  JMP 0x00ae6fd0
00ae6fab  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00ae6fae  0fb7152071ae00  MOVZX EDX,word ptr [0x00ae7120]
00ae6fb5  52  PUSH EDX
00ae6fb6  6a00  PUSH 0x0
00ae6fb8  6aff  PUSH -0x1
00ae6fba  6aff  PUSH -0x1
00ae6fbc  6a00  PUSH 0x0
00ae6fbe  b101  MOV CL,0x1
00ae6fc0  894580  MOV dword ptr [EBP + -0x80],EAX
00ae6fc3  8b5580  MOV EDX,dword ptr [EBP + -0x80]
00ae6fc6  b81872ae00  MOV EAX,0xae7218
00ae6fcb  e8b837bcff  CALL 0x006aa788
00ae6fd0  33c0  XOR EAX,EAX
00ae6fd2  5a  POP EDX
00ae6fd3  59  POP ECX
00ae6fd4  59  POP ECX
00ae6fd5  648910  MOV dword ptr FS:[EAX],EDX
00ae6fd8  68ec6fae00  PUSH 0xae6fec
00ae6fdd  e8aefcffff  CALL 0x00ae6c90
00ae6fe2  58  POP EAX
00ae6fe3  ffe0  JMP EAX
