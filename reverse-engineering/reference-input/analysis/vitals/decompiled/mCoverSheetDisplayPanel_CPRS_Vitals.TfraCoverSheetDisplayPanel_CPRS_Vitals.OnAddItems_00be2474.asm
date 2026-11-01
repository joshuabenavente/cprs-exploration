; Static instruction listing. Function bodies and indirect exception flow require review.
00be2474  55  PUSH EBP
00be2475  8bec  MOV EBP,ESP
00be2477  b908000000  MOV ECX,0x8
00be247c  6a00  PUSH 0x0
00be247e  6a00  PUSH 0x0
00be2480  49  DEC ECX
00be2481  75f9  JNZ 0x00be247c
00be2483  53  PUSH EBX
00be2484  56  PUSH ESI
00be2485  8955ec  MOV dword ptr [EBP + -0x14],EDX
00be2488  8945f0  MOV dword ptr [EBP + -0x10],EAX
00be248b  33c0  XOR EAX,EAX
00be248d  55  PUSH EBP
00be248e  681b27be00  PUSH 0xbe271b
00be2493  64ff30  PUSH dword ptr FS:[EAX]
00be2496  648920  MOV dword ptr FS:[EAX],ESP
00be2499  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00be249c  8b10  MOV EDX,dword ptr [EAX]
00be249e  ff5214  CALL dword ptr [EDX + 0x14]
00be24a1  85c0  TEST EAX,EAX
00be24a3  750d  JNZ 0x00be24b2
00be24a5  ba3427be00  MOV EDX,0xbe2734
00be24aa  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00be24ad  8b08  MOV ECX,dword ptr [EAX]
00be24af  ff513c  CALL dword ptr [ECX + 0x3c]
00be24b2  33d2  XOR EDX,EDX
00be24b4  55  PUSH EBP
00be24b5  68ea26be00  PUSH 0xbe26ea
00be24ba  64ff32  PUSH dword ptr FS:[EDX]
00be24bd  648922  MOV dword ptr FS:[EDX],ESP
00be24c0  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00be24c3  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be24c9  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00be24cf  e8a0aba9ff  CALL 0x0067d074
00be24d4  33c0  XOR EAX,EAX
00be24d6  8945e8  MOV dword ptr [EBP + -0x18],EAX
00be24d9  8b4dec  MOV ECX,dword ptr [EBP + -0x14]
00be24dc  b201  MOV DL,0x1
00be24de  a190594a00  MOV EAX,[0x004a5990]
00be24e3  e8782f8fff  CALL 0x004d5460
00be24e8  8945e8  MOV dword ptr [EBP + -0x18],EAX
00be24eb  33c0  XOR EAX,EAX
00be24ed  55  PUSH EBP
00be24ee  68b726be00  PUSH 0xbe26b7
00be24f3  64ff30  PUSH dword ptr FS:[EAX]
00be24f6  648920  MOV dword ptr FS:[EAX],ESP
00be24f9  e973010000  JMP 0x00be2671
00be24fe  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00be2501  ff4004  INC dword ptr [EAX + 0x4]
00be2504  8d55f4  LEA EDX,[EBP + -0xc]
00be2507  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00be250a  e8952f8fff  CALL 0x004d54a4
00be250f  6a5e  PUSH 0x5e
00be2511  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
00be2514  b201  MOV DL,0x1
00be2516  a17cecbc00  MOV EAX,[0x00bcec7c]
00be251b  e850d2feff  CALL 0x00bcf770
00be2520  8bd8  MOV EBX,EAX
00be2522  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00be2525  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be252b  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00be2531  e84aa9a9ff  CALL 0x0067ce80
00be2536  85c0  TEST EAX,EAX
00be2538  7532  JNZ 0x00be256c
00be253a  ba01000000  MOV EDX,0x1
00be253f  8bc3  MOV EAX,EBX
00be2541  e88ee6feff  CALL 0x00bd0bd4
00be2546  84c0  TEST AL,AL
00be2548  7422  JZ 0x00be256c
00be254a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00be254d  8b10  MOV EDX,dword ptr [EAX]
00be254f  ff5214  CALL dword ptr [EDX + 0x14]
00be2552  48  DEC EAX
00be2553  7517  JNZ 0x00be256c
00be2555  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00be2558  e84311ffff  CALL 0x00bd36a0
00be255d  e8d28182ff  CALL 0x0040a734
00be2562  e8cd8182ff  CALL 0x0040a734
00be2567  e985010000  JMP 0x00be26f1
00be256c  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00be256f  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be2575  8b80f4020000  MOV EAX,dword ptr [EAX + 0x2f4]
00be257b  e860a8a9ff  CALL 0x0067cde0
00be2580  8bf0  MOV ESI,EAX
00be2582  8d4dd4  LEA ECX,[EBP + -0x2c]
00be2585  ba02000000  MOV EDX,0x2
00be258a  8bc3  MOV EAX,EBX
00be258c  e8abd3feff  CALL 0x00bcf93c
00be2591  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
00be2594  8bc6  MOV EAX,ESI
00be2596  e83d9fa9ff  CALL 0x0067c4d8
00be259b  8d4dcc  LEA ECX,[EBP + -0x34]
00be259e  ba05000000  MOV EDX,0x5
00be25a3  8bc3  MOV EAX,EBX
00be25a5  e892d3feff  CALL 0x00bcf93c
00be25aa  ff75cc  PUSH dword ptr [EBP + -0x34]
00be25ad  686427be00  PUSH 0xbe2764
00be25b2  8d4dc8  LEA ECX,[EBP + -0x38]
00be25b5  ba06000000  MOV EDX,0x6
00be25ba  8bc3  MOV EAX,EBX
00be25bc  e87bd3feff  CALL 0x00bcf93c
00be25c1  ff75c8  PUSH dword ptr [EBP + -0x38]
00be25c4  8d45d0  LEA EAX,[EBP + -0x30]
00be25c7  ba03000000  MOV EDX,0x3
00be25cc  e8439c82ff  CALL 0x0040c214
00be25d1  8b55d0  MOV EDX,dword ptr [EBP + -0x30]
00be25d4  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00be25d7  8b08  MOV ECX,dword ptr [EAX]
00be25d9  ff513c  CALL dword ptr [ECX + 0x3c]
00be25dc  6a00  PUSH 0x0
00be25de  6a00  PUSH 0x0
00be25e0  33c9  XOR ECX,ECX
00be25e2  ba04000000  MOV EDX,0x4
00be25e7  8bc3  MOV EAX,EBX
00be25e9  e8fad8feff  CALL 0x00bcfee8
00be25ee  dd5dd8  FSTP double ptr [EBP + -0x28]
00be25f1  9b  WAIT
00be25f2  ff75dc  PUSH dword ptr [EBP + -0x24]
00be25f5  ff75d8  PUSH dword ptr [EBP + -0x28]
00be25f8  8d4dc4  LEA ECX,[EBP + -0x3c]
00be25fb  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00be2601  b87427be00  MOV EAX,0xbe2774
00be2606  e845ff84ff  CALL 0x00432550
00be260b  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
00be260e  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00be2611  8b08  MOV ECX,dword ptr [EAX]
00be2613  ff513c  CALL dword ptr [ECX + 0x3c]
00be2616  8d4dfc  LEA ECX,[EBP + -0x4]
00be2619  ba07000000  MOV EDX,0x7
00be261e  8bc3  MOV EAX,EBX
00be2620  e817d3feff  CALL 0x00bcf93c
00be2625  8d4df8  LEA ECX,[EBP + -0x8]
00be2628  ba08000000  MOV EDX,0x8
00be262d  8bc3  MOV EAX,EBX
00be262f  e808d3feff  CALL 0x00bcf93c
00be2634  8d55c0  LEA EDX,[EBP + -0x40]
00be2637  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00be263a  e8bd9f84ff  CALL 0x0042c5fc
00be263f  837dc000  CMP dword ptr [EBP + -0x40],0x0
00be2643  7418  JZ 0x00be265d
00be2645  ff75fc  PUSH dword ptr [EBP + -0x4]
00be2648  686427be00  PUSH 0xbe2764
00be264d  ff75f8  PUSH dword ptr [EBP + -0x8]
00be2650  8d45fc  LEA EAX,[EBP + -0x4]
00be2653  ba03000000  MOV EDX,0x3
00be2658  e8b79b82ff  CALL 0x0040c214
00be265d  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00be2660  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00be2663  8b08  MOV ECX,dword ptr [EAX]
00be2665  ff513c  CALL dword ptr [ECX + 0x3c]
00be2668  8bd3  MOV EDX,EBX
00be266a  8bc6  MOV EAX,ESI
00be266c  e86f9fa9ff  CALL 0x0067c5e0
00be2671  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00be2674  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be2677  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00be267a  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00be267d  8b10  MOV EDX,dword ptr [EAX]
00be267f  ff5214  CALL dword ptr [EDX + 0x14]
00be2682  48  DEC EAX
00be2683  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00be2686  3b4204  CMP EAX,dword ptr [EDX + 0x4]
00be2689  0f9f45e3  SETG byte ptr [EBP + -0x1d]
00be268d  807de300  CMP byte ptr [EBP + -0x1d],0x0
00be2691  0f8567feffff  JNZ 0x00be24fe
00be2697  33c0  XOR EAX,EAX
00be2699  5a  POP EDX
00be269a  59  POP ECX
00be269b  59  POP ECX
00be269c  648910  MOV dword ptr FS:[EAX],EDX
00be269f  68be26be00  PUSH 0xbe26be
00be26a4  837de800  CMP dword ptr [EBP + -0x18],0x0
00be26a8  740a  JZ 0x00be26b4
00be26aa  b201  MOV DL,0x1
00be26ac  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00be26af  8b08  MOV ECX,dword ptr [EAX]
00be26b1  ff51fc  CALL dword ptr [ECX + -0x4]
00be26b4  58  POP EAX
00be26b5  ffe0  JMP EAX
00be26f1  33c0  XOR EAX,EAX
00be26f3  5a  POP EDX
00be26f4  59  POP ECX
00be26f5  59  POP ECX
00be26f6  648910  MOV dword ptr FS:[EAX],EDX
00be26f9  682227be00  PUSH 0xbe2722
00be26fe  8d45c0  LEA EAX,[EBP + -0x40]
00be2701  ba06000000  MOV EDX,0x6
00be2706  e8298982ff  CALL 0x0040b034
00be270b  8d45f4  LEA EAX,[EBP + -0xc]
00be270e  ba03000000  MOV EDX,0x3
00be2713  e81c8982ff  CALL 0x0040b034
00be2718  58  POP EAX
00be2719  ffe0  JMP EAX
