; Static instruction listing. Function bodies and indirect exception flow require review.
009ad778  55  PUSH EBP
009ad779  8bec  MOV EBP,ESP
009ad77b  83c4f8  ADD ESP,-0x8
009ad77e  53  PUSH EBX
009ad77f  56  PUSH ESI
009ad780  57  PUSH EDI
009ad781  8bf9  MOV EDI,ECX
009ad783  8bf2  MOV ESI,EDX
009ad785  8bd8  MOV EBX,EAX
009ad787  b201  MOV DL,0x1
009ad789  a100734a00  MOV EAX,[0x004a7300]
009ad78e  e861aab2ff  CALL 0x004d81f4
009ad793  8945f8  MOV dword ptr [EBP + -0x8],EAX
009ad796  33d2  XOR EDX,EDX
009ad798  55  PUSH EBP
009ad799  68d8d79a00  PUSH 0x9ad7d8
009ad79e  64ff32  PUSH dword ptr FS:[EDX]
009ad7a1  648922  MOV dword ptr FS:[EDX],ESP
009ad7a4  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
009ad7a7  50  PUSH EAX
009ad7a8  0fb64508  MOVZX EAX,byte ptr [EBP + 0x8]
009ad7ac  50  PUSH EAX
009ad7ad  8bd6  MOV EDX,ESI
009ad7af  8bcf  MOV ECX,EDI
009ad7b1  8bc3  MOV EAX,EBX
009ad7b3  e8c8020000  CALL 0x009ada80
009ad7b8  8845ff  MOV byte ptr [EBP + -0x1],AL
009ad7bb  33c0  XOR EAX,EAX
009ad7bd  5a  POP EDX
009ad7be  59  POP ECX
009ad7bf  59  POP ECX
009ad7c0  648910  MOV dword ptr FS:[EAX],EDX
009ad7c3  68dfd79a00  PUSH 0x9ad7df
009ad7c8  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
009ad7cb  33d2  XOR EDX,EDX
009ad7cd  8955f8  MOV dword ptr [EBP + -0x8],EDX
009ad7d0  e8e7b8a5ff  CALL 0x004090bc
009ad7d5  58  POP EAX
009ad7d6  ffe0  JMP EAX
