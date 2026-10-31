; Static instruction listing. Function bodies and indirect exception flow require review.
0117ea50  55  PUSH EBP
0117ea51  8bec  MOV EBP,ESP
0117ea53  83c4d0  ADD ESP,-0x30
0117ea56  53  PUSH EBX
0117ea57  33db  XOR EBX,EBX
0117ea59  895dd4  MOV dword ptr [EBP + -0x2c],EBX
0117ea5c  895dd0  MOV dword ptr [EBP + -0x30],EBX
0117ea5f  895de8  MOV dword ptr [EBP + -0x18],EBX
0117ea62  895dec  MOV dword ptr [EBP + -0x14],EBX
0117ea65  895df0  MOV dword ptr [EBP + -0x10],EBX
0117ea68  894df4  MOV dword ptr [EBP + -0xc],ECX
0117ea6b  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117ea6e  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117ea71  33c0  XOR EAX,EAX
0117ea73  55  PUSH EBP
0117ea74  686ced1701  PUSH 0x117ed6c
0117ea79  64ff30  PUSH dword ptr FS:[EAX]
0117ea7c  648920  MOV dword ptr FS:[EAX],ESP
0117ea7f  837df800  CMP dword ptr [EBP + -0x8],0x0
0117ea83  0f84b9020000  JZ 0x0117ed42
0117ea89  8b450c  MOV EAX,dword ptr [EBP + 0xc]
0117ea8c  83f80a  CMP EAX,0xa
0117ea8f  0f87ad020000  JA 0x0117ed42
0117ea95  ff24859cea1701  JMP dword ptr [EAX*0x4 + 0x117ea9c]
0117ed42  33c0  XOR EAX,EAX
0117ed44  5a  POP EDX
0117ed45  59  POP ECX
0117ed46  59  POP ECX
0117ed47  648910  MOV dword ptr FS:[EAX],EDX
0117ed4a  6873ed1701  PUSH 0x117ed73
0117ed4f  8d45d0  LEA EAX,[EBP + -0x30]
0117ed52  ba02000000  MOV EDX,0x2
0117ed57  e8d8c228ff  CALL 0x0040b034
0117ed5c  8d45e8  LEA EAX,[EBP + -0x18]
0117ed5f  ba03000000  MOV EDX,0x3
0117ed64  e8cbc228ff  CALL 0x0040b034
0117ed69  58  POP EAX
0117ed6a  ffe0  JMP EAX
