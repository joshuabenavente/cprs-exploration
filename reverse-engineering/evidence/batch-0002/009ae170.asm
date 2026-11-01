009ae170  55  PUSH EBP
009ae171  8bec  MOV EBP,ESP
009ae173  83c4ec  ADD ESP,-0x14
009ae176  53  PUSH EBX
009ae177  33d2  XOR EDX,EDX
009ae179  8955f8  MOV dword ptr [EBP + -0x8],EDX
009ae17c  8955f4  MOV dword ptr [EBP + -0xc],EDX
009ae17f  8945fc  MOV dword ptr [EBP + -0x4],EAX
009ae182  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
009ae185  e83ecfa5ff  CALL 0x0040b0c8
009ae18a  33c0  XOR EAX,EAX
009ae18c  55  PUSH EBP
009ae18d  68d6e29a00  PUSH 0x9ae2d6
009ae192  64ff30  PUSH dword ptr FS:[EAX]
009ae195  648920  MOV dword ptr FS:[EAX],ESP
009ae198  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
009ae19b  8b15cc8f2501  MOV EDX,dword ptr [0x01258fcc]
009ae1a1  8b5250  MOV EDX,dword ptr [EDX + 0x50]
009ae1a4  e87be1a5ff  CALL 0x0040c324
009ae1a9  7509  JNZ 0x009ae1b4
009ae1ab  c645f301  MOV byte ptr [EBP + -0xd],0x1
009ae1af  e905010000  JMP 0x009ae2b9
009ae1b4  8d45f8  LEA EAX,[EBP + -0x8]
009ae1b7  8b15cc8f2501  MOV EDX,dword ptr [0x01258fcc]
009ae1bd  8b526c  MOV EDX,dword ptr [EDX + 0x6c]
009ae1c0  e847d2a5ff  CALL 0x0040b40c
009ae1c5  8d45f4  LEA EAX,[EBP + -0xc]
009ae1c8  8b15cc8f2501  MOV EDX,dword ptr [0x01258fcc]
009ae1ce  8b5268  MOV EDX,dword ptr [EDX + 0x68]
009ae1d1  e836d2a5ff  CALL 0x0040b40c
009ae1d6  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae1db  0fb6404c  MOVZX EAX,byte ptr [EAX + 0x4c]
009ae1df  8845f2  MOV byte ptr [EBP + -0xe],AL
009ae1e2  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae1e7  0fb6404d  MOVZX EAX,byte ptr [EAX + 0x4d]
009ae1eb  8845f1  MOV byte ptr [EBP + -0xf],AL
009ae1ee  33c9  XOR ECX,ECX
009ae1f0  b201  MOV DL,0x1
009ae1f2  a18ccb9900  MOV EAX,[0x0099cb8c]
009ae1f7  e8a00dffff  CALL 0x0099ef9c
009ae1fc  8945ec  MOV dword ptr [EBP + -0x14],EAX
009ae1ff  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae204  8b505c  MOV EDX,dword ptr [EAX + 0x5c]
009ae207  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
009ae20a  8b08  MOV ECX,dword ptr [EAX]
009ae20c  ff5108  CALL dword ptr [ECX + 0x8]
009ae20f  33c0  XOR EAX,EAX
009ae211  55  PUSH EBP
009ae212  68b2e29a00  PUSH 0x9ae2b2
009ae217  64ff30  PUSH dword ptr FS:[EAX]
009ae21a  648920  MOV dword ptr FS:[EAX],ESP
009ae21d  33db  XOR EBX,EBX
009ae21f  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
009ae222  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae227  8b08  MOV ECX,dword ptr [EAX]
009ae229  ff5178  CALL dword ptr [ECX + 0x78]
009ae22c  8845f3  MOV byte ptr [EBP + -0xd],AL
009ae22f  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae234  8b4050  MOV EAX,dword ptr [EAX + 0x50]
009ae237  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
009ae23a  e8e5e0a5ff  CALL 0x0040c324
009ae23f  7507  JNZ 0x009ae248
009ae241  bb05000000  MOV EBX,0x5
009ae246  eb01  JMP 0x009ae249
009ae248  43  INC EBX
009ae249  83fb05  CMP EBX,0x5
009ae24c  7cd1  JL 0x009ae21f
009ae24e  33c0  XOR EAX,EAX
009ae250  5a  POP EDX
009ae251  59  POP ECX
009ae252  59  POP ECX
009ae253  648910  MOV dword ptr FS:[EAX],EDX
009ae256  68b9e29a00  PUSH 0x9ae2b9
009ae25b  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae260  83c06c  ADD EAX,0x6c
009ae263  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
009ae266  e859d1a5ff  CALL 0x0040b3c4
009ae26b  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae270  83c068  ADD EAX,0x68
009ae273  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
009ae276  e849d1a5ff  CALL 0x0040b3c4
009ae27b  0fb655f2  MOVZX EDX,byte ptr [EBP + -0xe]
009ae27f  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae284  8b08  MOV ECX,dword ptr [EAX]
009ae286  ff5144  CALL dword ptr [ECX + 0x44]
009ae289  0fb655f1  MOVZX EDX,byte ptr [EBP + -0xf]
009ae28d  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae292  8b08  MOV ECX,dword ptr [EAX]
009ae294  ff5148  CALL dword ptr [ECX + 0x48]
009ae297  a1cc8f2501  MOV EAX,[0x01258fcc]
009ae29c  8b405c  MOV EAX,dword ptr [EAX + 0x5c]
009ae29f  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
009ae2a2  8b08  MOV ECX,dword ptr [EAX]
009ae2a4  ff5108  CALL dword ptr [ECX + 0x8]
009ae2a7  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
009ae2aa  e80daea5ff  CALL 0x004090bc
009ae2af  58  POP EAX
009ae2b0  ffe0  JMP EAX
009ae2b9  33c0  XOR EAX,EAX
009ae2bb  5a  POP EDX
009ae2bc  59  POP ECX
009ae2bd  59  POP ECX
009ae2be  648910  MOV dword ptr FS:[EAX],EDX
009ae2c1  68dde29a00  PUSH 0x9ae2dd
009ae2c6  8d45f4  LEA EAX,[EBP + -0xc]
009ae2c9  ba03000000  MOV EDX,0x3
009ae2ce  e861cda5ff  CALL 0x0040b034
009ae2d3  58  POP EAX
009ae2d4  ffe0  JMP EAX
