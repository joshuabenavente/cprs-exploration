; Static instruction listing. Function bodies and indirect exception flow require review.
011db190  55  PUSH EBP
011db191  8bec  MOV EBP,ESP
011db193  83c4f0  ADD ESP,-0x10
011db196  8945fc  MOV dword ptr [EBP + -0x4],EAX
011db199  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011db19c  e827ff22ff  CALL 0x0040b0c8
011db1a1  33c0  XOR EAX,EAX
011db1a3  55  PUSH EBP
011db1a4  68f1b11d01  PUSH 0x11db1f1
011db1a9  64ff30  PUSH dword ptr FS:[EAX]
011db1ac  648920  MOV dword ptr FS:[EAX],ESP
011db1af  8d45f8  LEA EAX,[EBP + -0x8]
011db1b2  50  PUSH EAX
011db1b3  6a00  PUSH 0x0
011db1b5  6a00  PUSH 0x0
011db1b7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011db1ba  8945f0  MOV dword ptr [EBP + -0x10],EAX
011db1bd  c645f411  MOV byte ptr [EBP + -0xc],0x11
011db1c1  8d55f0  LEA EDX,[EBP + -0x10]
011db1c4  33c9  XOR ECX,ECX
011db1c6  b80cb21d01  MOV EAX,0x11db20c
011db1cb  e81c267dff  CALL 0x009ad7ec
011db1d0  84c0  TEST AL,AL
011db1d2  7505  JNZ 0x011db1d9
011db1d4  33c0  XOR EAX,EAX
011db1d6  8945f8  MOV dword ptr [EBP + -0x8],EAX
011db1d9  33c0  XOR EAX,EAX
011db1db  5a  POP EDX
011db1dc  59  POP ECX
011db1dd  59  POP ECX
011db1de  648910  MOV dword ptr FS:[EAX],EDX
011db1e1  68f8b11d01  PUSH 0x11db1f8
011db1e6  8d45fc  LEA EAX,[EBP + -0x4]
011db1e9  e8e6fd22ff  CALL 0x0040afd4
011db1ee  58  POP EAX
011db1ef  ffe0  JMP EAX
