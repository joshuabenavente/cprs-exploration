; Static instruction listing. Function bodies and indirect exception flow require review.
00bd43c4  55  PUSH EBP
00bd43c5  8bec  MOV EBP,ESP
00bd43c7  53  PUSH EBX
00bd43c8  56  PUSH ESI
00bd43c9  8bf1  MOV ESI,ECX
00bd43cb  8bd8  MOV EBX,EAX
00bd43cd  807d0800  CMP byte ptr [EBP + 0x8],0x0
00bd43d1  740d  JZ 0x00bd43e0
00bd43d3  8bc6  MOV EAX,ESI
00bd43d5  e82687aaff  CALL 0x0067cb00
00bd43da  898360030000  MOV dword ptr [EBX + 0x360],EAX
00bd43e0  5e  POP ESI
00bd43e1  5b  POP EBX
00bd43e2  5d  POP EBP
00bd43e3  c20400  RET 0x4
