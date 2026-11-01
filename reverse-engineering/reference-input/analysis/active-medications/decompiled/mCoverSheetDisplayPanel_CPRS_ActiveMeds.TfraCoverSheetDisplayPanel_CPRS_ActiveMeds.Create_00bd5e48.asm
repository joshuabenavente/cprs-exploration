; Static instruction listing. Function bodies and indirect exception flow require review.
00bd5e48  55  PUSH EBP
00bd5e49  8bec  MOV EBP,ESP
00bd5e4b  51  PUSH ECX
00bd5e4c  53  PUSH EBX
00bd5e4d  84d2  TEST DL,DL
00bd5e4f  7408  JZ 0x00bd5e59
00bd5e51  83c4f0  ADD ESP,-0x10
00bd5e54  e8533883ff  CALL 0x004096ac
00bd5e59  8855ff  MOV byte ptr [EBP + -0x1],DL
00bd5e5c  8bd8  MOV EBX,EAX
00bd5e5e  33d2  XOR EDX,EDX
00bd5e60  8bc3  MOV EAX,EBX
00bd5e62  e84dd6ffff  CALL 0x00bd34b4
00bd5e67  b9b85ebd00  MOV ECX,0xbd5eb8
00bd5e6c  33d2  XOR EDX,EDX
00bd5e6e  8bc3  MOV EAX,EBX
00bd5e70  e81fdaffff  CALL 0x00bd3894
00bd5e75  b9dc5ebd00  MOV ECX,0xbd5edc
00bd5e7a  ba01000000  MOV EDX,0x1
00bd5e7f  8bc3  MOV EAX,EBX
00bd5e81  e80edaffff  CALL 0x00bd3894
00bd5e86  8bc3  MOV EAX,EBX
00bd5e88  e813d8ffff  CALL 0x00bd36a0
00bd5e8d  8bc3  MOV EAX,EBX
00bd5e8f  807dff00  CMP byte ptr [EBP + -0x1],0x0
00bd5e93  740f  JZ 0x00bd5ea4
00bd5e95  e86a3883ff  CALL 0x00409704
00bd5e9a  648f0500000000  POP dword ptr FS:[0x0]
00bd5ea1  83c40c  ADD ESP,0xc
00bd5ea4  8bc3  MOV EAX,EBX
00bd5ea6  5b  POP EBX
00bd5ea7  59  POP ECX
00bd5ea8  5d  POP EBP
00bd5ea9  c3  RET
