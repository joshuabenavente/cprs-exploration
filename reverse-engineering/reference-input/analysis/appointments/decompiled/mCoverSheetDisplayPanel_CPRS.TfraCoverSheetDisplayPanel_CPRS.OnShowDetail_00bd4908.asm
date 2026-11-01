; Static instruction listing. Function bodies and indirect exception flow require review.
00bd4908  55  PUSH EBP
00bd4909  8bec  MOV EBP,ESP
00bd490b  6a00  PUSH 0x0
00bd490d  6a00  PUSH 0x0
00bd490f  6a00  PUSH 0x0
00bd4911  53  PUSH EBX
00bd4912  56  PUSH ESI
00bd4913  894dfc  MOV dword ptr [EBP + -0x4],ECX
00bd4916  8bf2  MOV ESI,EDX
00bd4918  8bd8  MOV EBX,EAX
00bd491a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd491d  e8a66783ff  CALL 0x0040b0c8
00bd4922  33c0  XOR EAX,EAX
00bd4924  55  PUSH EBP
00bd4925  689b49bd00  PUSH 0xbd499b
00bd492a  64ff30  PUSH dword ptr FS:[EAX]
00bd492d  648920  MOV dword ptr FS:[EAX],ESP
00bd4930  837dfc00  CMP dword ptr [EBP + -0x4],0x0
00bd4934  7538  JNZ 0x00bd496e
00bd4936  8d55f8  LEA EDX,[EBP + -0x8]
00bd4939  8bc3  MOV EAX,EBX
00bd493b  8b08  MOV ECX,dword ptr [EAX]
00bd493d  ff9198010000  CALL dword ptr [ECX + 0x198]
00bd4943  ff75f8  PUSH dword ptr [EBP + -0x8]
00bd4946  68b849bd00  PUSH 0xbd49b8
00bd494b  8b834c030000  MOV EAX,dword ptr [EBX + 0x34c]
00bd4951  e80ee0aaff  CALL 0x00682964
00bd4956  8d55f4  LEA EDX,[EBP + -0xc]
00bd4959  8b08  MOV ECX,dword ptr [EAX]
00bd495b  ff5118  CALL dword ptr [ECX + 0x18]
00bd495e  ff75f4  PUSH dword ptr [EBP + -0xc]
00bd4961  8d45fc  LEA EAX,[EBP + -0x4]
00bd4964  ba03000000  MOV EDX,0x3
00bd4969  e8a67883ff  CALL 0x0040c214
00bd496e  6a01  PUSH 0x1
00bd4970  0fb64d08  MOVZX ECX,byte ptr [EBP + 0x8]
00bd4974  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00bd4977  8bc6  MOV EAX,ESI
00bd4979  e86e364300  CALL 0x01007fec
00bd497e  33c0  XOR EAX,EAX
00bd4980  5a  POP EDX
00bd4981  59  POP ECX
00bd4982  59  POP ECX
00bd4983  648910  MOV dword ptr FS:[EAX],EDX
00bd4986  68a249bd00  PUSH 0xbd49a2
00bd498b  8d45f4  LEA EAX,[EBP + -0xc]
00bd498e  ba03000000  MOV EDX,0x3
00bd4993  e89c6683ff  CALL 0x0040b034
00bd4998  58  POP EAX
00bd4999  ffe0  JMP EAX
