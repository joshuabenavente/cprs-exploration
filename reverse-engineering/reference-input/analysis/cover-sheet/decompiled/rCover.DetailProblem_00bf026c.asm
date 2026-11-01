; Static instruction listing. Function bodies and indirect exception flow require review.
00bf026c  55  PUSH EBP
00bf026d  8bec  MOV EBP,ESP
00bf026f  83c4d0  ADD ESP,-0x30
00bf0272  53  PUSH EBX
00bf0273  56  PUSH ESI
00bf0274  33d2  XOR EDX,EDX
00bf0276  8955d4  MOV dword ptr [EBP + -0x2c],EDX
00bf0279  8955d0  MOV dword ptr [EBP + -0x30],EDX
00bf027c  8bf0  MOV ESI,EAX
00bf027e  33c0  XOR EAX,EAX
00bf0280  55  PUSH EBP
00bf0281  682b03bf00  PUSH 0xbf032b
00bf0286  64ff30  PUSH dword ptr FS:[EAX]
00bf0289  648920  MOV dword ptr FS:[EAX],ESP
00bf028c  b201  MOV DL,0x1
00bf028e  a100734a00  MOV EAX,[0x004a7300]
00bf0293  e85c7f8eff  CALL 0x004d81f4
00bf0298  8bd8  MOV EBX,EAX
00bf029a  a1a0e22401  MOV EAX,[0x0124e2a0]
00bf029f  8b00  MOV EAX,dword ptr [EAX]
00bf02a1  dd4008  FLD double ptr [EAX + 0x8]
00bf02a4  db7df0  FSTP extended double ptr [EBP + -0x10]
00bf02a7  9b  WAIT
00bf02a8  53  PUSH EBX
00bf02a9  6a00  PUSH 0x0
00bf02ab  a1e0f22401  MOV EAX,[0x0124f2e0]
00bf02b0  8b00  MOV EAX,dword ptr [EAX]
00bf02b2  ff7004  PUSH dword ptr [EAX + 0x4]
00bf02b5  684803bf00  PUSH 0xbf0348
00bf02ba  0fb745f8  MOVZX EAX,word ptr [EBP + -0x8]
00bf02be  50  PUSH EAX
00bf02bf  ff75f4  PUSH dword ptr [EBP + -0xc]
00bf02c2  ff75f0  PUSH dword ptr [EBP + -0x10]
00bf02c5  8d55d0  LEA EDX,[EBP + -0x30]
00bf02c8  a188f72401  MOV EAX,[0x0124f788]
00bf02cd  e8420684ff  CALL 0x00430914
00bf02d2  ff75d0  PUSH dword ptr [EBP + -0x30]
00bf02d5  8d45d4  LEA EAX,[EBP + -0x2c]
00bf02d8  ba03000000  MOV EDX,0x3
00bf02dd  e832bf81ff  CALL 0x0040c214
00bf02e2  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00bf02e5  8945d8  MOV dword ptr [EBP + -0x28],EAX
00bf02e8  c645dc11  MOV byte ptr [EBP + -0x24],0x11
00bf02ec  8975e0  MOV dword ptr [EBP + -0x20],ESI
00bf02ef  c645e400  MOV byte ptr [EBP + -0x1c],0x0
00bf02f3  33c0  XOR EAX,EAX
00bf02f5  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bf02f8  c645ec11  MOV byte ptr [EBP + -0x14],0x11
00bf02fc  8d55d8  LEA EDX,[EBP + -0x28]
00bf02ff  b902000000  MOV ECX,0x2
00bf0304  b85803bf00  MOV EAX,0xbf0358
00bf0309  e872d7dbff  CALL 0x009ada80
00bf030e  33c0  XOR EAX,EAX
00bf0310  5a  POP EDX
00bf0311  59  POP ECX
00bf0312  59  POP ECX
00bf0313  648910  MOV dword ptr FS:[EAX],EDX
00bf0316  683203bf00  PUSH 0xbf0332
00bf031b  8d45d0  LEA EAX,[EBP + -0x30]
00bf031e  ba02000000  MOV EDX,0x2
00bf0323  e80cad81ff  CALL 0x0040b034
00bf0328  58  POP EAX
00bf0329  ffe0  JMP EAX
