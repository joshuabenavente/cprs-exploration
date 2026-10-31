; Static instruction listing. Function bodies and indirect exception flow require review.
00bd4180  55  PUSH EBP
00bd4181  8bec  MOV EBP,ESP
00bd4183  53  PUSH EBX
00bd4184  56  PUSH ESI
00bd4185  8bf2  MOV ESI,EDX
00bd4187  8bd8  MOV EBX,EAX
00bd4189  6683390d  CMP word ptr [ECX],0xd
00bd418d  7406  JZ 0x00bd4195
00bd418f  66833920  CMP word ptr [ECX],0x20
00bd4193  7518  JNZ 0x00bd41ad
00bd4195  6a00  PUSH 0x0
00bd4197  8b834c030000  MOV EAX,dword ptr [EBX + 0x34c]
00bd419d  e8c2e7aaff  CALL 0x00682964
00bd41a2  8bc8  MOV ECX,EAX
00bd41a4  8bd6  MOV EDX,ESI
00bd41a6  8bc3  MOV EAX,EBX
00bd41a8  e807000000  CALL 0x00bd41b4
00bd41ad  5e  POP ESI
00bd41ae  5b  POP EBX
00bd41af  5d  POP EBP
00bd41b0  c20400  RET 0x4
