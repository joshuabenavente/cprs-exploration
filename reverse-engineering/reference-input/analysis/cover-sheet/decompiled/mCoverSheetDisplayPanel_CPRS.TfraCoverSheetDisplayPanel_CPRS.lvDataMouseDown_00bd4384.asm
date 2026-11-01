; Static instruction listing. Function bodies and indirect exception flow require review.
00bd4384  55  PUSH EBP
00bd4385  8bec  MOV EBP,ESP
00bd4387  51  PUSH ECX
00bd4388  53  PUSH EBX
00bd4389  56  PUSH ESI
00bd438a  884dff  MOV byte ptr [EBP + -0x1],CL
00bd438d  8bf2  MOV ESI,EDX
00bd438f  8bd8  MOV EBX,EAX
00bd4391  80bb6403000000  CMP byte ptr [EBX + 0x364],0x0
00bd4398  7421  JZ 0x00bd43bb
00bd439a  8b834c030000  MOV EAX,dword ptr [EBX + 0x34c]
00bd43a0  8b4d08  MOV ECX,dword ptr [EBP + 0x8]
00bd43a3  8b550c  MOV EDX,dword ptr [EBP + 0xc]
00bd43a6  e869e8aaff  CALL 0x00682c14
00bd43ab  0fb655ff  MOVZX EDX,byte ptr [EBP + -0x1]
00bd43af  52  PUSH EDX
00bd43b0  8bc8  MOV ECX,EAX
00bd43b2  8bd6  MOV EDX,ESI
00bd43b4  8bc3  MOV EAX,EBX
00bd43b6  e8f9fdffff  CALL 0x00bd41b4
00bd43bb  5e  POP ESI
00bd43bc  5b  POP EBX
00bd43bd  59  POP ECX
00bd43be  5d  POP EBP
00bd43bf  c20c00  RET 0xc
