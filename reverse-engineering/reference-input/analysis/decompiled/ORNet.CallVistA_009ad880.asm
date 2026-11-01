; Static instruction listing. Function bodies and indirect exception flow require review.
009ad880  55  PUSH EBP
009ad881  8bec  MOV EBP,ESP
009ad883  6a00  PUSH 0x0
009ad885  53  PUSH EBX
009ad886  56  PUSH ESI
009ad887  57  PUSH EDI
009ad888  8bf9  MOV EDI,ECX
009ad88a  8bf2  MOV ESI,EDX
009ad88c  8bd8  MOV EBX,EAX
009ad88e  33c0  XOR EAX,EAX
009ad890  55  PUSH EBP
009ad891  68ecd89a00  PUSH 0x9ad8ec
009ad896  64ff30  PUSH dword ptr FS:[EAX]
009ad899  648920  MOV dword ptr FS:[EAX],ESP
009ad89c  8d45fc  LEA EAX,[EBP + -0x4]
009ad89f  50  PUSH EAX
009ad8a0  0fb64510  MOVZX EAX,byte ptr [EBP + 0x10]
009ad8a4  50  PUSH EAX
009ad8a5  6a00  PUSH 0x0
009ad8a7  8bd6  MOV EDX,ESI
009ad8a9  8bcf  MOV ECX,EDI
009ad8ab  8bc3  MOV EAX,EBX
009ad8ad  e872000000  CALL 0x009ad924
009ad8b2  84c0  TEST AL,AL
009ad8b4  741c  JZ 0x009ad8d2
009ad8b6  dd4508  FLD double ptr [EBP + 0x8]
009ad8b9  83c4f4  ADD ESP,-0xc
009ad8bc  db3c24  FSTP extended double ptr [ESP]
009ad8bf  9b  WAIT
009ad8c0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
009ad8c3  e868420000  CALL 0x009b1b30
009ad8c8  8b4514  MOV EAX,dword ptr [EBP + 0x14]
009ad8cb  dd18  FSTP double ptr [EAX]
009ad8cd  9b  WAIT
009ad8ce  b301  MOV BL,0x1
009ad8d0  eb02  JMP 0x009ad8d4
009ad8d2  33db  XOR EBX,EBX
009ad8d4  33c0  XOR EAX,EAX
009ad8d6  5a  POP EDX
009ad8d7  59  POP ECX
009ad8d8  59  POP ECX
009ad8d9  648910  MOV dword ptr FS:[EAX],EDX
009ad8dc  68f3d89a00  PUSH 0x9ad8f3
009ad8e1  8d45fc  LEA EAX,[EBP + -0x4]
009ad8e4  e8ebd6a5ff  CALL 0x0040afd4
009ad8e9  58  POP EAX
009ad8ea  ffe0  JMP EAX
