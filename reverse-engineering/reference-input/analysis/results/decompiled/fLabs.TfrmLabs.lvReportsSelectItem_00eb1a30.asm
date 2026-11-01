; Static instruction listing. Function bodies and indirect exception flow require review.
00eb1a30  55  PUSH EBP
00eb1a31  8bec  MOV EBP,ESP
00eb1a33  51  PUSH ECX
00eb1a34  b915000000  MOV ECX,0x15
00eb1a39  6a00  PUSH 0x0
00eb1a3b  6a00  PUSH 0x0
00eb1a3d  49  DEC ECX
00eb1a3e  75f9  JNZ 0x00eb1a39
00eb1a40  51  PUSH ECX
00eb1a41  874dfc  XCHG dword ptr [EBP + -0x4],ECX
00eb1a44  53  PUSH EBX
00eb1a45  56  PUSH ESI
00eb1a46  57  PUSH EDI
00eb1a47  894de8  MOV dword ptr [EBP + -0x18],ECX
00eb1a4a  8bd8  MOV EBX,EAX
00eb1a4c  33c0  XOR EAX,EAX
00eb1a4e  55  PUSH EBP
00eb1a4f  689723eb00  PUSH 0xeb2397
00eb1a54  64ff30  PUSH dword ptr FS:[EAX]
00eb1a57  648920  MOV dword ptr FS:[EAX],ESP
00eb1a5a  807d0800  CMP byte ptr [EBP + 0x8],0x0
00eb1a5e  0f8406090000  JZ 0x00eb236a
00eb1a64  b201  MOV DL,0x1
00eb1a66  a100734a00  MOV EAX,[0x004a7300]
00eb1a6b  e8846762ff  CALL 0x004d81f4
00eb1a70  8bf0  MOV ESI,EAX
00eb1a72  a1a8a22501  MOV EAX,[0x0125a2a8]
00eb1a77  8b10  MOV EDX,dword ptr [EAX]
00eb1a79  ff5248  CALL dword ptr [EDX + 0x48]
00eb1a7c  c645db00  MOV byte ptr [EBP + -0x25],0x0
00eb1a80  8d45ec  LEA EAX,[EBP + -0x14]
00eb1a83  50  PUSH EAX
00eb1a84  b901000000  MOV ECX,0x1
00eb1a89  66ba3a00  MOV DX,0x3a
00eb1a8d  a134a32501  MOV EAX,[0x0125a334]
00eb1a92  e855928eff  CALL 0x0079acec
00eb1a97  8b83bc050000  MOV EAX,dword ptr [EBX + 0x5bc]
00eb1a9d  8945d4  MOV dword ptr [EBP + -0x2c],EAX
00eb1aa0  8d4dfc  LEA ECX,[EBP + -0x4]
00eb1aa3  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1aa6  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1aa9  33d2  XOR EDX,EDX
00eb1aab  8b38  MOV EDI,dword ptr [EAX]
00eb1aad  ff570c  CALL dword ptr [EDI + 0xc]
00eb1ab0  a1d8a22501  MOV EAX,[0x0125a2d8]
00eb1ab5  83e806  SUB EAX,0x6
00eb1ab8  7405  JZ 0x00eb1abf
00eb1aba  e979080000  JMP 0x00eb2338
00eb1abf  8b83bc050000  MOV EAX,dword ptr [EBX + 0x5bc]
00eb1ac5  8b10  MOV EDX,dword ptr [EAX]
00eb1ac7  ff9294010000  CALL dword ptr [EDX + 0x194]
00eb1acd  83f802  CMP EAX,0x2
00eb1ad0  7d18  JGE 0x00eb1aea
00eb1ad2  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1ad8  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1ade  8b10  MOV EDX,dword ptr [EAX]
00eb1ae0  ff5248  CALL dword ptr [EDX + 0x48]
00eb1ae3  c605eca2250100  MOV byte ptr [0x0125a2ec],0x0
00eb1aea  8bc6  MOV EAX,ESI
00eb1aec  8b10  MOV EDX,dword ptr [EAX]
00eb1aee  ff5248  CALL dword ptr [EDX + 0x48]
00eb1af1  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00eb1af4  8b10  MOV EDX,dword ptr [EAX]
00eb1af6  ff9294010000  CALL dword ptr [EDX + 0x194]
00eb1afc  83f802  CMP EAX,0x2
00eb1aff  0f859b020000  JNZ 0x00eb1da0
00eb1b05  803deca2250100  CMP byte ptr [0x0125a2ec],0x0
00eb1b0c  0f858e020000  JNZ 0x00eb1da0
00eb1b12  c605eca2250101  MOV byte ptr [0x0125a2ec],0x1
00eb1b19  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00eb1b1c  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00eb1b22  e859b37cff  CALL 0x0067ce80
00eb1b27  48  DEC EAX
00eb1b28  85c0  TEST EAX,EAX
00eb1b2a  0f8c70020000  JL 0x00eb1da0
00eb1b30  40  INC EAX
00eb1b31  8945d0  MOV dword ptr [EBP + -0x30],EAX
00eb1b34  c745e400000000  MOV dword ptr [EBP + -0x1c],0x0
00eb1b3b  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00eb1b3e  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00eb1b44  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1b47  e884b37cff  CALL 0x0067ced0
00eb1b4c  ba03000000  MOV EDX,0x3
00eb1b51  e812ab7cff  CALL 0x0067c668
00eb1b56  84c0  TEST AL,AL
00eb1b58  0f8436020000  JZ 0x00eb1d94
00eb1b5e  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00eb1b61  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00eb1b67  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1b6a  e861b37cff  CALL 0x0067ced0
00eb1b6f  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1b72  8d4dc4  LEA ECX,[EBP + -0x3c]
00eb1b75  33d2  XOR EDX,EDX
00eb1b77  8b38  MOV EDI,dword ptr [EAX]
00eb1b79  ff570c  CALL dword ptr [EDI + 0xc]
00eb1b7c  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
00eb1b7f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00eb1b82  e89da755ff  CALL 0x0040c324
00eb1b87  0f8407020000  JZ 0x00eb1d94
00eb1b8d  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00eb1b90  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00eb1b96  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1b99  e832b37cff  CALL 0x0067ced0
00eb1b9e  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1ba1  8d4df8  LEA ECX,[EBP + -0x8]
00eb1ba4  33d2  XOR EDX,EDX
00eb1ba6  8b38  MOV EDI,dword ptr [EAX]
00eb1ba8  ff570c  CALL dword ptr [EDI + 0xc]
00eb1bab  a190ea2401  MOV EAX,[0x0124ea90]
00eb1bb0  8b00  MOV EAX,dword ptr [EAX]
00eb1bb2  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1bb5  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1bb8  48  DEC EAX
00eb1bb9  85c0  TEST EAX,EAX
00eb1bbb  0f8c88010000  JL 0x00eb1d49
00eb1bc1  40  INC EAX
00eb1bc2  8945cc  MOV dword ptr [EBP + -0x34],EAX
00eb1bc5  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00eb1bcc  8d45c0  LEA EAX,[EBP + -0x40]
00eb1bcf  50  PUSH EAX
00eb1bd0  b901000000  MOV ECX,0x1
00eb1bd5  66ba3a00  MOV DX,0x3a
00eb1bd9  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00eb1bdc  e80b918eff  CALL 0x0079acec
00eb1be1  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
00eb1be4  50  PUSH EAX
00eb1be5  8d45bc  LEA EAX,[EBP + -0x44]
00eb1be8  50  PUSH EAX
00eb1be9  a190ea2401  MOV EAX,[0x0124ea90]
00eb1bee  8b00  MOV EAX,dword ptr [EAX]
00eb1bf0  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1bf3  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1bf6  e8f51362ff  CALL 0x004d2ff0
00eb1bfb  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00eb1bfe  b901000000  MOV ECX,0x1
00eb1c03  66ba3a00  MOV DX,0x3a
00eb1c07  e8e0908eff  CALL 0x0079acec
00eb1c0c  8b55bc  MOV EDX,dword ptr [EBP + -0x44]
00eb1c0f  58  POP EAX
00eb1c10  e80fa755ff  CALL 0x0040c324
00eb1c15  0f8522010000  JNZ 0x00eb1d3d
00eb1c1b  8d55b8  LEA EDX,[EBP + -0x48]
00eb1c1e  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1c21  8b08  MOV ECX,dword ptr [EAX]
00eb1c23  ff5118  CALL dword ptr [ECX + 0x18]
00eb1c26  8b45b8  MOV EAX,dword ptr [EBP + -0x48]
00eb1c29  50  PUSH EAX
00eb1c2a  8d45b4  LEA EAX,[EBP + -0x4c]
00eb1c2d  50  PUSH EAX
00eb1c2e  a190ea2401  MOV EAX,[0x0124ea90]
00eb1c33  8b00  MOV EAX,dword ptr [EAX]
00eb1c35  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1c38  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1c3b  e8b01362ff  CALL 0x004d2ff0
00eb1c40  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1c43  b901000000  MOV ECX,0x1
00eb1c48  66ba3b00  MOV DX,0x3b
00eb1c4c  e89b908eff  CALL 0x0079acec
00eb1c51  8b55b4  MOV EDX,dword ptr [EBP + -0x4c]
00eb1c54  58  POP EAX
00eb1c55  e8caa655ff  CALL 0x0040c324
00eb1c5a  0f85dd000000  JNZ 0x00eb1d3d
00eb1c60  a190ea2401  MOV EAX,[0x0124ea90]
00eb1c65  8b00  MOV EAX,dword ptr [EAX]
00eb1c67  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1c6a  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1c6d  e87e1362ff  CALL 0x004d2ff0
00eb1c72  8b4020  MOV EAX,dword ptr [EAX + 0x20]
00eb1c75  8b10  MOV EDX,dword ptr [EAX]
00eb1c77  ff5214  CALL dword ptr [EDX + 0x14]
00eb1c7a  85c0  TEST EAX,EAX
00eb1c7c  0f8ebb000000  JLE 0x00eb1d3d
00eb1c82  a190ea2401  MOV EAX,[0x0124ea90]
00eb1c87  8b00  MOV EAX,dword ptr [EAX]
00eb1c89  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1c8c  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1c8f  e85c1362ff  CALL 0x004d2ff0
00eb1c94  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00eb1c97  bab423eb00  MOV EDX,0xeb23b4
00eb1c9c  e883a655ff  CALL 0x0040c324
00eb1ca1  0f8596000000  JNZ 0x00eb1d3d
00eb1ca7  c645db01  MOV byte ptr [EBP + -0x25],0x1
00eb1cab  a190ea2401  MOV EAX,[0x0124ea90]
00eb1cb0  8b00  MOV EAX,dword ptr [EAX]
00eb1cb2  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1cb5  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1cb8  e8331362ff  CALL 0x004d2ff0
00eb1cbd  8b5004  MOV EDX,dword ptr [EAX + 0x4]
00eb1cc0  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1cc6  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1ccc  8b08  MOV ECX,dword ptr [EAX]
00eb1cce  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1cd1  a190ea2401  MOV EAX,[0x0124ea90]
00eb1cd6  8b00  MOV EAX,dword ptr [EAX]
00eb1cd8  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1cdb  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1cde  e80d1362ff  CALL 0x004d2ff0
00eb1ce3  8b4020  MOV EAX,dword ptr [EAX + 0x20]
00eb1ce6  8bd6  MOV EDX,ESI
00eb1ce8  e8c721b0ff  CALL 0x009b3eb4
00eb1ced  8bc6  MOV EAX,ESI
00eb1cef  8b10  MOV EDX,dword ptr [EAX]
00eb1cf1  ff5214  CALL dword ptr [EDX + 0x14]
00eb1cf4  48  DEC EAX
00eb1cf5  85c0  TEST EAX,EAX
00eb1cf7  7c44  JL 0x00eb1d3d
00eb1cf9  40  INC EAX
00eb1cfa  8945c8  MOV dword ptr [EBP + -0x38],EAX
00eb1cfd  c745dc00000000  MOV dword ptr [EBP + -0x24],0x0
00eb1d04  8d4dac  LEA ECX,[EBP + -0x54]
00eb1d07  8b55dc  MOV EDX,dword ptr [EBP + -0x24]
00eb1d0a  8bc6  MOV EAX,ESI
00eb1d0c  8b38  MOV EDI,dword ptr [EAX]
00eb1d0e  ff570c  CALL dword ptr [EDI + 0xc]
00eb1d11  8b4dac  MOV ECX,dword ptr [EBP + -0x54]
00eb1d14  8d45b0  LEA EAX,[EBP + -0x50]
00eb1d17  bac423eb00  MOV EDX,0xeb23c4
00eb1d1c  e86ba455ff  CALL 0x0040c18c
00eb1d21  8b55b0  MOV EDX,dword ptr [EBP + -0x50]
00eb1d24  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1d2a  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1d30  8b08  MOV ECX,dword ptr [EAX]
00eb1d32  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1d35  ff45dc  INC dword ptr [EBP + -0x24]
00eb1d38  ff4dc8  DEC dword ptr [EBP + -0x38]
00eb1d3b  75c7  JNZ 0x00eb1d04
00eb1d3d  ff45e0  INC dword ptr [EBP + -0x20]
00eb1d40  ff4dcc  DEC dword ptr [EBP + -0x34]
00eb1d43  0f8583feffff  JNZ 0x00eb1bcc
00eb1d49  807ddb01  CMP byte ptr [EBP + -0x25],0x1
00eb1d4d  7545  JNZ 0x00eb1d94
00eb1d4f  8d55a4  LEA EDX,[EBP + -0x5c]
00eb1d52  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1d55  8b08  MOV ECX,dword ptr [EAX]
00eb1d57  ff5118  CALL dword ptr [ECX + 0x18]
00eb1d5a  8b4da4  MOV ECX,dword ptr [EBP + -0x5c]
00eb1d5d  8d45a8  LEA EAX,[EBP + -0x58]
00eb1d60  bad423eb00  MOV EDX,0xeb23d4
00eb1d65  e822a455ff  CALL 0x0040c18c
00eb1d6a  8b55a8  MOV EDX,dword ptr [EBP + -0x58]
00eb1d6d  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1d73  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1d79  8b08  MOV ECX,dword ptr [EAX]
00eb1d7b  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1d7e  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1d84  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1d8a  baf823eb00  MOV EDX,0xeb23f8
00eb1d8f  8b08  MOV ECX,dword ptr [EAX]
00eb1d91  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1d94  ff45e4  INC dword ptr [EBP + -0x1c]
00eb1d97  ff4dd0  DEC dword ptr [EBP + -0x30]
00eb1d9a  0f859bfdffff  JNZ 0x00eb1b3b
00eb1da0  8bc6  MOV EAX,ESI
00eb1da2  8b10  MOV EDX,dword ptr [EAX]
00eb1da4  ff5248  CALL dword ptr [EDX + 0x48]
00eb1da7  c645db00  MOV byte ptr [EBP + -0x25],0x0
00eb1dab  a190ea2401  MOV EAX,[0x0124ea90]
00eb1db0  8b00  MOV EAX,dword ptr [EAX]
00eb1db2  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1db5  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1db8  48  DEC EAX
00eb1db9  85c0  TEST EAX,EAX
00eb1dbb  0f8c88010000  JL 0x00eb1f49
00eb1dc1  40  INC EAX
00eb1dc2  8945d0  MOV dword ptr [EBP + -0x30],EAX
00eb1dc5  c745e400000000  MOV dword ptr [EBP + -0x1c],0x0
00eb1dcc  8d45a0  LEA EAX,[EBP + -0x60]
00eb1dcf  50  PUSH EAX
00eb1dd0  b901000000  MOV ECX,0x1
00eb1dd5  66ba3a00  MOV DX,0x3a
00eb1dd9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00eb1ddc  e80b8f8eff  CALL 0x0079acec
00eb1de1  8b45a0  MOV EAX,dword ptr [EBP + -0x60]
00eb1de4  50  PUSH EAX
00eb1de5  8d459c  LEA EAX,[EBP + -0x64]
00eb1de8  50  PUSH EAX
00eb1de9  a190ea2401  MOV EAX,[0x0124ea90]
00eb1dee  8b00  MOV EAX,dword ptr [EAX]
00eb1df0  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1df3  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1df6  e8f51162ff  CALL 0x004d2ff0
00eb1dfb  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00eb1dfe  b901000000  MOV ECX,0x1
00eb1e03  66ba3a00  MOV DX,0x3a
00eb1e07  e8e08e8eff  CALL 0x0079acec
00eb1e0c  8b559c  MOV EDX,dword ptr [EBP + -0x64]
00eb1e0f  58  POP EAX
00eb1e10  e80fa555ff  CALL 0x0040c324
00eb1e15  0f8522010000  JNZ 0x00eb1f3d
00eb1e1b  8d5598  LEA EDX,[EBP + -0x68]
00eb1e1e  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1e21  8b08  MOV ECX,dword ptr [EAX]
00eb1e23  ff5118  CALL dword ptr [ECX + 0x18]
00eb1e26  8b4598  MOV EAX,dword ptr [EBP + -0x68]
00eb1e29  50  PUSH EAX
00eb1e2a  8d4594  LEA EAX,[EBP + -0x6c]
00eb1e2d  50  PUSH EAX
00eb1e2e  a190ea2401  MOV EAX,[0x0124ea90]
00eb1e33  8b00  MOV EAX,dword ptr [EAX]
00eb1e35  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1e38  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1e3b  e8b01162ff  CALL 0x004d2ff0
00eb1e40  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1e43  b901000000  MOV ECX,0x1
00eb1e48  66ba3b00  MOV DX,0x3b
00eb1e4c  e89b8e8eff  CALL 0x0079acec
00eb1e51  8b5594  MOV EDX,dword ptr [EBP + -0x6c]
00eb1e54  58  POP EAX
00eb1e55  e8caa455ff  CALL 0x0040c324
00eb1e5a  0f85dd000000  JNZ 0x00eb1f3d
00eb1e60  a190ea2401  MOV EAX,[0x0124ea90]
00eb1e65  8b00  MOV EAX,dword ptr [EAX]
00eb1e67  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1e6a  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1e6d  e87e1162ff  CALL 0x004d2ff0
00eb1e72  8b4020  MOV EAX,dword ptr [EAX + 0x20]
00eb1e75  8b10  MOV EDX,dword ptr [EAX]
00eb1e77  ff5214  CALL dword ptr [EDX + 0x14]
00eb1e7a  85c0  TEST EAX,EAX
00eb1e7c  0f8ebb000000  JLE 0x00eb1f3d
00eb1e82  a190ea2401  MOV EAX,[0x0124ea90]
00eb1e87  8b00  MOV EAX,dword ptr [EAX]
00eb1e89  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1e8c  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1e8f  e85c1162ff  CALL 0x004d2ff0
00eb1e94  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00eb1e97  bab423eb00  MOV EDX,0xeb23b4
00eb1e9c  e883a455ff  CALL 0x0040c324
00eb1ea1  0f8596000000  JNZ 0x00eb1f3d
00eb1ea7  c645db01  MOV byte ptr [EBP + -0x25],0x1
00eb1eab  a190ea2401  MOV EAX,[0x0124ea90]
00eb1eb0  8b00  MOV EAX,dword ptr [EAX]
00eb1eb2  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1eb5  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1eb8  e8331162ff  CALL 0x004d2ff0
00eb1ebd  8b5004  MOV EDX,dword ptr [EAX + 0x4]
00eb1ec0  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1ec6  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1ecc  8b08  MOV ECX,dword ptr [EAX]
00eb1ece  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1ed1  a190ea2401  MOV EAX,[0x0124ea90]
00eb1ed6  8b00  MOV EAX,dword ptr [EAX]
00eb1ed8  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1edb  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00eb1ede  e80d1162ff  CALL 0x004d2ff0
00eb1ee3  8b4020  MOV EAX,dword ptr [EAX + 0x20]
00eb1ee6  8bd6  MOV EDX,ESI
00eb1ee8  e8c71fb0ff  CALL 0x009b3eb4
00eb1eed  8bc6  MOV EAX,ESI
00eb1eef  8b10  MOV EDX,dword ptr [EAX]
00eb1ef1  ff5214  CALL dword ptr [EDX + 0x14]
00eb1ef4  48  DEC EAX
00eb1ef5  85c0  TEST EAX,EAX
00eb1ef7  7c44  JL 0x00eb1f3d
00eb1ef9  40  INC EAX
00eb1efa  8945cc  MOV dword ptr [EBP + -0x34],EAX
00eb1efd  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00eb1f04  8d4d8c  LEA ECX,[EBP + -0x74]
00eb1f07  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00eb1f0a  8bc6  MOV EAX,ESI
00eb1f0c  8b38  MOV EDI,dword ptr [EAX]
00eb1f0e  ff570c  CALL dword ptr [EDI + 0xc]
00eb1f11  8b4d8c  MOV ECX,dword ptr [EBP + -0x74]
00eb1f14  8d4590  LEA EAX,[EBP + -0x70]
00eb1f17  bac423eb00  MOV EDX,0xeb23c4
00eb1f1c  e86ba255ff  CALL 0x0040c18c
00eb1f21  8b5590  MOV EDX,dword ptr [EBP + -0x70]
00eb1f24  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1f2a  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1f30  8b08  MOV ECX,dword ptr [EAX]
00eb1f32  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1f35  ff45e0  INC dword ptr [EBP + -0x20]
00eb1f38  ff4dcc  DEC dword ptr [EBP + -0x34]
00eb1f3b  75c7  JNZ 0x00eb1f04
00eb1f3d  ff45e4  INC dword ptr [EBP + -0x1c]
00eb1f40  ff4dd0  DEC dword ptr [EBP + -0x30]
00eb1f43  0f8583feffff  JNZ 0x00eb1dcc
00eb1f49  807ddb01  CMP byte ptr [EBP + -0x25],0x1
00eb1f4d  7545  JNZ 0x00eb1f94
00eb1f4f  8d5584  LEA EDX,[EBP + -0x7c]
00eb1f52  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1f55  8b08  MOV ECX,dword ptr [EAX]
00eb1f57  ff5118  CALL dword ptr [ECX + 0x18]
00eb1f5a  8b4d84  MOV ECX,dword ptr [EBP + -0x7c]
00eb1f5d  8d4588  LEA EAX,[EBP + -0x78]
00eb1f60  bad423eb00  MOV EDX,0xeb23d4
00eb1f65  e822a255ff  CALL 0x0040c18c
00eb1f6a  8b5588  MOV EDX,dword ptr [EBP + -0x78]
00eb1f6d  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1f73  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1f79  8b08  MOV ECX,dword ptr [EAX]
00eb1f7b  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1f7e  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb1f84  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb1f8a  baf823eb00  MOV EDX,0xeb23f8
00eb1f8f  8b08  MOV ECX,dword ptr [EAX]
00eb1f91  ff513c  CALL dword ptr [ECX + 0x3c]
00eb1f94  a134a32501  MOV EAX,[0x0125a334]
00eb1f99  baa424eb00  MOV EDX,0xeb24a4
00eb1f9e  e881a355ff  CALL 0x0040c324
00eb1fa3  0f85b7010000  JNZ 0x00eb2160
00eb1fa9  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1fac  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1faf  8b10  MOV EDX,dword ptr [EAX]
00eb1fb1  ff5214  CALL dword ptr [EDX + 0x14]
00eb1fb4  83f808  CMP EAX,0x8
00eb1fb7  0f8eb5000000  JLE 0x00eb2072
00eb1fbd  68d024eb00  PUSH 0xeb24d0
00eb1fc2  8d4d80  LEA ECX,[EBP + -0x80]
00eb1fc5  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1fc8  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1fcb  ba08000000  MOV EDX,0x8
00eb1fd0  8b38  MOV EDI,dword ptr [EAX]
00eb1fd2  ff570c  CALL dword ptr [EDI + 0xc]
00eb1fd5  ff7580  PUSH dword ptr [EBP + -0x80]
00eb1fd8  68e424eb00  PUSH 0xeb24e4
00eb1fdd  8d8d7cffffff  LEA ECX,[EBP + 0xffffff7c]
00eb1fe3  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb1fe6  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb1fe9  ba04000000  MOV EDX,0x4
00eb1fee  8b38  MOV EDI,dword ptr [EAX]
00eb1ff0  ff570c  CALL dword ptr [EDI + 0xc]
00eb1ff3  ffb57cffffff  PUSH dword ptr [EBP + 0xffffff7c]
00eb1ff9  68e424eb00  PUSH 0xeb24e4
00eb1ffe  8d9578ffffff  LEA EDX,[EBP + 0xffffff78]
00eb2004  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2007  8b08  MOV ECX,dword ptr [EAX]
00eb2009  ff5118  CALL dword ptr [ECX + 0x18]
00eb200c  ffb578ffffff  PUSH dword ptr [EBP + 0xffffff78]
00eb2012  8d45f4  LEA EAX,[EBP + -0xc]
00eb2015  ba06000000  MOV EDX,0x6
00eb201a  e8f5a155ff  CALL 0x0040c214
00eb201f  ba01000000  MOV EDX,0x1
00eb2024  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2027  e808ac7cff  CALL 0x0067cc34
00eb202c  48  DEC EAX
00eb202d  0f94c0  SETZ AL
00eb2030  83e07f  AND EAX,0x7f
00eb2033  8b15e0fb2401  MOV EDX,dword ptr [0x0124fbe0]
00eb2039  0fb71442  MOVZX EDX,word ptr [EDX + EAX*0x2]
00eb203d  8d8574ffffff  LEA EAX,[EBP + 0xffffff74]
00eb2043  e8fc9e55ff  CALL 0x0040bf44
00eb2048  8b8574ffffff  MOV EAX,dword ptr [EBP + 0xffffff74]
00eb204e  50  PUSH EAX
00eb204f  8d45f4  LEA EAX,[EBP + -0xc]
00eb2052  b90a000000  MOV ECX,0xa
00eb2057  66ba5e00  MOV DX,0x5e
00eb205b  e8d88e8eff  CALL 0x0079af38
00eb2060  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00eb2063  b8f424eb00  MOV EAX,0xeb24f4
00eb2068  e8071f3200  CALL 0x011d3f74
00eb206d  e9ee000000  JMP 0x00eb2160
00eb2072  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2075  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb2078  8b10  MOV EDX,dword ptr [EAX]
00eb207a  ff5214  CALL dword ptr [EDX + 0x14]
00eb207d  83f804  CMP EAX,0x4
00eb2080  0f8e97000000  JLE 0x00eb211d
00eb2086  680825eb00  PUSH 0xeb2508
00eb208b  8d8d70ffffff  LEA ECX,[EBP + 0xffffff70]
00eb2091  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2094  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb2097  ba04000000  MOV EDX,0x4
00eb209c  8b38  MOV EDI,dword ptr [EAX]
00eb209e  ff570c  CALL dword ptr [EDI + 0xc]
00eb20a1  ffb570ffffff  PUSH dword ptr [EBP + 0xffffff70]
00eb20a7  68e424eb00  PUSH 0xeb24e4
00eb20ac  8d956cffffff  LEA EDX,[EBP + 0xffffff6c]
00eb20b2  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb20b5  8b08  MOV ECX,dword ptr [EAX]
00eb20b7  ff5118  CALL dword ptr [ECX + 0x18]
00eb20ba  ffb56cffffff  PUSH dword ptr [EBP + 0xffffff6c]
00eb20c0  8d45f4  LEA EAX,[EBP + -0xc]
00eb20c3  ba04000000  MOV EDX,0x4
00eb20c8  e847a155ff  CALL 0x0040c214
00eb20cd  ba01000000  MOV EDX,0x1
00eb20d2  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb20d5  e85aab7cff  CALL 0x0067cc34
00eb20da  48  DEC EAX
00eb20db  0f94c0  SETZ AL
00eb20de  83e07f  AND EAX,0x7f
00eb20e1  8b15e0fb2401  MOV EDX,dword ptr [0x0124fbe0]
00eb20e7  0fb71442  MOVZX EDX,word ptr [EDX + EAX*0x2]
00eb20eb  8d8568ffffff  LEA EAX,[EBP + 0xffffff68]
00eb20f1  e84e9e55ff  CALL 0x0040bf44
00eb20f6  8b8568ffffff  MOV EAX,dword ptr [EBP + 0xffffff68]
00eb20fc  50  PUSH EAX
00eb20fd  8d45f4  LEA EAX,[EBP + -0xc]
00eb2100  b90a000000  MOV ECX,0xa
00eb2105  66ba5e00  MOV DX,0x5e
00eb2109  e82a8e8eff  CALL 0x0079af38
00eb210e  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00eb2111  b8f424eb00  MOV EAX,0xeb24f4
00eb2116  e8591e3200  CALL 0x011d3f74
00eb211b  eb43  JMP 0x00eb2160
00eb211d  ba01000000  MOV EDX,0x1
00eb2122  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2125  e80aab7cff  CALL 0x0067cc34
00eb212a  48  DEC EAX
00eb212b  7533  JNZ 0x00eb2160
00eb212d  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb2133  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb2139  b92025eb00  MOV ECX,0xeb2520
00eb213e  33d2  XOR EDX,EDX
00eb2140  8b38  MOV EDI,dword ptr [EAX]
00eb2142  ff5764  CALL dword ptr [EDI + 0x64]
00eb2145  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb214b  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb2151  b9c423eb00  MOV ECX,0xeb23c4
00eb2156  ba01000000  MOV EDX,0x1
00eb215b  8b38  MOV EDI,dword ptr [EAX]
00eb215d  ff5764  CALL dword ptr [EDI + 0x64]
00eb2160  a134a32501  MOV EAX,[0x0125a334]
00eb2165  ba7c25eb00  MOV EDX,0xeb257c
00eb216a  e8b5a155ff  CALL 0x0040c324
00eb216f  0f85e1000000  JNZ 0x00eb2256
00eb2175  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2178  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb217b  8b10  MOV EDX,dword ptr [EAX]
00eb217d  ff5214  CALL dword ptr [EDX + 0x14]
00eb2180  83f807  CMP EAX,0x7
00eb2183  0f8ecd000000  JLE 0x00eb2256
00eb2189  8d8d64ffffff  LEA ECX,[EBP + 0xffffff64]
00eb218f  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2192  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb2195  ba07000000  MOV EDX,0x7
00eb219a  8b38  MOV EDI,dword ptr [EAX]
00eb219c  ff570c  CALL dword ptr [EDI + 0xc]
00eb219f  8b8564ffffff  MOV EAX,dword ptr [EBP + 0xffffff64]
00eb21a5  33d2  XOR EDX,EDX
00eb21a7  e88cb057ff  CALL 0x0042d238
00eb21ac  85c0  TEST EAX,EAX
00eb21ae  7e0f  JLE 0x00eb21bf
00eb21b0  8d45f0  LEA EAX,[EBP + -0x10]
00eb21b3  bab423eb00  MOV EDX,0xeb23b4
00eb21b8  e84f9255ff  CALL 0x0040b40c
00eb21bd  eb0d  JMP 0x00eb21cc
00eb21bf  8d45f0  LEA EAX,[EBP + -0x10]
00eb21c2  bab425eb00  MOV EDX,0xeb25b4
00eb21c7  e8409255ff  CALL 0x0040b40c
00eb21cc  68c425eb00  PUSH 0xeb25c4
00eb21d1  8d8d60ffffff  LEA ECX,[EBP + 0xffffff60]
00eb21d7  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb21da  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb21dd  ba07000000  MOV EDX,0x7
00eb21e2  8b38  MOV EDI,dword ptr [EAX]
00eb21e4  ff570c  CALL dword ptr [EDI + 0xc]
00eb21e7  ffb560ffffff  PUSH dword ptr [EBP + 0xffffff60]
00eb21ed  68e424eb00  PUSH 0xeb24e4
00eb21f2  8d8d5cffffff  LEA ECX,[EBP + 0xffffff5c]
00eb21f8  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb21fb  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb21fe  ba01000000  MOV EDX,0x1
00eb2203  8b38  MOV EDI,dword ptr [EAX]
00eb2205  ff570c  CALL dword ptr [EDI + 0xc]
00eb2208  ffb55cffffff  PUSH dword ptr [EBP + 0xffffff5c]
00eb220e  68e424eb00  PUSH 0xeb24e4
00eb2213  8d9558ffffff  LEA EDX,[EBP + 0xffffff58]
00eb2219  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb221c  8b08  MOV ECX,dword ptr [EAX]
00eb221e  ff5118  CALL dword ptr [ECX + 0x18]
00eb2221  ffb558ffffff  PUSH dword ptr [EBP + 0xffffff58]
00eb2227  8d45f4  LEA EAX,[EBP + -0xc]
00eb222a  ba06000000  MOV EDX,0x6
00eb222f  e8e09f55ff  CALL 0x0040c214
00eb2234  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00eb2237  50  PUSH EAX
00eb2238  8d45f4  LEA EAX,[EBP + -0xc]
00eb223b  b90a000000  MOV ECX,0xa
00eb2240  66ba5e00  MOV DX,0x5e
00eb2244  e8ef8c8eff  CALL 0x0079af38
00eb2249  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00eb224c  b8f424eb00  MOV EAX,0xeb24f4
00eb2251  e81e1d3200  CALL 0x011d3f74
00eb2256  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00eb2259  bad825eb00  MOV EDX,0xeb25d8
00eb225e  e8c1a055ff  CALL 0x0040c324
00eb2263  7431  JZ 0x00eb2296
00eb2265  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00eb2268  baf425eb00  MOV EDX,0xeb25f4
00eb226d  e8b2a055ff  CALL 0x0040c324
00eb2272  7422  JZ 0x00eb2296
00eb2274  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00eb2277  ba1026eb00  MOV EDX,0xeb2610
00eb227c  e8a3a055ff  CALL 0x0040c324
00eb2281  7413  JZ 0x00eb2296
00eb2283  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00eb2286  ba2c26eb00  MOV EDX,0xeb262c
00eb228b  e894a055ff  CALL 0x0040c324
00eb2290  0f85a2000000  JNZ 0x00eb2338
00eb2296  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb2299  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb229c  8b10  MOV EDX,dword ptr [EAX]
00eb229e  ff5214  CALL dword ptr [EDX + 0x14]
00eb22a1  83f807  CMP EAX,0x7
00eb22a4  0f8e8e000000  JLE 0x00eb2338
00eb22aa  8d8d54ffffff  LEA ECX,[EBP + 0xffffff54]
00eb22b0  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb22b3  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb22b6  ba06000000  MOV EDX,0x6
00eb22bb  8b38  MOV EDI,dword ptr [EAX]
00eb22bd  ff570c  CALL dword ptr [EDI + 0xc]
00eb22c0  8b8554ffffff  MOV EAX,dword ptr [EBP + 0xffffff54]
00eb22c6  33d2  XOR EDX,EDX
00eb22c8  e86baf57ff  CALL 0x0042d238
00eb22cd  85c0  TEST EAX,EAX
00eb22cf  7e0f  JLE 0x00eb22e0
00eb22d1  8d45f0  LEA EAX,[EBP + -0x10]
00eb22d4  bab423eb00  MOV EDX,0xeb23b4
00eb22d9  e82e9155ff  CALL 0x0040b40c
00eb22de  eb0d  JMP 0x00eb22ed
00eb22e0  8d45f0  LEA EAX,[EBP + -0x10]
00eb22e3  bab425eb00  MOV EDX,0xeb25b4
00eb22e8  e81f9155ff  CALL 0x0040b40c
00eb22ed  8d8d50ffffff  LEA ECX,[EBP + 0xffffff50]
00eb22f3  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00eb22f6  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00eb22f9  ba07000000  MOV EDX,0x7
00eb22fe  8b38  MOV EDI,dword ptr [EAX]
00eb2300  ff570c  CALL dword ptr [EDI + 0xc]
00eb2303  8b8d50ffffff  MOV ECX,dword ptr [EBP + 0xffffff50]
00eb2309  8d45f4  LEA EAX,[EBP + -0xc]
00eb230c  ba4826eb00  MOV EDX,0xeb2648
00eb2311  e8769e55ff  CALL 0x0040c18c
00eb2316  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00eb2319  50  PUSH EAX
00eb231a  8d45f4  LEA EAX,[EBP + -0xc]
00eb231d  b90a000000  MOV ECX,0xa
00eb2322  66ba5e00  MOV DX,0x5e
00eb2326  e80d8c8eff  CALL 0x0079af38
00eb232b  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00eb232e  b8f424eb00  MOV EAX,0xeb24f4
00eb2333  e83c1c3200  CALL 0x011d3f74
00eb2338  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb233e  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb2344  b9c423eb00  MOV ECX,0xeb23c4
00eb2349  33d2  XOR EDX,EDX
00eb234b  8b38  MOV EDI,dword ptr [EAX]
00eb234d  ff5764  CALL dword ptr [EDI + 0x64]
00eb2350  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00eb2356  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00eb235c  33d2  XOR EDX,EDX
00eb235e  8b08  MOV ECX,dword ptr [EAX]
00eb2360  ff514c  CALL dword ptr [ECX + 0x4c]
00eb2363  8bc6  MOV EAX,ESI
00eb2365  e8526d55ff  CALL 0x004090bc
00eb236a  33c0  XOR EAX,EAX
00eb236c  5a  POP EDX
00eb236d  59  POP ECX
00eb236e  59  POP ECX
00eb236f  648910  MOV dword ptr FS:[EAX],EDX
00eb2372  689e23eb00  PUSH 0xeb239e
00eb2377  8d8550ffffff  LEA EAX,[EBP + 0xffffff50]
00eb237d  ba1e000000  MOV EDX,0x1e
00eb2382  e8ad8c55ff  CALL 0x0040b034
00eb2387  8d45ec  LEA EAX,[EBP + -0x14]
00eb238a  ba05000000  MOV EDX,0x5
00eb238f  e8a08c55ff  CALL 0x0040b034
00eb2394  58  POP EAX
00eb2395  ffe0  JMP EAX
