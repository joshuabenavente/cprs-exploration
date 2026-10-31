; Static instruction listing. Function bodies and indirect exception flow require review.
00bda47c  55  PUSH EBP
00bda47d  8bec  MOV EBP,ESP
00bda47f  51  PUSH ECX
00bda480  53  PUSH EBX
00bda481  84d2  TEST DL,DL
00bda483  7408  JZ 0x00bda48d
00bda485  83c4f0  ADD ESP,-0x10
00bda488  e81ff282ff  CALL 0x004096ac
00bda48d  8855ff  MOV byte ptr [EBP + -0x1],DL
00bda490  8bd8  MOV EBX,EAX
00bda492  33d2  XOR EDX,EDX
00bda494  8bc3  MOV EAX,EBX
00bda496  e81990ffff  CALL 0x00bd34b4
00bda49b  b9dca4bd00  MOV ECX,0xbda4dc
00bda4a0  33d2  XOR EDX,EDX
00bda4a2  8bc3  MOV EAX,EBX
00bda4a4  e8eb93ffff  CALL 0x00bd3894
00bda4a9  8bc3  MOV EAX,EBX
00bda4ab  e8f091ffff  CALL 0x00bd36a0
00bda4b0  8bc3  MOV EAX,EBX
00bda4b2  807dff00  CMP byte ptr [EBP + -0x1],0x0
00bda4b6  740f  JZ 0x00bda4c7
00bda4b8  e847f282ff  CALL 0x00409704
00bda4bd  648f0500000000  POP dword ptr FS:[0x0]
00bda4c4  83c40c  ADD ESP,0xc
00bda4c7  8bc3  MOV EAX,EBX
00bda4c9  5b  POP EBX
00bda4ca  59  POP ECX
00bda4cb  5d  POP EBP
00bda4cc  c3  RET
