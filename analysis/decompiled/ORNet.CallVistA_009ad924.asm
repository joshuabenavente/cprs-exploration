; Static instruction listing. Function bodies and indirect exception flow require review.
009ad924  55  PUSH EBP
009ad925  8bec  MOV EBP,ESP
009ad927  83c4f0  ADD ESP,-0x10
009ad92a  53  PUSH EBX
009ad92b  56  PUSH ESI
009ad92c  57  PUSH EDI
009ad92d  33db  XOR EBX,EBX
009ad92f  895df0  MOV dword ptr [EBP + -0x10],EBX
009ad932  894dfc  MOV dword ptr [EBP + -0x4],ECX
009ad935  8bfa  MOV EDI,EDX
009ad937  8bf0  MOV ESI,EAX
009ad939  8b5d10  MOV EBX,dword ptr [EBP + 0x10]
009ad93c  8b4508  MOV EAX,dword ptr [EBP + 0x8]
009ad93f  e884d7a5ff  CALL 0x0040b0c8
009ad944  33c0  XOR EAX,EAX
009ad946  55  PUSH EBP
009ad947  6806da9a00  PUSH 0x9ada06
009ad94c  64ff30  PUSH dword ptr FS:[EAX]
009ad94f  648920  MOV dword ptr FS:[EAX],ESP
009ad952  b201  MOV DL,0x1
009ad954  a100734a00  MOV EAX,[0x004a7300]
009ad959  e896a8b2ff  CALL 0x004d81f4
009ad95e  8945f4  MOV dword ptr [EBP + -0xc],EAX
009ad961  33d2  XOR EDX,EDX
009ad963  55  PUSH EBP
009ad964  68dfd99a00  PUSH 0x9ad9df
009ad969  64ff32  PUSH dword ptr FS:[EDX]
009ad96c  648922  MOV dword ptr FS:[EDX],ESP
009ad96f  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
009ad972  50  PUSH EAX
009ad973  0fb6450c  MOVZX EAX,byte ptr [EBP + 0xc]
009ad977  50  PUSH EAX
009ad978  8bd7  MOV EDX,EDI
009ad97a  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
009ad97d  8bc6  MOV EAX,ESI
009ad97f  e8fc000000  CALL 0x009ada80
009ad984  8845fb  MOV byte ptr [EBP + -0x5],AL
009ad987  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
009ad98a  8b10  MOV EDX,dword ptr [EAX]
009ad98c  ff5214  CALL dword ptr [EDX + 0x14]
009ad98f  85c0  TEST EAX,EAX
009ad991  7e19  JLE 0x009ad9ac
009ad993  8d4df0  LEA ECX,[EBP + -0x10]
009ad996  33d2  XOR EDX,EDX
009ad998  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
009ad99b  8b30  MOV ESI,dword ptr [EAX]
009ad99d  ff560c  CALL dword ptr [ESI + 0xc]
009ad9a0  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
009ad9a3  8bc3  MOV EAX,EBX
009ad9a5  e81adaa5ff  CALL 0x0040b3c4
009ad9aa  eb07  JMP 0x009ad9b3
009ad9ac  8bc3  MOV EAX,EBX
009ad9ae  e821d6a5ff  CALL 0x0040afd4
009ad9b3  833b00  CMP dword ptr [EBX],0x0
009ad9b6  750a  JNZ 0x009ad9c2
009ad9b8  8bc3  MOV EAX,EBX
009ad9ba  8b5508  MOV EDX,dword ptr [EBP + 0x8]
009ad9bd  e802daa5ff  CALL 0x0040b3c4
009ad9c2  33c0  XOR EAX,EAX
009ad9c4  5a  POP EDX
009ad9c5  59  POP ECX
009ad9c6  59  POP ECX
009ad9c7  648910  MOV dword ptr FS:[EAX],EDX
009ad9ca  68e6d99a00  PUSH 0x9ad9e6
009ad9cf  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
009ad9d2  33d2  XOR EDX,EDX
009ad9d4  8955f4  MOV dword ptr [EBP + -0xc],EDX
009ad9d7  e8e0b6a5ff  CALL 0x004090bc
009ad9dc  58  POP EAX
009ad9dd  ffe0  JMP EAX
