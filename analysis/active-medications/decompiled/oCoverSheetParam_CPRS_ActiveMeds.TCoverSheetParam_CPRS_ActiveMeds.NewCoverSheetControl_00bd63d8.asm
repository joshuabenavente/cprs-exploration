; Static instruction listing. Function bodies and indirect exception flow require review.
00bd63d8  55  PUSH EBP
00bd63d9  8bec  MOV EBP,ESP
00bd63db  8bca  MOV ECX,EDX
00bd63dd  a1dc5abd00  MOV EAX,[0x00bd5adc]
00bd63e2  b201  MOV DL,0x1
00bd63e4  e85ffaffff  CALL 0x00bd5e48
00bd63e9  5d  POP EBP
00bd63ea  c3  RET
