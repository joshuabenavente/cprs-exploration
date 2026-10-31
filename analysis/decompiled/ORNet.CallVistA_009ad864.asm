; Static instruction listing. Function bodies and indirect exception flow require review.
009ad864  55  PUSH EBP
009ad865  8bec  MOV EBP,ESP
009ad867  53  PUSH EBX
009ad868  8b5d10  MOV EBX,dword ptr [EBP + 0x10]
009ad86b  53  PUSH EBX
009ad86c  0fb65d08  MOVZX EBX,byte ptr [EBP + 0x8]
009ad870  53  PUSH EBX
009ad871  8b5d0c  MOV EBX,dword ptr [EBP + 0xc]
009ad874  53  PUSH EBX
009ad875  e872ffffff  CALL 0x009ad7ec
009ad87a  5b  POP EBX
009ad87b  5d  POP EBP
009ad87c  c20c00  RET 0xc
