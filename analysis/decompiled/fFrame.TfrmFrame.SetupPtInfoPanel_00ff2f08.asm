; Static instruction listing. Function bodies and indirect exception flow require review.
00ff2f08  55  PUSH EBP
00ff2f09  8bec  MOV EBP,ESP
00ff2f0b  83c4f8  ADD ESP,-0x8
00ff2f0e  8945fc  MOV dword ptr [EBP + -0x4],EAX
00ff2f11  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f14  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff2f1a  e8695567ff  CALL 0x00668488
00ff2f1f  8bd0  MOV EDX,EAX
00ff2f21  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f24  e893eeffff  CALL 0x00ff1dbc
00ff2f29  8945f8  MOV dword ptr [EBP + -0x8],EAX
00ff2f2c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f2f  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2f35  8b10  MOV EDX,dword ptr [EAX]
00ff2f37  ff9278010000  CALL dword ptr [EDX + 0x178]
00ff2f3d  3c03  CMP AL,0x3
00ff2f3f  741a  JZ 0x00ff2f5b
00ff2f41  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f44  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2f4a  8b10  MOV EDX,dword ptr [EAX]
00ff2f4c  ff9278010000  CALL dword ptr [EDX + 0x178]
00ff2f52  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff2f55  888260070000  MOV byte ptr [EDX + 0x760],AL
00ff2f5b  837df8ff  CMP dword ptr [EBP + -0x8],-0x1
00ff2f5f  7515  JNZ 0x00ff2f76
00ff2f61  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f64  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2f6a  b203  MOV DL,0x3
00ff2f6c  8b08  MOV ECX,dword ptr [EAX]
00ff2f6e  ff9188010000  CALL dword ptr [ECX + 0x188]
00ff2f74  eb72  JMP 0x00ff2fe8
00ff2f76  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f79  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2f7f  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00ff2f82  8b08  MOV ECX,dword ptr [EAX]
00ff2f84  ff91a0010000  CALL dword ptr [ECX + 0x1a0]
00ff2f8a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2f8d  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2f93  8b10  MOV EDX,dword ptr [EAX]
00ff2f95  ff9278010000  CALL dword ptr [EDX + 0x178]
00ff2f9b  3c03  CMP AL,0x3
00ff2f9d  7449  JZ 0x00ff2fe8
00ff2f9f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2fa2  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2fa8  8b10  MOV EDX,dword ptr [EAX]
00ff2faa  ff9278010000  CALL dword ptr [EDX + 0x178]
00ff2fb0  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff2fb3  3a8260070000  CMP AL,byte ptr [EDX + 0x760]
00ff2fb9  7513  JNZ 0x00ff2fce
00ff2fbb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2fbe  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2fc4  8b10  MOV EDX,dword ptr [EAX]
00ff2fc6  ff92ac010000  CALL dword ptr [EDX + 0x1ac]
00ff2fcc  eb1a  JMP 0x00ff2fe8
00ff2fce  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2fd1  8a9060070000  MOV DL,byte ptr [EAX + 0x760]
00ff2fd7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2fda  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2fe0  8b08  MOV ECX,dword ptr [EAX]
00ff2fe2  ff9188010000  CALL dword ptr [ECX + 0x188]
00ff2fe8  59  POP ECX
00ff2fe9  59  POP ECX
00ff2fea  5d  POP EBP
00ff2feb  c3  RET
