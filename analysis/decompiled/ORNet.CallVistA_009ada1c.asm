; Static instruction listing. Function bodies and indirect exception flow require review.
009ada1c  55  PUSH EBP
009ada1d  8bec  MOV EBP,ESP
009ada1f  53  PUSH EBX
009ada20  56  PUSH ESI
009ada21  57  PUSH EDI
009ada22  8bf9  MOV EDI,ECX
009ada24  8bf2  MOV ESI,EDX
009ada26  8bd8  MOV EBX,EAX
009ada28  8b450c  MOV EAX,dword ptr [EBP + 0xc]
009ada2b  e898d6a5ff  CALL 0x0040b0c8
009ada30  33c0  XOR EAX,EAX
009ada32  55  PUSH EBP
009ada33  6870da9a00  PUSH 0x9ada70
009ada38  64ff30  PUSH dword ptr FS:[EAX]
009ada3b  648920  MOV dword ptr FS:[EAX],ESP
009ada3e  8b4510  MOV EAX,dword ptr [EBP + 0x10]
009ada41  50  PUSH EAX
009ada42  0fb64508  MOVZX EAX,byte ptr [EBP + 0x8]
009ada46  50  PUSH EAX
009ada47  8b450c  MOV EAX,dword ptr [EBP + 0xc]
009ada4a  50  PUSH EAX
009ada4b  8bd6  MOV EDX,ESI
009ada4d  8bcf  MOV ECX,EDI
009ada4f  8bc3  MOV EAX,EBX
009ada51  e8cefeffff  CALL 0x009ad924
009ada56  8bd8  MOV EBX,EAX
009ada58  33c0  XOR EAX,EAX
009ada5a  5a  POP EDX
009ada5b  59  POP ECX
009ada5c  59  POP ECX
009ada5d  648910  MOV dword ptr FS:[EAX],EDX
009ada60  6877da9a00  PUSH 0x9ada77
009ada65  8d450c  LEA EAX,[EBP + 0xc]
009ada68  e867d5a5ff  CALL 0x0040afd4
009ada6d  58  POP EAX
009ada6e  ffe0  JMP EAX
