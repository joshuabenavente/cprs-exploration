009ada80  55  PUSH EBP
009ada81  8bec  MOV EBP,ESP
009ada83  83c4f8  ADD ESP,-0x8
009ada86  53  PUSH EBX
009ada87  56  PUSH ESI
009ada88  57  PUSH EDI
009ada89  894dfc  MOV dword ptr [EBP + -0x4],ECX
009ada8c  8bfa  MOV EDI,EDX
009ada8e  8bf0  MOV ESI,EAX
009ada90  8b5d0c  MOV EBX,dword ptr [EBP + 0xc]
009ada93  e8acfcffff  CALL 0x009ad744
009ada98  84c0  TEST AL,AL
009ada9a  7414  JZ 0x009adab0
009ada9c  85db  TEST EBX,EBX
009ada9e  7407  JZ 0x009adaa7
009adaa0  8bc3  MOV EAX,EBX
009adaa2  8b10  MOV EDX,dword ptr [EAX]
009adaa4  ff5248  CALL dword ptr [EDX + 0x48]
009adaa7  c645fb00  MOV byte ptr [EBP + -0x5],0x0
009adaab  e993000000  JMP 0x009adb43
009adab0  e86bf2ffff  CALL 0x009acd20
009adab5  33c0  XOR EAX,EAX
009adab7  55  PUSH EBP
009adab8  683cdb9a00  PUSH 0x9adb3c
009adabd  64ff30  PUSH dword ptr FS:[EAX]
009adac0  648920  MOV dword ptr FS:[EAX],ESP
009adac3  8bd7  MOV EDX,EDI
009adac5  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
009adac8  8bc6  MOV EAX,ESI
009adaca  e861f5ffff  CALL 0x009ad030
009adacf  85db  TEST EBX,EBX
009adad1  7407  JZ 0x009adada
009adad3  8bc3  MOV EAX,EBX
009adad5  8b10  MOV EDX,dword ptr [EAX]
009adad7  ff5248  CALL dword ptr [EDX + 0x48]
009adada  0fb65508  MOVZX EDX,byte ptr [EBP + 0x8]
009adade  8bc3  MOV EAX,EBX
009adae0  e807170000  CALL 0x009af1ec
009adae5  8845fb  MOV byte ptr [EBP + -0x5],AL
009adae8  33c0  XOR EAX,EAX
009adaea  5a  POP EDX
009adaeb  59  POP ECX
009adaec  59  POP ECX
009adaed  648910  MOV dword ptr FS:[EAX],EDX
009adaf0  6843db9a00  PUSH 0x9adb43
009adaf5  33c0  XOR EAX,EAX
009adaf7  55  PUSH EBP
009adaf8  6832db9a00  PUSH 0x9adb32
009adafd  64ff30  PUSH dword ptr FS:[EAX]
009adb00  648920  MOV dword ptr FS:[EAX],ESP
009adb03  a1cc8f2501  MOV EAX,[0x01258fcc]
009adb08  8b4060  MOV EAX,dword ptr [EAX + 0x60]
009adb0b  8b10  MOV EDX,dword ptr [EAX]
009adb0d  ff5248  CALL dword ptr [EDX + 0x48]
009adb10  a1cc8f2501  MOV EAX,[0x01258fcc]
009adb15  8b405c  MOV EAX,dword ptr [EAX + 0x5c]
009adb18  e89b15ffff  CALL 0x0099f0b8
009adb1d  33c0  XOR EAX,EAX
009adb1f  5a  POP EDX
009adb20  59  POP ECX
009adb21  59  POP ECX
009adb22  648910  MOV dword ptr FS:[EAX],EDX
009adb25  6839db9a00  PUSH 0x9adb39
009adb2a  e8fdf1ffff  CALL 0x009acd2c
009adb2f  58  POP EAX
009adb30  ffe0  JMP EAX
009adb43  0fb645fb  MOVZX EAX,byte ptr [EBP + -0x5]
009adb47  5f  POP EDI
009adb48  5e  POP ESI
009adb49  5b  POP EBX
009adb4a  59  POP ECX
009adb4b  59  POP ECX
009adb4c  5d  POP EBP
009adb4d  c20800  RET 0x8
