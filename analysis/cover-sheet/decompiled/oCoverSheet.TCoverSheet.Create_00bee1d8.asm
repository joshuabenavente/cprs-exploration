; Static instruction listing. Function bodies and indirect exception flow require review.
00bee1d8  55  PUSH EBP
00bee1d9  8bec  MOV EBP,ESP
00bee1db  6a00  PUSH 0x0
00bee1dd  6a00  PUSH 0x0
00bee1df  53  PUSH EBX
00bee1e0  56  PUSH ESI
00bee1e1  57  PUSH EDI
00bee1e2  84d2  TEST DL,DL
00bee1e4  7408  JZ 0x00bee1ee
00bee1e6  83c4f0  ADD ESP,-0x10
00bee1e9  e8beb481ff  CALL 0x004096ac
00bee1ee  8bda  MOV EBX,EDX
00bee1f0  8bf8  MOV EDI,EAX
00bee1f2  33c0  XOR EAX,EAX
00bee1f4  55  PUSH EBP
00bee1f5  68cae2be00  PUSH 0xbee2ca
00bee1fa  64ff30  PUSH dword ptr FS:[EAX]
00bee1fd  648920  MOV dword ptr FS:[EAX],ESP
00bee200  33d2  XOR EDX,EDX
00bee202  8bc7  MOV EAX,EDI
00bee204  e883ae81ff  CALL 0x0040908c
00bee209  b201  MOV DL,0x1
00bee20b  a1e0d6be00  MOV EAX,[0x00bed6e0]
00bee210  e80ff6ffff  CALL 0x00bed824
00bee215  50  PUSH EAX
00bee216  8d4714  LEA EAX,[EDI + 0x14]
00bee219  e81a2582ff  CALL 0x00410738
00bee21e  8bc8  MOV ECX,EAX
00bee220  baf0e2be00  MOV EDX,0xbee2f0
00bee225  58  POP EAX
00bee226  e8bdaf81ff  CALL 0x004091e8
00bee22b  b201  MOV DL,0x1
00bee22d  a150dfbe00  MOV EAX,[0x00bedf50]
00bee232  e8cd180000  CALL 0x00befb04
00bee237  8bf0  MOV ESI,EAX
00bee239  897718  MOV dword ptr [EDI + 0x18],ESI
00bee23c  c6462800  MOV byte ptr [ESI + 0x28],0x0
00bee240  8d55fc  LEA EDX,[EBP + -0x4]
00bee243  b001  MOV AL,0x1
00bee245  e8ee1e0000  CALL 0x00bf0138
00bee24a  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00bee24d  8d470c  LEA EAX,[EDI + 0xc]
00bee250  e86fd181ff  CALL 0x0040b3c4
00bee255  8d45f8  LEA EAX,[EBP + -0x8]
00bee258  e88315dcff  CALL 0x009af7e0
00bee25d  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00bee260  8d4710  LEA EAX,[EDI + 0x10]
00bee263  e85cd181ff  CALL 0x0040b3c4
00bee268  897f34  MOV dword ptr [EDI + 0x34],EDI
00bee26b  c7473038edbe00  MOV dword ptr [EDI + 0x30],0xbeed38
00bee272  c7472008000000  MOV dword ptr [EDI + 0x20],0x8
00bee279  c6472400  MOV byte ptr [EDI + 0x24],0x0
00bee27d  8d471c  LEA EAX,[EDI + 0x1c]
00bee280  8b15d0dabe00  MOV EDX,dword ptr [0x00bedad0]
00bee286  e8510882ff  CALL 0x0040eadc
00bee28b  b201  MOV DL,0x1
00bee28d  a1d4d8bc00  MOV EAX,[0x00bcd8d4]
00bee292  e889f7fdff  CALL 0x00bcda20
00bee297  50  PUSH EAX
00bee298  8d4728  LEA EAX,[EDI + 0x28]
00bee29b  e8982482ff  CALL 0x00410738
00bee2a0  8bc8  MOV ECX,EAX
00bee2a2  ba00e3be00  MOV EDX,0xbee300
00bee2a7  58  POP EAX
00bee2a8  e83baf81ff  CALL 0x004091e8
00bee2ad  33c0  XOR EAX,EAX
00bee2af  5a  POP EDX
00bee2b0  59  POP ECX
00bee2b1  59  POP ECX
00bee2b2  648910  MOV dword ptr FS:[EAX],EDX
00bee2b5  68d1e2be00  PUSH 0xbee2d1
00bee2ba  8d45f8  LEA EAX,[EBP + -0x8]
00bee2bd  ba02000000  MOV EDX,0x2
00bee2c2  e86dcd81ff  CALL 0x0040b034
00bee2c7  58  POP EAX
00bee2c8  ffe0  JMP EAX
