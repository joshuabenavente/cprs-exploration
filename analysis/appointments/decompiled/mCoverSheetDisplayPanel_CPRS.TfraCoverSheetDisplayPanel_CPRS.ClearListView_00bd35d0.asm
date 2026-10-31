; Static instruction listing. Function bodies and indirect exception flow require review.
00bd35d0  55  PUSH EBP
00bd35d1  8bec  MOV EBP,ESP
00bd35d3  51  PUSH ECX
00bd35d4  53  PUSH EBX
00bd35d5  56  PUSH ESI
00bd35d6  8955fc  MOV dword ptr [EBP + -0x4],EDX
00bd35d9  8bd8  MOV EBX,EAX
00bd35db  83bb6803000000  CMP dword ptr [EBX + 0x368],0x0
00bd35e2  754d  JNZ 0x00bd3631
00bd35e4  8bc3  MOV EAX,EBX
00bd35e6  e831e9e2ff  CALL 0x00a01f1c
00bd35eb  8bf0  MOV ESI,EAX
00bd35ed  89b368030000  MOV dword ptr [EBX + 0x368],ESI
00bd35f3  85f6  TEST ESI,ESI
00bd35f5  743a  JZ 0x00bd3631
00bd35f7  b201  MOV DL,0x1
00bd35f9  a14418a000  MOV EAX,[0x00a01844]
00bd35fe  e845eae2ff  CALL 0x00a02048
00bd3603  8bf0  MOV ESI,EAX
00bd3605  89b36c030000  MOV dword ptr [EBX + 0x36c],ESI
00bd360b  8bce  MOV ECX,ESI
00bd360d  8b934c030000  MOV EDX,dword ptr [EBX + 0x34c]
00bd3613  8b8368030000  MOV EAX,dword ptr [EBX + 0x368]
00bd3619  e80a90e2ff  CALL 0x009fc628
00bd361e  8b934c030000  MOV EDX,dword ptr [EBX + 0x34c]
00bd3624  8b8368030000  MOV EAX,dword ptr [EBX + 0x368]
00bd362a  33c9  XOR ECX,ECX
00bd362c  e81790e2ff  CALL 0x009fc648
00bd3631  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd3634  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd363a  e8359aaaff  CALL 0x0067d074
00bd363f  33c0  XOR EAX,EAX
00bd3641  55  PUSH EBP
00bd3642  687936bd00  PUSH 0xbd3679
00bd3647  64ff30  PUSH dword ptr FS:[EAX]
00bd364a  648920  MOV dword ptr FS:[EAX],ESP
00bd364d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd3650  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd3656  e88599aaff  CALL 0x0067cfe0
00bd365b  33c0  XOR EAX,EAX
00bd365d  5a  POP EDX
00bd365e  59  POP ECX
00bd365f  59  POP ECX
00bd3660  648910  MOV dword ptr FS:[EAX],EDX
00bd3663  688036bd00  PUSH 0xbd3680
00bd3668  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd366b  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00bd3671  e8ee9baaff  CALL 0x0067d264
00bd3676  58  POP EAX
00bd3677  ffe0  JMP EAX
