00cf2a44  55  PUSH EBP
00cf2a45  8bec  MOV EBP,ESP
00cf2a47  6a00  PUSH 0x0
00cf2a49  6a00  PUSH 0x0
00cf2a4b  6a00  PUSH 0x0
00cf2a4d  53  PUSH EBX
00cf2a4e  8bd8  MOV EBX,EAX
00cf2a50  33c0  XOR EAX,EAX
00cf2a52  55  PUSH EBP
00cf2a53  68fa2acf00  PUSH 0xcf2afa
00cf2a58  64ff30  PUSH dword ptr FS:[EAX]
00cf2a5b  648920  MOV dword ptr FS:[EAX],ESP
00cf2a5e  8d55fc  LEA EDX,[EBP + -0x4]
00cf2a61  8b8380040000  MOV EAX,dword ptr [EBX + 0x480]
00cf2a67  e840fc90ff  CALL 0x006026ac
00cf2a6c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00cf2a6f  e8648a4d00  CALL 0x011cb4d8
00cf2a74  84c0  TEST AL,AL
00cf2a76  752c  JNZ 0x00cf2aa4
00cf2a78  33c9  XOR ECX,ECX
00cf2a7a  ba142bcf00  MOV EDX,0xcf2b14
00cf2a7f  b8582bcf00  MOV EAX,0xcf2b58
00cf2a84  e81f1accff  CALL 0x009b44a8
00cf2a89  8b8380040000  MOV EAX,dword ptr [EBX + 0x480]
00cf2a8f  8b10  MOV EDX,dword ptr [EAX]
00cf2a91  ff9264010000  CALL dword ptr [EDX + 0x164]
00cf2a97  8b8380040000  MOV EAX,dword ptr [EBX + 0x480]
00cf2a9d  e8be6b93ff  CALL 0x00629660
00cf2aa2  eb2e  JMP 0x00cf2ad2
00cf2aa4  8d55f4  LEA EDX,[EBP + -0xc]
00cf2aa7  8b8380040000  MOV EAX,dword ptr [EBX + 0x480]
00cf2aad  e8fafb90ff  CALL 0x006026ac
00cf2ab2  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00cf2ab5  8d55f8  LEA EDX,[EBP + -0x8]
00cf2ab8  e8f7ffb6ff  CALL 0x00862ab4
00cf2abd  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00cf2ac0  8d8394040000  LEA EAX,[EBX + 0x494]
00cf2ac6  e8f98871ff  CALL 0x0040b3c4
00cf2acb  8bc3  MOV EAX,EBX
00cf2acd  e85646a3ff  CALL 0x00727128
00cf2ad2  33c0  XOR EAX,EAX
00cf2ad4  5a  POP EDX
00cf2ad5  59  POP ECX
00cf2ad6  59  POP ECX
00cf2ad7  648910  MOV dword ptr FS:[EAX],EDX
00cf2ada  68012bcf00  PUSH 0xcf2b01
00cf2adf  8d45f4  LEA EAX,[EBP + -0xc]
00cf2ae2  e8ed8471ff  CALL 0x0040afd4
00cf2ae7  8d45f8  LEA EAX,[EBP + -0x8]
00cf2aea  e8e58471ff  CALL 0x0040afd4
00cf2aef  8d45fc  LEA EAX,[EBP + -0x4]
00cf2af2  e8dd8471ff  CALL 0x0040afd4
00cf2af7  58  POP EAX
00cf2af8  ffe0  JMP EAX
