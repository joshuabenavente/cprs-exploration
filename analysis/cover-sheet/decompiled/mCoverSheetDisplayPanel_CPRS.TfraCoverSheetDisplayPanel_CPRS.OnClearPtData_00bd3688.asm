; Static instruction listing. Function bodies and indirect exception flow require review.
00bd3688  55  PUSH EBP
00bd3689  8bec  MOV EBP,ESP
00bd368b  8b904c030000  MOV EDX,dword ptr [EAX + 0x34c]
00bd3691  8b08  MOV ECX,dword ptr [EAX]
00bd3693  ff911c020000  CALL dword ptr [ECX + 0x21c]
00bd3699  5d  POP EBP
00bd369a  c3  RET
