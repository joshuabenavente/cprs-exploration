; Static instruction listing. Function bodies and indirect exception flow require review.
011dabac  55  PUSH EBP
011dabad  8bec  MOV EBP,ESP
011dabaf  83c4e4  ADD ESP,-0x1c
011dabb2  8955f8  MOV dword ptr [EBP + -0x8],EDX
011dabb5  8945fc  MOV dword ptr [EBP + -0x4],EAX
011dabb8  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dabbb  50  PUSH EAX
011dabbc  6a00  PUSH 0x0
011dabbe  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011dabc1  8945e4  MOV dword ptr [EBP + -0x1c],EAX
011dabc4  c645e811  MOV byte ptr [EBP + -0x18],0x11
011dabc8  a1e0f22401  MOV EAX,[0x0124f2e0]
011dabcd  8b00  MOV EAX,dword ptr [EAX]
011dabcf  8b4004  MOV EAX,dword ptr [EAX + 0x4]
011dabd2  8945ec  MOV dword ptr [EBP + -0x14],EAX
011dabd5  c645f011  MOV byte ptr [EBP + -0x10],0x11
011dabd9  8d55e4  LEA EDX,[EBP + -0x1c]
011dabdc  b901000000  MOV ECX,0x1
011dabe1  b804ac1d01  MOV EAX,0x11dac04
011dabe6  e8952e7dff  CALL 0x009ada80
011dabeb  8845f7  MOV byte ptr [EBP + -0x9],AL
011dabee  8a45f7  MOV AL,byte ptr [EBP + -0x9]
011dabf1  8be5  MOV ESP,EBP
011dabf3  5d  POP EBP
011dabf4  c3  RET
