; Static instruction listing. Function bodies and indirect exception flow require review.
00bd59e0  55  PUSH EBP
00bd59e1  8bec  MOV EBP,ESP
00bd59e3  53  PUSH EBX
00bd59e4  56  PUSH ESI
00bd59e5  8bf2  MOV ESI,EDX
00bd59e7  8bd8  MOV EBX,EAX
00bd59e9  8bc6  MOV EAX,ESI
00bd59eb  8b532c  MOV EDX,dword ptr [EBX + 0x2c]
00bd59ee  e8d15983ff  CALL 0x0040b3c4
00bd59f3  5e  POP ESI
00bd59f4  5b  POP EBX
00bd59f5  5d  POP EBP
00bd59f6  c3  RET
