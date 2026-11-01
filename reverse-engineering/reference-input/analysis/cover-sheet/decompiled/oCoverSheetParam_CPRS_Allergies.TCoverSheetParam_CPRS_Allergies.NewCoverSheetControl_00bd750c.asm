; Static instruction listing. Function bodies and indirect exception flow require review.
00bd750c  55  PUSH EBP
00bd750d  8bec  MOV EBP,ESP
00bd750f  8bca  MOV ECX,EDX
00bd7511  a1ec63bd00  MOV EAX,[0x00bd63ec]
00bd7516  b201  MOV DL,0x1
00bd7518  e8dff2ffff  CALL 0x00bd67fc
00bd751d  5d  POP EBP
00bd751e  c3  RET
