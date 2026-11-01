; Static instruction listing. Function bodies and indirect exception flow require review.
00fd92b4  55  PUSH EBP
00fd92b5  8bec  MOV EBP,ESP
00fd92b7  53  PUSH EBX
00fd92b8  56  PUSH ESI
00fd92b9  84d2  TEST DL,DL
00fd92bb  7408  JZ 0x00fd92c5
00fd92bd  83c4f0  ADD ESP,-0x10
00fd92c0  e8e70343ff  CALL 0x004096ac
00fd92c5  8bda  MOV EBX,EDX
00fd92c7  8bf0  MOV ESI,EAX
00fd92c9  33d2  XOR EDX,EDX
00fd92cb  8bc6  MOV EAX,ESI
00fd92cd  e8c6cc1e00  CALL 0x011c5f98
00fd92d2  33c0  XOR EAX,EAX
00fd92d4  898688040000  MOV dword ptr [ESI + 0x488],EAX
00fd92da  33c0  XOR EAX,EAX
00fd92dc  898684040000  MOV dword ptr [ESI + 0x484],EAX
00fd92e2  33c0  XOR EAX,EAX
00fd92e4  89868c040000  MOV dword ptr [ESI + 0x48c],EAX
00fd92ea  8bc6  MOV EAX,ESI
00fd92ec  84db  TEST BL,BL
00fd92ee  740f  JZ 0x00fd92ff
00fd92f0  e80f0443ff  CALL 0x00409704
00fd92f5  648f0500000000  POP dword ptr FS:[0x0]
00fd92fc  83c40c  ADD ESP,0xc
00fd92ff  8bc6  MOV EAX,ESI
00fd9301  5e  POP ESI
00fd9302  5b  POP EBX
00fd9303  5d  POP EBP
00fd9304  c3  RET
