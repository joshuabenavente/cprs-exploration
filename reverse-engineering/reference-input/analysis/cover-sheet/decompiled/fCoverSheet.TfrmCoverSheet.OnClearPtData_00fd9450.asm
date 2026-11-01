; Static instruction listing. Function bodies and indirect exception flow require review.
00fd9450  55  PUSH EBP
00fd9451  8bec  MOV EBP,ESP
00fd9453  6a00  PUSH 0x0
00fd9455  53  PUSH EBX
00fd9456  56  PUSH ESI
00fd9457  8bf2  MOV ESI,EDX
00fd9459  8bd8  MOV EBX,EAX
00fd945b  33c0  XOR EAX,EAX
00fd945d  55  PUSH EBP
00fd945e  689b94fd00  PUSH 0xfd949b
00fd9463  64ff30  PUSH dword ptr FS:[EAX]
00fd9466  648920  MOV dword ptr FS:[EAX],ESP
00fd9469  8d45fc  LEA EAX,[EBP + -0x4]
00fd946c  e8976cc1ff  CALL 0x00bf0108
00fd9471  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fd9474  8bd6  MOV EDX,ESI
00fd9476  8b08  MOV ECX,dword ptr [EAX]
00fd9478  ff513c  CALL dword ptr [ECX + 0x3c]
00fd947b  33c0  XOR EAX,EAX
00fd947d  898388040000  MOV dword ptr [EBX + 0x488],EAX
00fd9483  33c0  XOR EAX,EAX
00fd9485  5a  POP EDX
00fd9486  59  POP ECX
00fd9487  59  POP ECX
00fd9488  648910  MOV dword ptr FS:[EAX],EDX
00fd948b  68a294fd00  PUSH 0xfd94a2
00fd9490  8d45fc  LEA EAX,[EBP + -0x4]
00fd9493  e8a07243ff  CALL 0x00410738
00fd9498  58  POP EAX
00fd9499  ffe0  JMP EAX
