; Static instruction listing. Function bodies and indirect exception flow require review.
00e1fe30  55  PUSH EBP
00e1fe31  8bec  MOV EBP,ESP
00e1fe33  83c4f4  ADD ESP,-0xc
00e1fe36  53  PUSH EBX
00e1fe37  56  PUSH ESI
00e1fe38  57  PUSH EDI
00e1fe39  894df8  MOV dword ptr [EBP + -0x8],ECX
00e1fe3c  8955fc  MOV dword ptr [EBP + -0x4],EDX
00e1fe3f  8bf0  MOV ESI,EAX
00e1fe41  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00e1fe44  e8634c6bff  CALL 0x004d4aac
00e1fe49  85c0  TEST EAX,EAX
00e1fe4b  7509  JNZ 0x00e1fe56
00e1fe4d  c745f405000000  MOV dword ptr [EBP + -0xc],0x5
00e1fe54  eb0b  JMP 0x00e1fe61
00e1fe56  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00e1fe59  e84e4c6bff  CALL 0x004d4aac
00e1fe5e  8945f4  MOV dword ptr [EBP + -0xc],EAX
00e1fe61  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00e1fe64  3b0560a12501  CMP EAX,dword ptr [0x0125a160]
00e1fe6a  7510  JNZ 0x00e1fe7c
00e1fe6c  0fb60564a12501  MOVZX EAX,byte ptr [0x0125a164]
00e1fe73  3401  XOR AL,0x1
00e1fe75  a264a12501  MOV [0x0125a164],AL
00e1fe7a  eb07  JMP 0x00e1fe83
00e1fe7c  c60564a1250101  MOV byte ptr [0x0125a164],0x1
00e1fe83  8b86d8040000  MOV EAX,dword ptr [ESI + 0x4d8]
00e1fe89  8b800c030000  MOV EAX,dword ptr [EAX + 0x30c]
00e1fe8f  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00e1fe92  8b5808  MOV EBX,dword ptr [EAX + 0x8]
00e1fe95  4b  DEC EBX
00e1fe96  85db  TEST EBX,EBX
00e1fe98  7c22  JL 0x00e1febc
00e1fe9a  43  INC EBX
00e1fe9b  33ff  XOR EDI,EDI
00e1fe9d  8b86d8040000  MOV EAX,dword ptr [ESI + 0x4d8]
00e1fea3  8b800c030000  MOV EAX,dword ptr [EAX + 0x30c]
00e1fea9  8bd7  MOV EDX,EDI
00e1feab  e854b885ff  CALL 0x0067b704
00e1feb0  83caff  OR EDX,0xffffffff
00e1feb3  e83cb785ff  CALL 0x0067b5f4
00e1feb8  47  INC EDI
00e1feb9  4b  DEC EBX
00e1feba  75e1  JNZ 0x00e1fe9d
00e1febc  803d64a1250100  CMP byte ptr [0x0125a164],0x0
00e1fec3  7427  JZ 0x00e1feec
00e1fec5  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00e1fec8  e8df4b6bff  CALL 0x004d4aac
00e1fecd  8bd0  MOV EDX,EAX
00e1fecf  8b86d8040000  MOV EAX,dword ptr [ESI + 0x4d8]
00e1fed5  8b800c030000  MOV EAX,dword ptr [EAX + 0x30c]
00e1fedb  e824b885ff  CALL 0x0067b704
00e1fee0  ba0c000000  MOV EDX,0xc
00e1fee5  e80ab785ff  CALL 0x0067b5f4
00e1feea  eb25  JMP 0x00e1ff11
00e1feec  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00e1feef  e8b84b6bff  CALL 0x004d4aac
00e1fef4  8bd0  MOV EDX,EAX
00e1fef6  8b86d8040000  MOV EAX,dword ptr [ESI + 0x4d8]
00e1fefc  8b800c030000  MOV EAX,dword ptr [EAX + 0x30c]
00e1ff02  e8fdb785ff  CALL 0x0067b704
00e1ff07  ba0d000000  MOV EDX,0xd
00e1ff0c  e8e3b685ff  CALL 0x0067b5f4
00e1ff11  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00e1ff14  a360a12501  MOV [0x0125a160],EAX
00e1ff19  a160a12501  MOV EAX,[0x0125a160]
00e1ff1e  83f805  CMP EAX,0x5
00e1ff21  7779  JA 0x00e1ff9c
00e1ff23  ff24852affe100  JMP dword ptr [EAX*0x4 + 0xe1ff2a]
00e1ff9c  8d8608080000  LEA EAX,[ESI + 0x808]
00e1ffa2  bae0ffe100  MOV EDX,0xe1ffe0
00e1ffa7  e818b45eff  CALL 0x0040b3c4
00e1ffac  0fb60564a12501  MOVZX EAX,byte ptr [0x0125a164]
00e1ffb3  88860c080000  MOV byte ptr [ESI + 0x80c],AL
00e1ffb9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00e1ffbc  8b154ccf6500  MOV EDX,dword ptr [0x0065cf4c]
00e1ffc2  e801945eff  CALL 0x004093c8
00e1ffc7  e8442486ff  CALL 0x00682410
00e1ffcc  5f  POP EDI
00e1ffcd  5e  POP ESI
00e1ffce  5b  POP EBX
00e1ffcf  8be5  MOV ESP,EBP
00e1ffd1  5d  POP EBP
00e1ffd2  c3  RET
