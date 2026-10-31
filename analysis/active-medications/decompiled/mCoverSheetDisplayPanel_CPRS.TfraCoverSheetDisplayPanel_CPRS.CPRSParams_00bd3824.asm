; Static instruction listing. Function bodies and indirect exception flow require review.
00bd3824  55  PUSH EBP
00bd3825  8bec  MOV EBP,ESP
00bd3827  6a00  PUSH 0x0
00bd3829  53  PUSH EBX
00bd382a  56  PUSH ESI
00bd382b  8bf2  MOV ESI,EDX
00bd382d  8bd8  MOV EBX,EAX
00bd382f  33c0  XOR EAX,EAX
00bd3831  55  PUSH EBP
00bd3832  687738bd00  PUSH 0xbd3877
00bd3837  64ff30  PUSH dword ptr FS:[EAX]
00bd383a  648920  MOV dword ptr FS:[EAX],ESP
00bd383d  8bc6  MOV EAX,ESI
00bd383f  e8f4ce83ff  CALL 0x00410738
00bd3844  50  PUSH EAX
00bd3845  688438bd00  PUSH 0xbd3884
00bd384a  8d55fc  LEA EDX,[EBP + -0x4]
00bd384d  8bc3  MOV EAX,EBX
00bd384f  8b08  MOV ECX,dword ptr [EAX]
00bd3851  ff91ec010000  CALL dword ptr [ECX + 0x1ec]
00bd3857  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd385a  50  PUSH EAX
00bd385b  8b00  MOV EAX,dword ptr [EAX]
00bd385d  ff10  CALL dword ptr [EAX]
00bd385f  33c0  XOR EAX,EAX
00bd3861  5a  POP EDX
00bd3862  59  POP ECX
00bd3863  59  POP ECX
00bd3864  648910  MOV dword ptr FS:[EAX],EDX
00bd3867  687e38bd00  PUSH 0xbd387e
00bd386c  8d45fc  LEA EAX,[EBP + -0x4]
00bd386f  e8c4ce83ff  CALL 0x00410738
00bd3874  58  POP EAX
00bd3875  ffe0  JMP EAX
