; Static instruction listing. Function bodies and indirect exception flow require review.
00bd391c  55  PUSH EBP
00bd391d  8bec  MOV EBP,ESP
00bd391f  83c4ec  ADD ESP,-0x14
00bd3922  53  PUSH EBX
00bd3923  56  PUSH ESI
00bd3924  57  PUSH EDI
00bd3925  33c9  XOR ECX,ECX
00bd3927  894dec  MOV dword ptr [EBP + -0x14],ECX
00bd392a  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd392d  8bda  MOV EBX,EDX
00bd392f  8945f8  MOV dword ptr [EBP + -0x8],EAX
00bd3932  33c0  XOR EAX,EAX
00bd3934  55  PUSH EBP
00bd3935  68363abd00  PUSH 0xbd3a36
00bd393a  64ff30  PUSH dword ptr FS:[EAX]
00bd393d  648920  MOV dword ptr FS:[EAX],ESP
00bd3940  8bc3  MOV EAX,EBX
00bd3942  8b10  MOV EDX,dword ptr [EAX]
00bd3944  ff5214  CALL dword ptr [EDX + 0x14]
00bd3947  85c0  TEST EAX,EAX
00bd3949  750c  JNZ 0x00bd3957
00bd394b  ba503abd00  MOV EDX,0xbd3a50
00bd3950  8bc3  MOV EAX,EBX
00bd3952  8b08  MOV ECX,dword ptr [EAX]
00bd3954  ff513c  CALL dword ptr [ECX + 0x3c]
00bd3957  33c0  XOR EAX,EAX
00bd3959  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bd395c  8bcb  MOV ECX,EBX
00bd395e  b201  MOV DL,0x1
00bd3960  a190594a00  MOV EAX,[0x004a5990]
00bd3965  e8f61a90ff  CALL 0x004d5460
00bd396a  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bd396d  33c0  XOR EAX,EAX
00bd396f  55  PUSH EBP
00bd3970  680f3abd00  PUSH 0xbd3a0f
00bd3975  64ff30  PUSH dword ptr FS:[EAX]
00bd3978  648920  MOV dword ptr FS:[EAX],ESP
00bd397b  eb59  JMP 0x00bd39d6
00bd397d  ff4304  INC dword ptr [EBX + 0x4]
00bd3980  8d55fc  LEA EDX,[EBP + -0x4]
00bd3983  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd3986  e8191b90ff  CALL 0x004d54a4
00bd398b  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bd398e  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00bd3994  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd399a  e84194aaff  CALL 0x0067cde0
00bd399f  8bf8  MOV EDI,EAX
00bd39a1  6a5e  PUSH 0x5e
00bd39a3  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bd39a6  b201  MOV DL,0x1
00bd39a8  a17cecbc00  MOV EAX,[0x00bcec7c]
00bd39ad  e8bebdffff  CALL 0x00bcf770
00bd39b2  8bf0  MOV ESI,EAX
00bd39b4  8d4dec  LEA ECX,[EBP + -0x14]
00bd39b7  ba02000000  MOV EDX,0x2
00bd39bc  8bc6  MOV EAX,ESI
00bd39be  e879bfffff  CALL 0x00bcf93c
00bd39c3  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
00bd39c6  8bc7  MOV EAX,EDI
00bd39c8  e80b8baaff  CALL 0x0067c4d8
00bd39cd  8bd6  MOV EDX,ESI
00bd39cf  8bc7  MOV EAX,EDI
00bd39d1  e80a8caaff  CALL 0x0067c5e0
00bd39d6  8b5df4  MOV EBX,dword ptr [EBP + -0xc]
00bd39d9  8b4308  MOV EAX,dword ptr [EBX + 0x8]
00bd39dc  8b10  MOV EDX,dword ptr [EAX]
00bd39de  ff5214  CALL dword ptr [EDX + 0x14]
00bd39e1  48  DEC EAX
00bd39e2  3b4304  CMP EAX,dword ptr [EBX + 0x4]
00bd39e5  0f9f45f3  SETG byte ptr [EBP + -0xd]
00bd39e9  807df300  CMP byte ptr [EBP + -0xd],0x0
00bd39ed  758e  JNZ 0x00bd397d
00bd39ef  33c0  XOR EAX,EAX
00bd39f1  5a  POP EDX
00bd39f2  59  POP ECX
00bd39f3  59  POP ECX
00bd39f4  648910  MOV dword ptr FS:[EAX],EDX
00bd39f7  68163abd00  PUSH 0xbd3a16
00bd39fc  837df400  CMP dword ptr [EBP + -0xc],0x0
00bd3a00  740a  JZ 0x00bd3a0c
00bd3a02  b201  MOV DL,0x1
00bd3a04  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bd3a07  8b08  MOV ECX,dword ptr [EAX]
00bd3a09  ff51fc  CALL dword ptr [ECX + -0x4]
00bd3a0c  58  POP EAX
00bd3a0d  ffe0  JMP EAX
