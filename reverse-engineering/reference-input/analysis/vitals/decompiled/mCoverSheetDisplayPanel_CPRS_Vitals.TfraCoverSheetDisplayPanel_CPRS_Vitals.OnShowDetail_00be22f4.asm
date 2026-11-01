; Static instruction listing. Function bodies and indirect exception flow require review.
00be22f4  55  PUSH EBP
00be22f5  8bec  MOV EBP,ESP
00be22f7  53  PUSH EBX
00be22f8  8bd8  MOV EBX,EAX
00be22fa  33c0  XOR EAX,EAX
00be22fc  55  PUSH EBP
00be22fd  682823be00  PUSH 0xbe2328
00be2302  64ff30  PUSH dword ptr FS:[EAX]
00be2305  648920  MOV dword ptr FS:[EAX],ESP
00be2308  8b934c030000  MOV EDX,dword ptr [EBX + 0x34c]
00be230e  8bc3  MOV EAX,EBX
00be2310  8b08  MOV ECX,dword ptr [EAX]
00be2312  ff9138020000  CALL dword ptr [ECX + 0x238]
00be2318  33c0  XOR EAX,EAX
00be231a  5a  POP EDX
00be231b  59  POP ECX
00be231c  59  POP ECX
00be231d  648910  MOV dword ptr FS:[EAX],EDX
00be2320  682f23be00  PUSH 0xbe232f
00be2325  58  POP EAX
00be2326  ffe0  JMP EAX
