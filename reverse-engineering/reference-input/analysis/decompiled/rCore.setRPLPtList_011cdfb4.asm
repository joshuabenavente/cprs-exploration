; Static instruction listing. Function bodies and indirect exception flow require review.
011cdfb4  55  PUSH EBP
011cdfb5  8bec  MOV EBP,ESP
011cdfb7  83c4e4  ADD ESP,-0x1c
011cdfba  53  PUSH EBX
011cdfbb  56  PUSH ESI
011cdfbc  8bf1  MOV ESI,ECX
011cdfbe  8955fc  MOV dword ptr [EBP + -0x4],EDX
011cdfc1  8bd8  MOV EBX,EAX
011cdfc3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdfc6  e8fdd023ff  CALL 0x0040b0c8
011cdfcb  33c0  XOR EAX,EAX
011cdfcd  55  PUSH EBP
011cdfce  6831e01c01  PUSH 0x11ce031
011cdfd3  64ff30  PUSH dword ptr FS:[EAX]
011cdfd6  648920  MOV dword ptr FS:[EAX],ESP
011cdfd9  53  PUSH EBX
011cdfda  6a00  PUSH 0x0
011cdfdc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cdfdf  8945e4  MOV dword ptr [EBP + -0x1c],EAX
011cdfe2  c645e811  MOV byte ptr [EBP + -0x18],0x11
011cdfe6  8975ec  MOV dword ptr [EBP + -0x14],ESI
011cdfe9  c645f011  MOV byte ptr [EBP + -0x10],0x11
011cdfed  8b4508  MOV EAX,dword ptr [EBP + 0x8]
011cdff0  8945f4  MOV dword ptr [EBP + -0xc],EAX
011cdff3  c645f800  MOV byte ptr [EBP + -0x8],0x0
011cdff7  8d55e4  LEA EDX,[EBP + -0x1c]
011cdffa  b902000000  MOV ECX,0x2
011cdfff  b850e01c01  MOV EAX,0x11ce050
011ce004  e877fa7dff  CALL 0x009ada80
011ce009  8bc3  MOV EAX,EBX
011ce00b  e8e84c7eff  CALL 0x009b2cf8
011ce010  8bc3  MOV EAX,EBX
011ce012  8b10  MOV EDX,dword ptr [EAX]
011ce014  ff5214  CALL dword ptr [EDX + 0x14]
011ce017  8bd8  MOV EBX,EAX
011ce019  33c0  XOR EAX,EAX
011ce01b  5a  POP EDX
011ce01c  59  POP ECX
011ce01d  59  POP ECX
011ce01e  648910  MOV dword ptr FS:[EAX],EDX
011ce021  6838e01c01  PUSH 0x11ce038
011ce026  8d45fc  LEA EAX,[EBP + -0x4]
011ce029  e8a6cf23ff  CALL 0x0040afd4
011ce02e  58  POP EAX
011ce02f  ffe0  JMP EAX
