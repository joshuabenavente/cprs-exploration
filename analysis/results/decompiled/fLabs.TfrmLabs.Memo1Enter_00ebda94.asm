; Static instruction listing. Function bodies and indirect exception flow require review.
00ebda94  55  PUSH EBP
00ebda95  8bec  MOV EBP,ESP
00ebda97  6a00  PUSH 0x0
00ebda99  53  PUSH EBX
00ebda9a  8bd8  MOV EBX,EAX
00ebda9c  33c0  XOR EAX,EAX
00ebda9e  55  PUSH EBP
00ebda9f  68e8daeb00  PUSH 0xebdae8
00ebdaa4  64ff30  PUSH dword ptr FS:[EAX]
00ebdaa7  648920  MOV dword ptr FS:[EAX],ESP
00ebdaaa  e8ed86b1ff  CALL 0x009d619c
00ebdaaf  84c0  TEST AL,AL
00ebdab1  741d  JZ 0x00ebdad0
00ebdab3  8d55fc  LEA EDX,[EBP + -0x4]
00ebdab6  8b83ec040000  MOV EAX,dword ptr [EBX + 0x4ec]
00ebdabc  e8eb4b74ff  CALL 0x006026ac
00ebdac1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ebdac4  50  PUSH EAX
00ebdac5  e87a86b1ff  CALL 0x009d6144
00ebdaca  5a  POP EDX
00ebdacb  8b08  MOV ECX,dword ptr [EAX]
00ebdacd  ff5110  CALL dword ptr [ECX + 0x10]
00ebdad0  33c0  XOR EAX,EAX
00ebdad2  5a  POP EDX
00ebdad3  59  POP ECX
00ebdad4  59  POP ECX
00ebdad5  648910  MOV dword ptr FS:[EAX],EDX
00ebdad8  68efdaeb00  PUSH 0xebdaef
00ebdadd  8d45fc  LEA EAX,[EBP + -0x4]
00ebdae0  e8efd454ff  CALL 0x0040afd4
00ebdae5  58  POP EAX
00ebdae6  ffe0  JMP EAX
