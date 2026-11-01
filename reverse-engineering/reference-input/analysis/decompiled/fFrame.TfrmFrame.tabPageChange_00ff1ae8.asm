; Static instruction listing. Function bodies and indirect exception flow require review.
00ff1ae8  55  PUSH EBP
00ff1ae9  8bec  MOV EBP,ESP
00ff1aeb  83c4f0  ADD ESP,-0x10
00ff1aee  56  PUSH ESI
00ff1aef  8955f8  MOV dword ptr [EBP + -0x8],EDX
00ff1af2  8945fc  MOV dword ptr [EBP + -0x4],EAX
00ff1af5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1af8  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff1afe  e8a557feff  CALL 0x00fd72a8
00ff1b03  84c0  TEST AL,AL
00ff1b05  7565  JNZ 0x00ff1b6c
00ff1b07  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b0a  8b80d4050000  MOV EAX,dword ptr [EAX + 0x5d4]
00ff1b10  e87f6a61ff  CALL 0x00608594
00ff1b15  33c0  XOR EAX,EAX
00ff1b17  55  PUSH EBP
00ff1b18  68651bff00  PUSH 0xff1b65
00ff1b1d  64ff30  PUSH dword ptr FS:[EAX]
00ff1b20  648920  MOV dword ptr FS:[EAX],ESP
00ff1b23  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b26  8b4058  MOV EAX,dword ptr [EAX + 0x58]
00ff1b29  8945f4  MOV dword ptr [EBP + -0xc],EAX
00ff1b2c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b2f  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff1b35  b201  MOV DL,0x1
00ff1b37  e8e863feff  CALL 0x00fd7f24
00ff1b3c  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00ff1b3f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b42  e869fe60ff  CALL 0x006019b0
00ff1b47  33c0  XOR EAX,EAX
00ff1b49  5a  POP EDX
00ff1b4a  59  POP ECX
00ff1b4b  59  POP ECX
00ff1b4c  648910  MOV dword ptr FS:[EAX],EDX
00ff1b4f  686c1bff00  PUSH 0xff1b6c
00ff1b54  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b57  8b80d4050000  MOV EAX,dword ptr [EAX + 0x5d4]
00ff1b5d  e86a6a61ff  CALL 0x006085cc
00ff1b62  58  POP EAX
00ff1b63  ffe0  JMP EAX
00ff1b6c  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00ff1b6f  8b1578866400  MOV EDX,dword ptr [0x00648678]
00ff1b75  e84e7841ff  CALL 0x004093c8
00ff1b7a  e8096967ff  CALL 0x00668488
00ff1b7f  8bd0  MOV EDX,EAX
00ff1b81  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b84  e833020000  CALL 0x00ff1dbc
00ff1b89  8945f0  MOV dword ptr [EBP + -0x10],EAX
00ff1b8c  837df0ff  CMP dword ptr [EBP + -0x10],-0x1
00ff1b90  7449  JZ 0x00ff1bdb
00ff1b92  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1b95  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff1b9b  66beb4ff  MOV SI,0xffb4
00ff1b9f  e8ec7841ff  CALL 0x00409490
00ff1ba4  84c0  TEST AL,AL
00ff1ba6  7433  JZ 0x00ff1bdb
00ff1ba8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1bab  83b8f006000000  CMP dword ptr [EAX + 0x6f0],0x0
00ff1bb2  7427  JZ 0x00ff1bdb
00ff1bb4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1bb7  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff1bbd  66beb1ff  MOV SI,0xffb1
00ff1bc1  e8ca7841ff  CALL 0x00409490
00ff1bc6  84c0  TEST AL,AL
00ff1bc8  7511  JNZ 0x00ff1bdb
00ff1bca  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1bcd  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff1bd3  8b10  MOV EDX,dword ptr [EAX]
00ff1bd5  ff9264010000  CALL dword ptr [EDX + 0x164]
00ff1bdb  a1dcf92401  MOV EAX,[0x0124f9dc]
00ff1be0  8b00  MOV EAX,dword ptr [EAX]
00ff1be2  80785600  CMP byte ptr [EAX + 0x56],0x0
00ff1be6  0f851f010000  JNZ 0x00ff1d0b
00ff1bec  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00ff1bef  40  INC EAX
00ff1bf0  83f80c  CMP EAX,0xc
00ff1bf3  0f8702010000  JA 0x00ff1cfb
00ff1bf9  ff2485001cff00  JMP dword ptr [EAX*0x4 + 0xff1c00]
00ff1cfb  837df0ff  CMP dword ptr [EBP + -0x10],-0x1
00ff1cff  7424  JZ 0x00ff1d25
00ff1d01  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00ff1d04  a3c0a62501  MOV [0x0125a6c0],EAX
00ff1d09  eb1a  JMP 0x00ff1d25
00ff1d0b  8b15b4e52401  MOV EDX,dword ptr [0x0124e5b4]
00ff1d11  8b12  MOV EDX,dword ptr [EDX]
00ff1d13  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1d16  e8e1f9ffff  CALL 0x00ff16fc
00ff1d1b  c705c0a625010a000000  MOV dword ptr [0x0125a6c0],0xa
00ff1d25  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1d28  e8db110000  CALL 0x00ff2f08
00ff1d2d  e876449eff  CALL 0x009d61a8
00ff1d32  84c0  TEST AL,AL
00ff1d34  7411  JZ 0x00ff1d47
00ff1d36  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1d39  80b84307000000  CMP byte ptr [EAX + 0x743],0x0
00ff1d40  7405  JZ 0x00ff1d47
00ff1d42  e899f3d1ff  CALL 0x00d110e0
00ff1d47  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00ff1d4a  a3c8a62501  MOV [0x0125a6c8],EAX
00ff1d4f  5e  POP ESI
00ff1d50  8be5  MOV ESP,EBP
00ff1d52  5d  POP EBP
00ff1d53  c3  RET
