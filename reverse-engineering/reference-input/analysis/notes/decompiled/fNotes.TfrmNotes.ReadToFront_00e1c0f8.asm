; Static instruction listing. Function bodies and indirect exception flow require review.
00e1c0f8  55  PUSH EBP
00e1c0f9  8bec  MOV EBP,ESP
00e1c0fb  53  PUSH EBX
00e1c0fc  8bd8  MOV EBX,EAX
00e1c0fe  8b83d8040000  MOV EAX,dword ptr [EBX + 0x4d8]
00e1c104  e873687eff  CALL 0x0060297c
00e1c109  8b8360070000  MOV EAX,dword ptr [EBX + 0x760]
00e1c10f  e868687eff  CALL 0x0060297c
00e1c114  8b8348070000  MOV EAX,dword ptr [EBX + 0x748]
00e1c11a  e85d687eff  CALL 0x0060297c
00e1c11f  5b  POP EBX
00e1c120  5d  POP EBP
00e1c121  c3  RET
