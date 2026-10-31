; Static instruction listing. Function bodies and indirect exception flow require review.
00bef080  55  PUSH EBP
00bef081  8bec  MOV EBP,ESP
00bef083  83c490  ADD ESP,-0x70
00bef086  53  PUSH EBX
00bef087  56  PUSH ESI
00bef088  57  PUSH EDI
00bef089  33db  XOR EBX,EBX
00bef08b  895d98  MOV dword ptr [EBP + -0x68],EBX
00bef08e  895da8  MOV dword ptr [EBP + -0x58],EBX
00bef091  895da0  MOV dword ptr [EBP + -0x60],EBX
00bef094  895d9c  MOV dword ptr [EBP + -0x64],EBX
00bef097  895da4  MOV dword ptr [EBP + -0x5c],EBX
00bef09a  895df4  MOV dword ptr [EBP + -0xc],EBX
00bef09d  895df0  MOV dword ptr [EBP + -0x10],EBX
00bef0a0  895dec  MOV dword ptr [EBP + -0x14],EBX
00bef0a3  895df8  MOV dword ptr [EBP + -0x8],EBX
00bef0a6  895de8  MOV dword ptr [EBP + -0x18],EBX
00bef0a9  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bef0ac  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00bef0af  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bef0b2  e811c081ff  CALL 0x0040b0c8
00bef0b7  33c0  XOR EAX,EAX
00bef0b9  55  PUSH EBP
00bef0ba  6838f5be00  PUSH 0xbef538
00bef0bf  64ff30  PUSH dword ptr FS:[EAX]
00bef0c2  648920  MOV dword ptr FS:[EAX],ESP
00bef0c5  33d2  XOR EDX,EDX
00bef0c7  55  PUSH EBP
00bef0c8  68a4f4be00  PUSH 0xbef4a4
00bef0cd  64ff32  PUSH dword ptr FS:[EDX]
00bef0d0  648922  MOV dword ptr FS:[EDX],ESP
00bef0d3  837dfc00  CMP dword ptr [EBP + -0x4],0x0
00bef0d7  0f8414030000  JZ 0x00bef3f1
00bef0dd  8d45f8  LEA EAX,[EBP + -0x8]
00bef0e0  50  PUSH EAX
00bef0e1  6a00  PUSH 0x0
00bef0e3  6a00  PUSH 0x0
00bef0e5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bef0e8  8945ac  MOV dword ptr [EBP + -0x54],EAX
00bef0eb  c645b011  MOV byte ptr [EBP + -0x50],0x11
00bef0ef  8d45a4  LEA EAX,[EBP + -0x5c]
00bef0f2  e811100000  CALL 0x00bf0108
00bef0f7  8b45a4  MOV EAX,dword ptr [EBP + -0x5c]
00bef0fa  8d55a8  LEA EDX,[EBP + -0x58]
00bef0fd  8b08  MOV ECX,dword ptr [EAX]
00bef0ff  ff5120  CALL dword ptr [ECX + 0x20]
00bef102  8b45a8  MOV EAX,dword ptr [EBP + -0x58]
00bef105  8945b4  MOV dword ptr [EBP + -0x4c],EAX
00bef108  c645b811  MOV byte ptr [EBP + -0x48],0x11
00bef10c  8d459c  LEA EAX,[EBP + -0x64]
00bef10f  e8f40f0000  CALL 0x00bf0108
00bef114  8b459c  MOV EAX,dword ptr [EBP + -0x64]
00bef117  8d55a0  LEA EDX,[EBP + -0x60]
00bef11a  8b08  MOV ECX,dword ptr [EAX]
00bef11c  ff511c  CALL dword ptr [ECX + 0x1c]
00bef11f  8b45a0  MOV EAX,dword ptr [EBP + -0x60]
00bef122  8945bc  MOV dword ptr [EBP + -0x44],EAX
00bef125  c645c011  MOV byte ptr [EBP + -0x40],0x11
00bef129  8d55ac  LEA EDX,[EBP + -0x54]
00bef12c  b902000000  MOV ECX,0x2
00bef131  b854f5be00  MOV EAX,0xbef554
00bef136  e8e9e7dbff  CALL 0x009ad924
00bef13b  33c0  XOR EAX,EAX
00bef13d  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bef140  8d55e8  LEA EDX,[EBP + -0x18]
00bef143  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bef146  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00bef149  8b08  MOV ECX,dword ptr [EAX]
00bef14b  ff5120  CALL dword ptr [ECX + 0x20]
00bef14e  33c0  XOR EAX,EAX
00bef150  55  PUSH EBP
00bef151  68eff1be00  PUSH 0xbef1ef
00bef156  64ff30  PUSH dword ptr FS:[EAX]
00bef159  648920  MOV dword ptr FS:[EAX],ESP
00bef15c  eb6d  JMP 0x00bef1cb
00bef15e  8d55f0  LEA EDX,[EBP + -0x10]
00bef161  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bef164  8b08  MOV ECX,dword ptr [EAX]
00bef166  ff510c  CALL dword ptr [ECX + 0xc]
00bef169  8d45ec  LEA EAX,[EBP + -0x14]
00bef16c  e8c71582ff  CALL 0x00410738
00bef171  8bc8  MOV ECX,EAX
00bef173  ba6cf5be00  MOV EDX,0xbef56c
00bef178  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bef17b  e878a684ff  CALL 0x004397f8
00bef180  84c0  TEST AL,AL
00bef182  7447  JZ 0x00bef1cb
00bef184  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bef187  8b10  MOV EDX,dword ptr [EAX]
00bef189  ff520c  CALL dword ptr [EDX + 0xc]
00bef18c  8d5598  LEA EDX,[EBP + -0x68]
00bef18f  e848de83ff  CALL 0x0042cfdc
00bef194  8b5d98  MOV EBX,dword ptr [EBP + -0x68]
00bef197  b901000000  MOV ECX,0x1
00bef19c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00bef19f  8bc3  MOV EAX,EBX
00bef1a1  e80ad381ff  CALL 0x0040c4b0
00bef1a6  8bf0  MOV ESI,EAX
00bef1a8  85f6  TEST ESI,ESI
00bef1aa  0f94c2  SETZ DL
00bef1ad  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bef1b0  8b08  MOV ECX,dword ptr [EAX]
00bef1b2  ff5164  CALL dword ptr [ECX + 0x64]
00bef1b5  8d5590  LEA EDX,[EBP + -0x70]
00bef1b8  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bef1bb  8b08  MOV ECX,dword ptr [EAX]
00bef1bd  ff5160  CALL dword ptr [ECX + 0x60]
00bef1c0  8d5d90  LEA EBX,[EBP + -0x70]
00bef1c3  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00bef1c6  8b4304  MOV EAX,dword ptr [EBX + 0x4]
00bef1c9  ff13  CALL dword ptr [EBX]
00bef1cb  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bef1ce  8b10  MOV EDX,dword ptr [EAX]
00bef1d0  ff5210  CALL dword ptr [EDX + 0x10]
00bef1d3  84c0  TEST AL,AL
00bef1d5  7587  JNZ 0x00bef15e
00bef1d7  33c0  XOR EAX,EAX
00bef1d9  5a  POP EDX
00bef1da  59  POP ECX
00bef1db  59  POP ECX
00bef1dc  648910  MOV dword ptr FS:[EAX],EDX
00bef1df  68f6f1be00  PUSH 0xbef1f6
00bef1e4  8d45e8  LEA EAX,[EBP + -0x18]
00bef1e7  e84c1582ff  CALL 0x00410738
00bef1ec  58  POP EAX
00bef1ed  ffe0  JMP EAX
00bef3f1  33c0  XOR EAX,EAX
00bef3f3  8945d4  MOV dword ptr [EBP + -0x2c],EAX
00bef3f6  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bef3f9  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00bef3fc  8bc8  MOV ECX,EAX
00bef3fe  b201  MOV DL,0x1
00bef400  a128cc5f00  MOV EAX,[0x005fcc28]
00bef405  e82284a2ff  CALL 0x0061782c
00bef40a  8945d4  MOV dword ptr [EBP + -0x2c],EAX
00bef40d  33c0  XOR EAX,EAX
00bef40f  55  PUSH EBP
00bef410  6893f4be00  PUSH 0xbef493
00bef415  64ff30  PUSH dword ptr FS:[EAX]
00bef418  648920  MOV dword ptr FS:[EAX],ESP
00bef41b  eb40  JMP 0x00bef45d
00bef41d  ff4608  INC dword ptr [ESI + 0x8]
00bef420  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bef423  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00bef426  8945c4  MOV dword ptr [EBP + -0x3c],EAX
00bef429  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bef42c  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bef42f  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
00bef432  8b5204  MOV EDX,dword ptr [EDX + 0x4]
00bef435  8b3c82  MOV EDI,dword ptr [EDX + EAX*0x4]
00bef438  8d45f4  LEA EAX,[EBP + -0xc]
00bef43b  e8f81282ff  CALL 0x00410738
00bef440  8bc8  MOV ECX,EAX
00bef442  ba7cf5be00  MOV EDX,0xbef57c
00bef447  8bc7  MOV EAX,EDI
00bef449  e8d2a384ff  CALL 0x00439820
00bef44e  84c0  TEST AL,AL
00bef450  740b  JZ 0x00bef45d
00bef452  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00bef455  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bef458  8b08  MOV ECX,dword ptr [EAX]
00bef45a  ff5138  CALL dword ptr [ECX + 0x38]
00bef45d  8b75d4  MOV ESI,dword ptr [EBP + -0x2c]
00bef460  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bef463  8b5604  MOV EDX,dword ptr [ESI + 0x4]
00bef466  8b5208  MOV EDX,dword ptr [EDX + 0x8]
00bef469  4a  DEC EDX
00bef46a  3bc2  CMP EAX,EDX
00bef46c  0f9cc3  SETL BL
00bef46f  84db  TEST BL,BL
00bef471  75aa  JNZ 0x00bef41d
00bef473  33c0  XOR EAX,EAX
00bef475  5a  POP EDX
00bef476  59  POP ECX
00bef477  59  POP ECX
00bef478  648910  MOV dword ptr FS:[EAX],EDX
00bef47b  689af4be00  PUSH 0xbef49a
00bef480  837dd400  CMP dword ptr [EBP + -0x2c],0x0
00bef484  740a  JZ 0x00bef490
00bef486  b201  MOV DL,0x1
00bef488  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bef48b  8b08  MOV ECX,dword ptr [EAX]
00bef48d  ff51fc  CALL dword ptr [ECX + -0x4]
00bef490  58  POP EAX
00bef491  ffe0  JMP EAX
