; Static instruction listing. Function bodies and indirect exception flow require review.
00bee374  55  PUSH EBP
00bee375  8bec  MOV EBP,ESP
00bee377  83c4f0  ADD ESP,-0x10
00bee37a  53  PUSH EBX
00bee37b  56  PUSH ESI
00bee37c  57  PUSH EDI
00bee37d  33c9  XOR ECX,ECX
00bee37f  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bee382  8955f8  MOV dword ptr [EBP + -0x8],EDX
00bee385  33d2  XOR EDX,EDX
00bee387  55  PUSH EBP
00bee388  6851e4be00  PUSH 0xbee451
00bee38d  64ff32  PUSH dword ptr FS:[EDX]
00bee390  648922  MOV dword ptr FS:[EDX],ESP
00bee393  33d2  XOR EDX,EDX
00bee395  8955f4  MOV dword ptr [EBP + -0xc],EDX
00bee398  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00bee39b  8bc8  MOV ECX,EAX
00bee39d  b201  MOV DL,0x1
00bee39f  a128cc5f00  MOV EAX,[0x005fcc28]
00bee3a4  e88394a2ff  CALL 0x0061782c
00bee3a9  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bee3ac  33c0  XOR EAX,EAX
00bee3ae  55  PUSH EBP
00bee3af  6832e4be00  PUSH 0xbee432
00bee3b4  64ff30  PUSH dword ptr FS:[EAX]
00bee3b7  648920  MOV dword ptr FS:[EAX],ESP
00bee3ba  eb40  JMP 0x00bee3fc
00bee3bc  ff4708  INC dword ptr [EDI + 0x8]
00bee3bf  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee3c2  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bee3c5  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bee3c8  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee3cb  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee3ce  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
00bee3d1  8b5204  MOV EDX,dword ptr [EDX + 0x4]
00bee3d4  8b3482  MOV ESI,dword ptr [EDX + EAX*0x4]
00bee3d7  8d45fc  LEA EAX,[EBP + -0x4]
00bee3da  e8592382ff  CALL 0x00410738
00bee3df  8bc8  MOV ECX,EAX
00bee3e1  ba60e4be00  MOV EDX,0xbee460
00bee3e6  8bc6  MOV EAX,ESI
00bee3e8  e833b484ff  CALL 0x00439820
00bee3ed  84c0  TEST AL,AL
00bee3ef  740b  JZ 0x00bee3fc
00bee3f1  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00bee3f4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee3f7  8b08  MOV ECX,dword ptr [EAX]
00bee3f9  ff5138  CALL dword ptr [ECX + 0x38]
00bee3fc  8b7df4  MOV EDI,dword ptr [EBP + -0xc]
00bee3ff  8b4708  MOV EAX,dword ptr [EDI + 0x8]
00bee402  8b5704  MOV EDX,dword ptr [EDI + 0x4]
00bee405  8b5208  MOV EDX,dword ptr [EDX + 0x8]
00bee408  4a  DEC EDX
00bee409  3bc2  CMP EAX,EDX
00bee40b  0f9cc3  SETL BL
00bee40e  84db  TEST BL,BL
00bee410  75aa  JNZ 0x00bee3bc
00bee412  33c0  XOR EAX,EAX
00bee414  5a  POP EDX
00bee415  59  POP ECX
00bee416  59  POP ECX
00bee417  648910  MOV dword ptr FS:[EAX],EDX
00bee41a  6839e4be00  PUSH 0xbee439
00bee41f  837df400  CMP dword ptr [EBP + -0xc],0x0
00bee423  740a  JZ 0x00bee42f
00bee425  b201  MOV DL,0x1
00bee427  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee42a  8b08  MOV ECX,dword ptr [EAX]
00bee42c  ff51fc  CALL dword ptr [ECX + -0x4]
00bee42f  58  POP EAX
00bee430  ffe0  JMP EAX
