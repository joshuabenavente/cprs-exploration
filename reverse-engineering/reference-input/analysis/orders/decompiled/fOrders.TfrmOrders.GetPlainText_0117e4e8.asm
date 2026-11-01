; Static instruction listing. Function bodies and indirect exception flow require review.
0117e4e8  55  PUSH EBP
0117e4e9  8bec  MOV EBP,ESP
0117e4eb  83c4e8  ADD ESP,-0x18
0117e4ee  53  PUSH EBX
0117e4ef  33db  XOR EBX,EBX
0117e4f1  895de8  MOV dword ptr [EBP + -0x18],EBX
0117e4f4  894df4  MOV dword ptr [EBP + -0xc],ECX
0117e4f7  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117e4fa  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117e4fd  33c0  XOR EAX,EAX
0117e4ff  55  PUSH EBP
0117e500  68c7e51701  PUSH 0x117e5c7
0117e505  64ff30  PUSH dword ptr FS:[EAX]
0117e508  648920  MOV dword ptr FS:[EAX],ESP
0117e50b  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e50e  e8c1ca28ff  CALL 0x0040afd4
0117e513  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e516  8b8034050000  MOV EAX,dword ptr [EAX + 0x534]
0117e51c  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
0117e522  33d2  XOR EDX,EDX
0117e524  e8b7da4eff  CALL 0x0066bfe0
0117e529  8b400c  MOV EAX,dword ptr [EAX + 0xc]
0117e52c  bae4e51701  MOV EDX,0x117e5e4
0117e531  e8eedd28ff  CALL 0x0040c324
0117e536  7507  JNZ 0x0117e53f
0117e538  33c0  XOR EAX,EAX
0117e53a  8945ec  MOV dword ptr [EBP + -0x14],EAX
0117e53d  eb07  JMP 0x0117e546
0117e53f  c745ec01000000  MOV dword ptr [EBP + -0x14],0x1
0117e546  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117e549  83f80a  CMP EAX,0xa
0117e54c  7f61  JG 0x0117e5af
0117e54e  8945f0  MOV dword ptr [EBP + -0x10],EAX
0117e551  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e554  50  PUSH EAX
0117e555  8d45e8  LEA EAX,[EBP + -0x18]
0117e558  50  PUSH EAX
0117e559  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
0117e55c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117e55f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e562  e8e9040000  CALL 0x0117ea50
0117e567  837de800  CMP dword ptr [EBP + -0x18],0x0
0117e56b  7439  JZ 0x0117e5a6
0117e56d  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e570  ff30  PUSH dword ptr [EAX]
0117e572  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e575  8b8034050000  MOV EAX,dword ptr [EAX + 0x534]
0117e57b  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
0117e581  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
0117e584  e857da4eff  CALL 0x0066bfe0
0117e589  ff700c  PUSH dword ptr [EAX + 0xc]
0117e58c  68fce51701  PUSH 0x117e5fc
0117e591  ff75e8  PUSH dword ptr [EBP + -0x18]
0117e594  6810e61701  PUSH 0x117e610
0117e599  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e59c  ba05000000  MOV EDX,0x5
0117e5a1  e86edc28ff  CALL 0x0040c214
0117e5a6  ff45f0  INC dword ptr [EBP + -0x10]
0117e5a9  837df00b  CMP dword ptr [EBP + -0x10],0xb
0117e5ad  75a2  JNZ 0x0117e551
0117e5af  33c0  XOR EAX,EAX
0117e5b1  5a  POP EDX
0117e5b2  59  POP ECX
0117e5b3  59  POP ECX
0117e5b4  648910  MOV dword ptr FS:[EAX],EDX
0117e5b7  68cee51701  PUSH 0x117e5ce
0117e5bc  8d45e8  LEA EAX,[EBP + -0x18]
0117e5bf  e810ca28ff  CALL 0x0040afd4
0117e5c4  58  POP EAX
0117e5c5  ffe0  JMP EAX
