; Static instruction listing. Function bodies and indirect exception flow require review.
00bd7954  55  PUSH EBP
00bd7955  8bec  MOV EBP,ESP
00bd7957  83c4bc  ADD ESP,-0x44
00bd795a  53  PUSH EBX
00bd795b  56  PUSH ESI
00bd795c  33c9  XOR ECX,ECX
00bd795e  894dc0  MOV dword ptr [EBP + -0x40],ECX
00bd7961  894dbc  MOV dword ptr [EBP + -0x44],ECX
00bd7964  894dc8  MOV dword ptr [EBP + -0x38],ECX
00bd7967  894dc4  MOV dword ptr [EBP + -0x3c],ECX
00bd796a  894dcc  MOV dword ptr [EBP + -0x34],ECX
00bd796d  894dd0  MOV dword ptr [EBP + -0x30],ECX
00bd7970  894dd4  MOV dword ptr [EBP + -0x2c],ECX
00bd7973  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd7976  8955f4  MOV dword ptr [EBP + -0xc],EDX
00bd7979  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bd797c  33c0  XOR EAX,EAX
00bd797e  55  PUSH EBP
00bd797f  681d7cbd00  PUSH 0xbd7c1d
00bd7984  64ff30  PUSH dword ptr FS:[EAX]
00bd7987  648920  MOV dword ptr FS:[EAX],ESP
00bd798a  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd798d  8b10  MOV EDX,dword ptr [EAX]
00bd798f  ff5214  CALL dword ptr [EDX + 0x14]
00bd7992  85c0  TEST EAX,EAX
00bd7994  750d  JNZ 0x00bd79a3
00bd7996  ba387cbd00  MOV EDX,0xbd7c38
00bd799b  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd799e  e86dde8fff  CALL 0x004d5810
00bd79a3  33d2  XOR EDX,EDX
00bd79a5  55  PUSH EBP
00bd79a6  68f17bbd00  PUSH 0xbd7bf1
00bd79ab  64ff32  PUSH dword ptr FS:[EDX]
00bd79ae  648922  MOV dword ptr FS:[EDX],ESP
00bd79b1  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd79b4  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd79ba  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd79c0  e8af56aaff  CALL 0x0067d074
00bd79c5  6a5e  PUSH 0x5e
00bd79c7  8d4dd4  LEA ECX,[EBP + -0x2c]
00bd79ca  33d2  XOR EDX,EDX
00bd79cc  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd79cf  8b18  MOV EBX,dword ptr [EAX]
00bd79d1  ff530c  CALL dword ptr [EBX + 0xc]
00bd79d4  8b4dd4  MOV ECX,dword ptr [EBP + -0x2c]
00bd79d7  b201  MOV DL,0x1
00bd79d9  a17cecbc00  MOV EAX,[0x00bcec7c]
00bd79de  e88d7dffff  CALL 0x00bcf770
00bd79e3  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bd79e6  33c0  XOR EAX,EAX
00bd79e8  55  PUSH EBP
00bd79e9  685a7abd00  PUSH 0xbd7a5a
00bd79ee  64ff30  PUSH dword ptr FS:[EAX]
00bd79f1  648920  MOV dword ptr FS:[EAX],ESP
00bd79f4  ba01000000  MOV EDX,0x1
00bd79f9  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd79fc  e8d391ffff  CALL 0x00bd0bd4
00bd7a01  84c0  TEST AL,AL
00bd7a03  7435  JZ 0x00bd7a3a
00bd7a05  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7a08  e893bcffff  CALL 0x00bd36a0
00bd7a0d  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7a10  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd7a16  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd7a1c  e8bf53aaff  CALL 0x0067cde0
00bd7a21  ba647cbd00  MOV EDX,0xbd7c64
00bd7a26  e8ad4aaaff  CALL 0x0067c4d8
00bd7a2b  e8042d83ff  CALL 0x0040a734
00bd7a30  e8ff2c83ff  CALL 0x0040a734
00bd7a35  e9be010000  JMP 0x00bd7bf8
00bd7a3a  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7a3d  e89ec1ffff  CALL 0x00bd3be0
00bd7a42  33c0  XOR EAX,EAX
00bd7a44  5a  POP EDX
00bd7a45  59  POP ECX
00bd7a46  59  POP ECX
00bd7a47  648910  MOV dword ptr FS:[EAX],EDX
00bd7a4a  68617abd00  PUSH 0xbd7a61
00bd7a4f  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd7a52  e8651683ff  CALL 0x004090bc
00bd7a57  58  POP EAX
00bd7a58  ffe0  JMP EAX
00bd7a5a  e93d2a83ff  JMP 0x0040a49c
00bd7a61  33c0  XOR EAX,EAX
00bd7a63  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd7a66  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
00bd7a69  b201  MOV DL,0x1
00bd7a6b  a190594a00  MOV EAX,[0x004a5990]
00bd7a70  e8ebd98fff  CALL 0x004d5460
00bd7a75  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bd7a78  33c0  XOR EAX,EAX
00bd7a7a  55  PUSH EBP
00bd7a7b  68c67bbd00  PUSH 0xbd7bc6
00bd7a80  64ff30  PUSH dword ptr FS:[EAX]
00bd7a83  648920  MOV dword ptr FS:[EAX],ESP
00bd7a86  e9f5000000  JMP 0x00bd7b80
00bd7a8b  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bd7a8e  ff4004  INC dword ptr [EAX + 0x4]
00bd7a91  8d55fc  LEA EDX,[EBP + -0x4]
00bd7a94  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd7a97  e808da8fff  CALL 0x004d54a4
00bd7a9c  6a5e  PUSH 0x5e
00bd7a9e  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bd7aa1  b201  MOV DL,0x1
00bd7aa3  a17cecbc00  MOV EAX,[0x00bcec7c]
00bd7aa8  e8c37cffff  CALL 0x00bcf770
00bd7aad  8bd8  MOV EBX,EAX
00bd7aaf  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7ab2  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd7ab8  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd7abe  e81d53aaff  CALL 0x0067cde0
00bd7ac3  8bf0  MOV ESI,EAX
00bd7ac5  ba01000000  MOV EDX,0x1
00bd7aca  8bc3  MOV EAX,EBX
00bd7acc  e80391ffff  CALL 0x00bd0bd4
00bd7ad1  84c0  TEST AL,AL
00bd7ad3  741b  JZ 0x00bd7af0
00bd7ad5  8d4dd0  LEA ECX,[EBP + -0x30]
00bd7ad8  ba02000000  MOV EDX,0x2
00bd7add  8bc3  MOV EAX,EBX
00bd7adf  e8587effff  CALL 0x00bcf93c
00bd7ae4  8b55d0  MOV EDX,dword ptr [EBP + -0x30]
00bd7ae7  8bc6  MOV EAX,ESI
00bd7ae9  e8ea49aaff  CALL 0x0067c4d8
00bd7aee  eb39  JMP 0x00bd7b29
00bd7af0  6a00  PUSH 0x0
00bd7af2  6a00  PUSH 0x0
00bd7af4  33c9  XOR ECX,ECX
00bd7af6  ba02000000  MOV EDX,0x2
00bd7afb  8bc3  MOV EAX,EBX
00bd7afd  e8e683ffff  CALL 0x00bcfee8
00bd7b02  dd5dd8  FSTP double ptr [EBP + -0x28]
00bd7b05  9b  WAIT
00bd7b06  ff75dc  PUSH dword ptr [EBP + -0x24]
00bd7b09  ff75d8  PUSH dword ptr [EBP + -0x28]
00bd7b0c  8d4dcc  LEA ECX,[EBP + -0x34]
00bd7b0f  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00bd7b15  b8907cbd00  MOV EAX,0xbd7c90
00bd7b1a  e831aa85ff  CALL 0x00432550
00bd7b1f  8b55cc  MOV EDX,dword ptr [EBP + -0x34]
00bd7b22  8bc6  MOV EAX,ESI
00bd7b24  e8af49aaff  CALL 0x0067c4d8
00bd7b29  8d4dc4  LEA ECX,[EBP + -0x3c]
00bd7b2c  ba03000000  MOV EDX,0x3
00bd7b31  8bc3  MOV EAX,EBX
00bd7b33  e8047effff  CALL 0x00bcf93c
00bd7b38  8b45c4  MOV EAX,dword ptr [EBP + -0x3c]
00bd7b3b  8d4dc8  LEA ECX,[EBP + -0x38]
00bd7b3e  33d2  XOR EDX,EDX
00bd7b40  e823afddff  CALL 0x009b2a68
00bd7b45  8b55c8  MOV EDX,dword ptr [EBP + -0x38]
00bd7b48  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bd7b4b  8b08  MOV ECX,dword ptr [EAX]
00bd7b4d  ff513c  CALL dword ptr [ECX + 0x3c]
00bd7b50  8d4dbc  LEA ECX,[EBP + -0x44]
00bd7b53  ba04000000  MOV EDX,0x4
00bd7b58  8bc3  MOV EAX,EBX
00bd7b5a  e8dd7dffff  CALL 0x00bcf93c
00bd7b5f  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
00bd7b62  8d4dc0  LEA ECX,[EBP + -0x40]
00bd7b65  33d2  XOR EDX,EDX
00bd7b67  e8fcaeddff  CALL 0x009b2a68
00bd7b6c  8b55c0  MOV EDX,dword ptr [EBP + -0x40]
00bd7b6f  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bd7b72  8b08  MOV ECX,dword ptr [EAX]
00bd7b74  ff513c  CALL dword ptr [ECX + 0x3c]
00bd7b77  8bd3  MOV EDX,EBX
00bd7b79  8bc6  MOV EAX,ESI
00bd7b7b  e8604aaaff  CALL 0x0067c5e0
00bd7b80  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd7b83  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bd7b86  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bd7b89  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bd7b8c  8b10  MOV EDX,dword ptr [EAX]
00bd7b8e  ff5214  CALL dword ptr [EDX + 0x14]
00bd7b91  48  DEC EAX
00bd7b92  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00bd7b95  3b4204  CMP EAX,dword ptr [EDX + 0x4]
00bd7b98  0f9f45e7  SETG byte ptr [EBP + -0x19]
00bd7b9c  807de700  CMP byte ptr [EBP + -0x19],0x0
00bd7ba0  0f85e5feffff  JNZ 0x00bd7a8b
00bd7ba6  33c0  XOR EAX,EAX
00bd7ba8  5a  POP EDX
00bd7ba9  59  POP ECX
00bd7baa  59  POP ECX
00bd7bab  648910  MOV dword ptr FS:[EAX],EDX
00bd7bae  68cd7bbd00  PUSH 0xbd7bcd
00bd7bb3  837dec00  CMP dword ptr [EBP + -0x14],0x0
00bd7bb7  740a  JZ 0x00bd7bc3
00bd7bb9  b201  MOV DL,0x1
00bd7bbb  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bd7bbe  8b08  MOV ECX,dword ptr [EAX]
00bd7bc0  ff51fc  CALL dword ptr [ECX + -0x4]
00bd7bc3  58  POP EAX
00bd7bc4  ffe0  JMP EAX
00bd7bc6  e9d12883ff  JMP 0x0040a49c
00bd7bcd  33c0  XOR EAX,EAX
00bd7bcf  5a  POP EDX
00bd7bd0  59  POP ECX
00bd7bd1  59  POP ECX
00bd7bd2  648910  MOV dword ptr FS:[EAX],EDX
00bd7bd5  68f87bbd00  PUSH 0xbd7bf8
00bd7bda  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd7bdd  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd7be3  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd7be9  e87656aaff  CALL 0x0067d264
00bd7bee  58  POP EAX
00bd7bef  ffe0  JMP EAX
00bd7bf1  e9a62883ff  JMP 0x0040a49c
00bd7bf8  33c0  XOR EAX,EAX
00bd7bfa  5a  POP EDX
00bd7bfb  59  POP ECX
00bd7bfc  59  POP ECX
00bd7bfd  648910  MOV dword ptr FS:[EAX],EDX
00bd7c00  68247cbd00  PUSH 0xbd7c24
00bd7c05  8d45bc  LEA EAX,[EBP + -0x44]
00bd7c08  ba07000000  MOV EDX,0x7
00bd7c0d  e8223483ff  CALL 0x0040b034
00bd7c12  8d45fc  LEA EAX,[EBP + -0x4]
00bd7c15  e8ba3383ff  CALL 0x0040afd4
00bd7c1a  58  POP EAX
00bd7c1b  ffe0  JMP EAX
00bd7c1d  e97a2883ff  JMP 0x0040a49c
00bd7c24  5e  POP ESI
00bd7c25  5b  POP EBX
00bd7c26  8be5  MOV ESP,EBP
00bd7c28  5d  POP EBP
00bd7c29  c3  RET
