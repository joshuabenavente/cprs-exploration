; Static instruction listing. Function bodies and indirect exception flow require review.
00c86c80  55  PUSH EBP
00c86c81  8bec  MOV EBP,ESP
00c86c83  83c4c8  ADD ESP,-0x38
00c86c86  53  PUSH EBX
00c86c87  56  PUSH ESI
00c86c88  57  PUSH EDI
00c86c89  8bf9  MOV EDI,ECX
00c86c8b  8bf2  MOV ESI,EDX
00c86c8d  8bd8  MOV EBX,EAX
00c86c8f  53  PUSH EBX
00c86c90  6a00  PUSH 0x0
00c86c92  8975e0  MOV dword ptr [EBP + -0x20],ESI
00c86c95  c645e411  MOV byte ptr [EBP + -0x1c],0x11
00c86c99  dd4510  FLD double ptr [EBP + 0x10]
00c86c9c  db7dd4  FSTP extended double ptr [EBP + -0x2c]
00c86c9f  9b  WAIT
00c86ca0  8d45d4  LEA EAX,[EBP + -0x2c]
00c86ca3  8945e8  MOV dword ptr [EBP + -0x18],EAX
00c86ca6  c645ec03  MOV byte ptr [EBP + -0x14],0x3
00c86caa  dd4508  FLD double ptr [EBP + 0x8]
00c86cad  db7dc8  FSTP extended double ptr [EBP + -0x38]
00c86cb0  9b  WAIT
00c86cb1  8d45c8  LEA EAX,[EBP + -0x38]
00c86cb4  8945f0  MOV dword ptr [EBP + -0x10],EAX
00c86cb7  c645f403  MOV byte ptr [EBP + -0xc],0x3
00c86cbb  897df8  MOV dword ptr [EBP + -0x8],EDI
00c86cbe  c645fc07  MOV byte ptr [EBP + -0x4],0x7
00c86cc2  8d55e0  LEA EDX,[EBP + -0x20]
00c86cc5  b903000000  MOV ECX,0x3
00c86cca  b8f06cc800  MOV EAX,0xc86cf0
00c86ccf  e8ac6dd2ff  CALL 0x009ada80
00c86cd4  8bc3  MOV EAX,EBX
00c86cd6  8b10  MOV EDX,dword ptr [EAX]
00c86cd8  ff5214  CALL dword ptr [EDX + 0x14]
00c86cdb  5f  POP EDI
00c86cdc  5e  POP ESI
00c86cdd  5b  POP EBX
00c86cde  8be5  MOV ESP,EBP
00c86ce0  5d  POP EBP
00c86ce1  c21000  RET 0x10
