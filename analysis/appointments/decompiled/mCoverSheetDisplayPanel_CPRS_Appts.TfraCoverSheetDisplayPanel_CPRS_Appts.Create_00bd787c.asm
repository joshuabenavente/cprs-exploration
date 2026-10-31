; Static instruction listing. Function bodies and indirect exception flow require review.
00bd787c  55  PUSH EBP
00bd787d  8bec  MOV EBP,ESP
00bd787f  51  PUSH ECX
00bd7880  53  PUSH EBX
00bd7881  84d2  TEST DL,DL
00bd7883  7408  JZ 0x00bd788d
00bd7885  83c4f0  ADD ESP,-0x10
00bd7888  e81f1e83ff  CALL 0x004096ac
00bd788d  8855ff  MOV byte ptr [EBP + -0x1],DL
00bd7890  8bd8  MOV EBX,EAX
00bd7892  33d2  XOR EDX,EDX
00bd7894  8bc3  MOV EAX,EBX
00bd7896  e819bcffff  CALL 0x00bd34b4
00bd789b  b9fc78bd00  MOV ECX,0xbd78fc
00bd78a0  33d2  XOR EDX,EDX
00bd78a2  8bc3  MOV EAX,EBX
00bd78a4  e8ebbfffff  CALL 0x00bd3894
00bd78a9  b91c79bd00  MOV ECX,0xbd791c
00bd78ae  ba01000000  MOV EDX,0x1
00bd78b3  8bc3  MOV EAX,EBX
00bd78b5  e8dabfffff  CALL 0x00bd3894
00bd78ba  b93c79bd00  MOV ECX,0xbd793c
00bd78bf  ba02000000  MOV EDX,0x2
00bd78c4  8bc3  MOV EAX,EBX
00bd78c6  e8c9bfffff  CALL 0x00bd3894
00bd78cb  8bc3  MOV EAX,EBX
00bd78cd  e8cebdffff  CALL 0x00bd36a0
00bd78d2  8bc3  MOV EAX,EBX
00bd78d4  807dff00  CMP byte ptr [EBP + -0x1],0x0
00bd78d8  740f  JZ 0x00bd78e9
00bd78da  e8251e83ff  CALL 0x00409704
00bd78df  648f0500000000  POP dword ptr FS:[0x0]
00bd78e6  83c40c  ADD ESP,0xc
00bd78e9  8bc3  MOV EAX,EBX
00bd78eb  5b  POP EBX
00bd78ec  59  POP ECX
00bd78ed  5d  POP EBP
00bd78ee  c3  RET
