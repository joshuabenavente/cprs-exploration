; Static instruction listing. Function bodies and indirect exception flow require review.
009ad900  55  PUSH EBP
009ad901  8bec  MOV EBP,ESP
009ad903  56  PUSH ESI
009ad904  8bf0  MOV ESI,EAX
009ad906  8b4514  MOV EAX,dword ptr [EBP + 0x14]
009ad909  50  PUSH EAX
009ad90a  0fb64508  MOVZX EAX,byte ptr [EBP + 0x8]
009ad90e  50  PUSH EAX
009ad90f  ff7510  PUSH dword ptr [EBP + 0x10]
009ad912  ff750c  PUSH dword ptr [EBP + 0xc]
009ad915  8bc6  MOV EAX,ESI
009ad917  e864ffffff  CALL 0x009ad880
009ad91c  5e  POP ESI
009ad91d  5d  POP EBP
009ad91e  c21000  RET 0x10
