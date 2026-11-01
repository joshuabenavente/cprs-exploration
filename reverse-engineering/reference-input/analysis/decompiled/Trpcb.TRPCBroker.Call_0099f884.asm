; Static instruction listing. Function bodies and indirect exception flow require review.
0099f884  55  PUSH EBP
0099f885  8bec  MOV EBP,ESP
0099f887  51  PUSH ECX
0099f888  53  PUSH EBX
0099f889  8bd8  MOV EBX,EAX
0099f88b  b201  MOV DL,0x1
0099f88d  a100734a00  MOV EAX,[0x004a7300]
0099f892  e85d89b3ff  CALL 0x004d81f4
0099f897  8945fc  MOV dword ptr [EBP + -0x4],EAX
0099f89a  33d2  XOR EDX,EDX
0099f89c  55  PUSH EBP
0099f89d  68e9f89900  PUSH 0x99f8e9
0099f8a2  64ff32  PUSH dword ptr FS:[EDX]
0099f8a5  648922  MOV dword ptr FS:[EDX],ESP
0099f8a8  807b4d00  CMP byte ptr [EBX + 0x4d],0x0
0099f8ac  7409  JZ 0x0099f8b7
0099f8ae  b201  MOV DL,0x1
0099f8b0  8bc3  MOV EAX,EBX
0099f8b2  8b08  MOV ECX,dword ptr [EAX]
0099f8b4  ff5148  CALL dword ptr [ECX + 0x48]
0099f8b7  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0099f8ba  8bc3  MOV EAX,EBX
0099f8bc  8b08  MOV ECX,dword ptr [EAX]
0099f8be  ff516c  CALL dword ptr [ECX + 0x6c]
0099f8c1  8b4360  MOV EAX,dword ptr [EBX + 0x60]
0099f8c4  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0099f8c7  8b08  MOV ECX,dword ptr [EAX]
0099f8c9  ff5144  CALL dword ptr [ECX + 0x44]
0099f8cc  33c0  XOR EAX,EAX
0099f8ce  5a  POP EDX
0099f8cf  59  POP ECX
0099f8d0  59  POP ECX
0099f8d1  648910  MOV dword ptr FS:[EAX],EDX
0099f8d4  68f0f89900  PUSH 0x99f8f0
0099f8d9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0099f8dc  33d2  XOR EDX,EDX
0099f8de  8955fc  MOV dword ptr [EBP + -0x4],EDX
0099f8e1  e8d697a6ff  CALL 0x004090bc
0099f8e6  58  POP EAX
0099f8e7  ffe0  JMP EAX
