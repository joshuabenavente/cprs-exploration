; Static instruction listing. Function bodies and indirect exception flow require review.
0118c37c  55  PUSH EBP
0118c37d  8bec  MOV EBP,ESP
0118c37f  83c4f0  ADD ESP,-0x10
0118c382  894df8  MOV dword ptr [EBP + -0x8],ECX
0118c385  8955f0  MOV dword ptr [EBP + -0x10],EDX
0118c388  8945fc  MOV dword ptr [EBP + -0x4],EAX
0118c38b  33c0  XOR EAX,EAX
0118c38d  a3eca92501  MOV [0x0125a9ec],EAX
0118c392  c745f401000000  MOV dword ptr [EBP + -0xc],0x1
0118c399  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0118c39c  8b8034050000  MOV EAX,dword ptr [EAX + 0x534]
0118c3a2  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
0118c3a8  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0118c3ab  e830fc4dff  CALL 0x0066bfe0
0118c3b0  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
0118c3b3  7508  JNZ 0x0118c3bd
0118c3b5  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0118c3b8  a3eca92501  MOV [0x0125a9ec],EAX
0118c3bd  ff45f4  INC dword ptr [EBP + -0xc]
0118c3c0  837df40b  CMP dword ptr [EBP + -0xc],0xb
0118c3c4  75d3  JNZ 0x0118c399
0118c3c6  ba7cc11801  MOV EDX,0x118c17c
0118c3cb  a1e0a92501  MOV EAX,[0x0125a9e0]
0118c3d0  e8a77234ff  CALL 0x004d367c
0118c3d5  ba7cc11801  MOV EDX,0x118c17c
0118c3da  a1e0a92501  MOV EAX,[0x0125a9e0]
0118c3df  e8987234ff  CALL 0x004d367c
0118c3e4  33d2  XOR EDX,EDX
0118c3e6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0118c3e9  e8cee9feff  CALL 0x0117adbc
0118c3ee  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0118c3f1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0118c3f4  e8b7fbffff  CALL 0x0118bfb0
0118c3f9  8be5  MOV ESP,EBP
0118c3fb  5d  POP EBP
0118c3fc  c3  RET
