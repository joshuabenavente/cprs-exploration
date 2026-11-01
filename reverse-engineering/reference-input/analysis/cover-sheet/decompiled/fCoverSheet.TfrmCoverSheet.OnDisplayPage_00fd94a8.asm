; Static instruction listing. Function bodies and indirect exception flow require review.
00fd94a8  55  PUSH EBP
00fd94a9  8bec  MOV EBP,ESP
00fd94ab  6a00  PUSH 0x0
00fd94ad  6a00  PUSH 0x0
00fd94af  6a00  PUSH 0x0
00fd94b1  6a00  PUSH 0x0
00fd94b3  53  PUSH EBX
00fd94b4  56  PUSH ESI
00fd94b5  8bf1  MOV ESI,ECX
00fd94b7  8955fc  MOV dword ptr [EBP + -0x4],EDX
00fd94ba  8bd8  MOV EBX,EAX
00fd94bc  33c0  XOR EAX,EAX
00fd94be  55  PUSH EBP
00fd94bf  68a395fd00  PUSH 0xfd95a3
00fd94c4  64ff30  PUSH dword ptr FS:[EAX]
00fd94c7  648920  MOV dword ptr FS:[EAX],ESP
00fd94ca  a1acf02401  MOV EAX,[0x0124f0ac]
00fd94cf  33d2  XOR EDX,EDX
00fd94d1  8910  MOV dword ptr [EAX],EDX
00fd94d3  8bc3  MOV EAX,EBX
00fd94d5  e8a29462ff  CALL 0x0060297c
00fd94da  ff8384040000  INC dword ptr [EBX + 0x484]
00fd94e0  ff8388040000  INC dword ptr [EBX + 0x488]
00fd94e6  85f6  TEST ESI,ESI
00fd94e8  7515  JNZ 0x00fd94ff
00fd94ea  83bb8804000001  CMP dword ptr [EBX + 0x488],0x1
00fd94f1  750c  JNZ 0x00fd94ff
00fd94f3  c7838c04000001000000  MOV dword ptr [EBX + 0x48c],0x1
00fd94fd  eb06  JMP 0x00fd9505
00fd94ff  89b38c040000  MOV dword ptr [EBX + 0x48c],ESI
00fd9505  83bb8404000001  CMP dword ptr [EBX + 0x484],0x1
00fd950c  752a  JNZ 0x00fd9538
00fd950e  8d45f8  LEA EAX,[EBP + -0x8]
00fd9511  e8f26bc1ff  CALL 0x00bf0108
00fd9516  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00fd9519  8bd3  MOV EDX,EBX
00fd951b  8b08  MOV ECX,dword ptr [EAX]
00fd951d  ff5148  CALL dword ptr [ECX + 0x48]
00fd9520  8d45f4  LEA EAX,[EBP + -0xc]
00fd9523  e8e06bc1ff  CALL 0x00bf0108
00fd9528  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00fd952b  8b8b80040000  MOV ECX,dword ptr [EBX + 0x480]
00fd9531  8bd3  MOV EDX,EBX
00fd9533  8b30  MOV ESI,dword ptr [EAX]
00fd9535  ff5640  CALL dword ptr [ESI + 0x40]
00fd9538  83bb8804000001  CMP dword ptr [EBX + 0x488],0x1
00fd953f  751d  JNZ 0x00fd955e
00fd9541  8d45f0  LEA EAX,[EBP + -0x10]
00fd9544  e8bf6bc1ff  CALL 0x00bf0108
00fd9549  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00fd954c  8b15e0f22401  MOV EDX,dword ptr [0x0124f2e0]
00fd9552  8b12  MOV EDX,dword ptr [EDX]
00fd9554  8b4a04  MOV ECX,dword ptr [EDX + 0x4]
00fd9557  8bd3  MOV EDX,EBX
00fd9559  8b30  MOV ESI,dword ptr [EAX]
00fd955b  ff5650  CALL dword ptr [ESI + 0x50]
00fd955e  8b83ec020000  MOV EAX,dword ptr [EBX + 0x2ec]
00fd9564  85c0  TEST EAX,EAX
00fd9566  740b  JZ 0x00fd9573
00fd9568  8bd0  MOV EDX,EAX
00fd956a  8bc3  MOV EAX,EBX
00fd956c  e81fad74ff  CALL 0x00724290
00fd9571  eb0d  JMP 0x00fd9580
00fd9573  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00fd9576  8bc3  MOV EAX,EBX
00fd9578  8b08  MOV ECX,dword ptr [EAX]
00fd957a  ff91d8010000  CALL dword ptr [ECX + 0x1d8]
00fd9580  33c0  XOR EAX,EAX
00fd9582  5a  POP EDX
00fd9583  59  POP ECX
00fd9584  59  POP ECX
00fd9585  648910  MOV dword ptr FS:[EAX],EDX
00fd9588  68aa95fd00  PUSH 0xfd95aa
00fd958d  8d45f0  LEA EAX,[EBP + -0x10]
00fd9590  8b15dcfebe00  MOV EDX,dword ptr [0x00befedc]
00fd9596  b903000000  MOV ECX,0x3
00fd959b  e8243c43ff  CALL 0x0040d1c4
00fd95a0  58  POP EAX
00fd95a1  ffe0  JMP EAX
