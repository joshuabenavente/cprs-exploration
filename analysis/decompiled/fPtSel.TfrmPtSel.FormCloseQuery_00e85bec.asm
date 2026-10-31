; Static instruction listing. Function bodies and indirect exception flow require review.
00e85bec  55  PUSH EBP
00e85bed  8bec  MOV EBP,ESP
00e85bef  80b82e05000000  CMP byte ptr [EAX + 0x52e],0x0
00e85bf6  750c  JNZ 0x00e85c04
00e85bf8  c6802e05000001  MOV byte ptr [EAX + 0x52e],0x1
00e85bff  e828d9ffff  CALL 0x00e8352c
00e85c04  5d  POP EBP
00e85c05  c3  RET
