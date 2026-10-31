; Static instruction listing. Function bodies and indirect exception flow require review.
0117e3f0  55  PUSH EBP
0117e3f1  8bec  MOV EBP,ESP
0117e3f3  83c4e8  ADD ESP,-0x18
0117e3f6  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117e3f9  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117e3fc  b201  MOV DL,0x1
0117e3fe  a140344a00  MOV EAX,[0x004a3440]
0117e403  e884ac28ff  CALL 0x0040908c
0117e408  8945f0  MOV dword ptr [EBP + -0x10],EAX
0117e40b  33c0  XOR EAX,EAX
0117e40d  55  PUSH EBP
0117e40e  68a1e41701  PUSH 0x117e4a1
0117e413  64ff30  PUSH dword ptr FS:[EAX]
0117e416  648920  MOV dword ptr FS:[EAX],ESP
0117e419  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117e41c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117e41f  83c264  ADD EDX,0x64
0117e422  2bd0  SUB EDX,EAX
0117e424  7c40  JL 0x0117e466
0117e426  42  INC EDX
0117e427  8955e8  MOV dword ptr [EBP + -0x18],EDX
0117e42a  8945f4  MOV dword ptr [EBP + -0xc],EAX
0117e42d  a1e0a92501  MOV EAX,[0x0125a9e0]
0117e432  8b4008  MOV EAX,dword ptr [EAX + 0x8]
0117e435  3b45f4  CMP EAX,dword ptr [EBP + -0xc]
0117e438  7e2c  JLE 0x0117e466
0117e43a  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0117e43d  a1e0a92501  MOV EAX,[0x0125a9e0]
0117e442  e8a94b35ff  CALL 0x004d2ff0
0117e447  8945ec  MOV dword ptr [EBP + -0x14],EAX
0117e44a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117e44d  80786900  CMP byte ptr [EAX + 0x69],0x0
0117e451  750b  JNZ 0x0117e45e
0117e453  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
0117e456  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e459  e8b24935ff  CALL 0x004d2e10
0117e45e  ff45f4  INC dword ptr [EBP + -0xc]
0117e461  ff4de8  DEC dword ptr [EBP + -0x18]
0117e464  75c7  JNZ 0x0117e42d
0117e466  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e469  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117e46f  ff702c  PUSH dword ptr [EAX + 0x2c]
0117e472  ff7028  PUSH dword ptr [EAX + 0x28]
0117e475  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e478  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117e47e  8b5030  MOV EDX,dword ptr [EAX + 0x30]
0117e481  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e484  e883f70500  CALL 0x011ddc0c
0117e489  33c0  XOR EAX,EAX
0117e48b  5a  POP EDX
0117e48c  59  POP ECX
0117e48d  59  POP ECX
0117e48e  648910  MOV dword ptr FS:[EAX],EDX
0117e491  68a8e41701  PUSH 0x117e4a8
0117e496  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e499  e81eac28ff  CALL 0x004090bc
0117e49e  58  POP EAX
0117e49f  ffe0  JMP EAX
