; Static instruction listing. Function bodies and indirect exception flow require review.
00bd7f30  55  PUSH EBP
00bd7f31  8bec  MOV EBP,ESP
00bd7f33  8bca  MOV ECX,EDX
00bd7f35  a12075bd00  MOV EAX,[0x00bd7520]
00bd7f3a  b201  MOV DL,0x1
00bd7f3c  e83bf9ffff  CALL 0x00bd787c
00bd7f41  5d  POP EBP
00bd7f42  c3  RET
