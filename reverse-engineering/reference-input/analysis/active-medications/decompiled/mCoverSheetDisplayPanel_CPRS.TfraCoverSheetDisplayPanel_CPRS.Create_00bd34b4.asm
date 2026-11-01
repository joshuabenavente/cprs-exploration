; Static instruction listing. Function bodies and indirect exception flow require review.
00bd34b4  55  PUSH EBP
00bd34b5  8bec  MOV EBP,ESP
00bd34b7  51  PUSH ECX
00bd34b8  53  PUSH EBX
00bd34b9  56  PUSH ESI
00bd34ba  84d2  TEST DL,DL
00bd34bc  7408  JZ 0x00bd34c6
00bd34be  83c4f0  ADD ESP,-0x10
00bd34c1  e8e66183ff  CALL 0x004096ac
00bd34c6  8855ff  MOV byte ptr [EBP + -0x1],DL
00bd34c9  8bd8  MOV EBX,EAX
00bd34cb  33d2  XOR EDX,EDX
00bd34cd  8bc3  MOV EAX,EBX
00bd34cf  e8c8f5ffff  CALL 0x00bd2a9c
00bd34d4  c6835003000000  MOV byte ptr [EBX + 0x350],0x0
00bd34db  8bb34c030000  MOV ESI,dword ptr [EBX + 0x34c]
00bd34e1  33d2  XOR EDX,EDX
00bd34e3  8bc6  MOV EAX,ESI
00bd34e5  e83ac9aaff  CALL 0x0067fe24
00bd34ea  b203  MOV DL,0x3
00bd34ec  8bc6  MOV EAX,ESI
00bd34ee  8b08  MOV ECX,dword ptr [EAX]
00bd34f0  ff91d4010000  CALL dword ptr [ECX + 0x1d4]
00bd34f6  b201  MOV DL,0x1
00bd34f8  8bc6  MOV EAX,ESI
00bd34fa  e879cdaaff  CALL 0x00680278
00bd34ff  b201  MOV DL,0x1
00bd3501  8bc6  MOV EAX,ESI
00bd3503  e844c8aaff  CALL 0x0067fd4c
00bd3508  8b860c030000  MOV EAX,dword ptr [ESI + 0x30c]
00bd350e  e80d82aaff  CALL 0x0067b720
00bd3513  b201  MOV DL,0x1
00bd3515  e8a680aaff  CALL 0x0067b5c0
00bd351a  b201  MOV DL,0x1
00bd351c  a100734a00  MOV EAX,[0x004a7300]
00bd3521  e8ce4c90ff  CALL 0x004d81f4
00bd3526  89835c030000  MOV dword ptr [EBX + 0x35c],EAX
00bd352c  c78360030000ffffffff  MOV dword ptr [EBX + 0x360],0xffffffff
00bd3536  c6836403000001  MOV byte ptr [EBX + 0x364],0x1
00bd353d  8b15a0832301  MOV EDX,dword ptr [0x012383a0]
00bd3543  8b8348030000  MOV EAX,dword ptr [EBX + 0x348]
00bd3549  e8ce50aeff  CALL 0x006b861c
00bd354e  8b8348030000  MOV EAX,dword ptr [EBX + 0x348]
00bd3554  33d2  XOR EDX,EDX
00bd3556  e8b150aeff  CALL 0x006b860c
00bd355b  8bc3  MOV EAX,EBX
00bd355d  807dff00  CMP byte ptr [EBP + -0x1],0x0
00bd3561  740f  JZ 0x00bd3572
00bd3563  e89c6183ff  CALL 0x00409704
00bd3568  648f0500000000  POP dword ptr FS:[0x0]
00bd356f  83c40c  ADD ESP,0xc
00bd3572  8bc3  MOV EAX,EBX
00bd3574  5e  POP ESI
00bd3575  5b  POP EBX
00bd3576  59  POP ECX
00bd3577  5d  POP EBP
00bd3578  c3  RET
