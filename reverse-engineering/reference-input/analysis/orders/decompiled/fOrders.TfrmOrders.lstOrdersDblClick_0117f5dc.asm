; Static instruction listing. Function bodies and indirect exception flow require review.
0117f5dc  55  PUSH EBP
0117f5dd  8bec  MOV EBP,ESP
0117f5df  83c4f8  ADD ESP,-0x8
0117f5e2  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117f5e5  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117f5e8  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117f5eb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117f5ee  e80dd6ffff  CALL 0x0117cc00
0117f5f3  59  POP ECX
0117f5f4  59  POP ECX
0117f5f5  5d  POP EBP
0117f5f6  c3  RET
