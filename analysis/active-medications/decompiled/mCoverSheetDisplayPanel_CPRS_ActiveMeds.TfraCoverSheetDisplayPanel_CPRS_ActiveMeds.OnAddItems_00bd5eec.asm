; Static instruction listing. Function bodies and indirect exception flow require review.
00bd5eec  55  PUSH EBP
00bd5eed  8bec  MOV EBP,ESP
00bd5eef  83c4d4  ADD ESP,-0x2c
00bd5ef2  53  PUSH EBX
00bd5ef3  56  PUSH ESI
00bd5ef4  33c9  XOR ECX,ECX
00bd5ef6  894dd8  MOV dword ptr [EBP + -0x28],ECX
00bd5ef9  894dd4  MOV dword ptr [EBP + -0x2c],ECX
00bd5efc  894de0  MOV dword ptr [EBP + -0x20],ECX
00bd5eff  894ddc  MOV dword ptr [EBP + -0x24],ECX
00bd5f02  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd5f05  8955f4  MOV dword ptr [EBP + -0xc],EDX
00bd5f08  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bd5f0b  33c0  XOR EAX,EAX
00bd5f0d  55  PUSH EBP
00bd5f0e  683e61bd00  PUSH 0xbd613e
00bd5f13  64ff30  PUSH dword ptr FS:[EAX]
00bd5f16  648920  MOV dword ptr FS:[EAX],ESP
00bd5f19  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd5f1c  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd5f22  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd5f28  e84771aaff  CALL 0x0067d074
00bd5f2d  33d2  XOR EDX,EDX
00bd5f2f  55  PUSH EBP
00bd5f30  681261bd00  PUSH 0xbd6112
00bd5f35  64ff32  PUSH dword ptr FS:[EDX]
00bd5f38  648922  MOV dword ptr FS:[EDX],ESP
00bd5f3b  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd5f3e  8b904c030000  MOV EDX,dword ptr [EAX + 0x34c]
00bd5f44  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd5f47  8b08  MOV ECX,dword ptr [EAX]
00bd5f49  ff911c020000  CALL dword ptr [ECX + 0x21c]
00bd5f4f  b201  MOV DL,0x1
00bd5f51  a100734a00  MOV EAX,[0x004a7300]
00bd5f56  e8992290ff  CALL 0x004d81f4
00bd5f5b  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bd5f5e  33d2  XOR EDX,EDX
00bd5f60  55  PUSH EBP
00bd5f61  68e760bd00  PUSH 0xbd60e7
00bd5f66  64ff32  PUSH dword ptr FS:[EDX]
00bd5f69  648922  MOV dword ptr FS:[EDX],ESP
00bd5f6c  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00bd5f6f  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd5f72  e8d579f0ff  CALL 0x00add94c
00bd5f77  33c0  XOR EAX,EAX
00bd5f79  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd5f7c  8b4df0  MOV ECX,dword ptr [EBP + -0x10]
00bd5f7f  b201  MOV DL,0x1
00bd5f81  a190594a00  MOV EAX,[0x004a5990]
00bd5f86  e8d5f48fff  CALL 0x004d5460
00bd5f8b  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd5f8e  33c0  XOR EAX,EAX
00bd5f90  55  PUSH EBP
00bd5f91  68c360bd00  PUSH 0xbd60c3
00bd5f96  64ff30  PUSH dword ptr FS:[EAX]
00bd5f99  648920  MOV dword ptr FS:[EAX],ESP
00bd5f9c  e9dc000000  JMP 0x00bd607d
00bd5fa1  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bd5fa4  ff4004  INC dword ptr [EAX + 0x4]
00bd5fa7  8d55fc  LEA EDX,[EBP + -0x4]
00bd5faa  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd5fad  e8f2f48fff  CALL 0x004d54a4
00bd5fb2  6a5e  PUSH 0x5e
00bd5fb4  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bd5fb7  b201  MOV DL,0x1
00bd5fb9  a17cecbc00  MOV EAX,[0x00bcec7c]
00bd5fbe  e8ad97ffff  CALL 0x00bcf770
00bd5fc3  8bd8  MOV EBX,EAX
00bd5fc5  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd5fc8  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd5fce  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd5fd4  e8a76eaaff  CALL 0x0067ce80
00bd5fd9  85c0  TEST EAX,EAX
00bd5fdb  7534  JNZ 0x00bd6011
00bd5fdd  6a01  PUSH 0x1
00bd5fdf  b95861bd00  MOV ECX,0xbd6158
00bd5fe4  ba01000000  MOV EDX,0x1
00bd5fe9  8bc3  MOV EAX,EBX
00bd5feb  e848a3ffff  CALL 0x00bd0338
00bd5ff0  84c0  TEST AL,AL
00bd5ff2  7415  JZ 0x00bd6009
00bd5ff4  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd5ff7  8b10  MOV EDX,dword ptr [EAX]
00bd5ff9  ff5214  CALL dword ptr [EDX + 0x14]
00bd5ffc  48  DEC EAX
00bd5ffd  750a  JNZ 0x00bd6009
00bd5fff  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6002  e899d6ffff  CALL 0x00bd36a0
00bd6007  eb08  JMP 0x00bd6011
00bd6009  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd600c  e8cfdbffff  CALL 0x00bd3be0
00bd6011  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd6014  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd601a  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd6020  e8bb6daaff  CALL 0x0067cde0
00bd6025  8bf0  MOV ESI,EAX
00bd6027  8d4ddc  LEA ECX,[EBP + -0x24]
00bd602a  ba02000000  MOV EDX,0x2
00bd602f  8bc3  MOV EAX,EBX
00bd6031  e80699ffff  CALL 0x00bcf93c
00bd6036  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00bd6039  8d4de0  LEA ECX,[EBP + -0x20]
00bd603c  33d2  XOR EDX,EDX
00bd603e  e825caddff  CALL 0x009b2a68
00bd6043  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00bd6046  8bc6  MOV EAX,ESI
00bd6048  e88b64aaff  CALL 0x0067c4d8
00bd604d  8d4dd4  LEA ECX,[EBP + -0x2c]
00bd6050  ba04000000  MOV EDX,0x4
00bd6055  8bc3  MOV EAX,EBX
00bd6057  e8e098ffff  CALL 0x00bcf93c
00bd605c  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bd605f  8d4dd8  LEA ECX,[EBP + -0x28]
00bd6062  33d2  XOR EDX,EDX
00bd6064  e8ffc9ddff  CALL 0x009b2a68
00bd6069  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
00bd606c  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bd606f  8b08  MOV ECX,dword ptr [EAX]
00bd6071  ff513c  CALL dword ptr [ECX + 0x3c]
00bd6074  8bd3  MOV EDX,EBX
00bd6076  8bc6  MOV EAX,ESI
00bd6078  e86365aaff  CALL 0x0067c5e0
00bd607d  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd6080  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bd6083  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bd6086  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bd6089  8b10  MOV EDX,dword ptr [EAX]
00bd608b  ff5214  CALL dword ptr [EDX + 0x14]
00bd608e  48  DEC EAX
00bd608f  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00bd6092  3b4204  CMP EAX,dword ptr [EDX + 0x4]
00bd6095  0f9f45e7  SETG byte ptr [EBP + -0x19]
00bd6099  807de700  CMP byte ptr [EBP + -0x19],0x0
00bd609d  0f85fefeffff  JNZ 0x00bd5fa1
00bd60a3  33c0  XOR EAX,EAX
00bd60a5  5a  POP EDX
00bd60a6  59  POP ECX
00bd60a7  59  POP ECX
00bd60a8  648910  MOV dword ptr FS:[EAX],EDX
00bd60ab  68ca60bd00  PUSH 0xbd60ca
00bd60b0  837dec00  CMP dword ptr [EBP + -0x14],0x0
00bd60b4  740a  JZ 0x00bd60c0
00bd60b6  b201  MOV DL,0x1
00bd60b8  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd60bb  8b08  MOV ECX,dword ptr [EAX]
00bd60bd  ff51fc  CALL dword ptr [ECX + -0x4]
00bd60c0  58  POP EAX
00bd60c1  ffe0  JMP EAX
00bd60c3  e9d44383ff  JMP 0x0040a49c
00bd60ca  33c0  XOR EAX,EAX
00bd60cc  5a  POP EDX
00bd60cd  59  POP ECX
00bd60ce  59  POP ECX
00bd60cf  648910  MOV dword ptr FS:[EAX],EDX
00bd60d2  68ee60bd00  PUSH 0xbd60ee
00bd60d7  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd60da  33d2  XOR EDX,EDX
00bd60dc  8955f0  MOV dword ptr [EBP + -0x10],EDX
00bd60df  e8d82f83ff  CALL 0x004090bc
00bd60e4  58  POP EAX
00bd60e5  ffe0  JMP EAX
00bd60e7  e9b04383ff  JMP 0x0040a49c
00bd60ee  33c0  XOR EAX,EAX
00bd60f0  5a  POP EDX
00bd60f1  59  POP ECX
00bd60f2  59  POP ECX
00bd60f3  648910  MOV dword ptr FS:[EAX],EDX
00bd60f6  681961bd00  PUSH 0xbd6119
00bd60fb  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd60fe  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd6104  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd610a  e85571aaff  CALL 0x0067d264
00bd610f  58  POP EAX
00bd6110  ffe0  JMP EAX
00bd6112  e9854383ff  JMP 0x0040a49c
00bd6119  33c0  XOR EAX,EAX
00bd611b  5a  POP EDX
00bd611c  59  POP ECX
00bd611d  59  POP ECX
00bd611e  648910  MOV dword ptr FS:[EAX],EDX
00bd6121  684561bd00  PUSH 0xbd6145
00bd6126  8d45d4  LEA EAX,[EBP + -0x2c]
00bd6129  ba04000000  MOV EDX,0x4
00bd612e  e8014f83ff  CALL 0x0040b034
00bd6133  8d45fc  LEA EAX,[EBP + -0x4]
00bd6136  e8994e83ff  CALL 0x0040afd4
00bd613b  58  POP EAX
00bd613c  ffe0  JMP EAX
00bd613e  e9594383ff  JMP 0x0040a49c
00bd6145  5e  POP ESI
00bd6146  5b  POP EBX
00bd6147  8be5  MOV ESP,EBP
00bd6149  5d  POP EBP
00bd614a  c3  RET
