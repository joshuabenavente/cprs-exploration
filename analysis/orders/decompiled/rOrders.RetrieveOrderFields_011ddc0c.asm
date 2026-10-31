; Static instruction listing. Function bodies and indirect exception flow require review.
011ddc0c  55  PUSH EBP
011ddc0d  8bec  MOV EBP,ESP
011ddc0f  b913000000  MOV ECX,0x13
011ddc14  6a00  PUSH 0x0
011ddc16  6a00  PUSH 0x0
011ddc18  49  DEC ECX
011ddc19  75f9  JNZ 0x011ddc14
011ddc1b  51  PUSH ECX
011ddc1c  53  PUSH EBX
011ddc1d  8955f8  MOV dword ptr [EBP + -0x8],EDX
011ddc20  8945fc  MOV dword ptr [EBP + -0x4],EAX
011ddc23  33c0  XOR EAX,EAX
011ddc25  55  PUSH EBP
011ddc26  68bce01d01  PUSH 0x11de0bc
011ddc2b  64ff30  PUSH dword ptr FS:[EAX]
011ddc2e  648920  MOV dword ptr FS:[EAX],ESP
011ddc31  b201  MOV DL,0x1
011ddc33  a100734a00  MOV EAX,[0x004a7300]
011ddc38  e8b7a52fff  CALL 0x004d81f4
011ddc3d  8945dc  MOV dword ptr [EBP + -0x24],EAX
011ddc40  33c0  XOR EAX,EAX
011ddc42  55  PUSH EBP
011ddc43  6888e01d01  PUSH 0x11de088
011ddc48  64ff30  PUSH dword ptr FS:[EAX]
011ddc4b  648920  MOV dword ptr FS:[EAX],ESP
011ddc4e  b201  MOV DL,0x1
011ddc50  a100734a00  MOV EAX,[0x004a7300]
011ddc55  e89aa52fff  CALL 0x004d81f4
011ddc5a  8945d8  MOV dword ptr [EBP + -0x28],EAX
011ddc5d  33c0  XOR EAX,EAX
011ddc5f  55  PUSH EBP
011ddc60  6800dd1d01  PUSH 0x11ddd00
011ddc65  64ff30  PUSH dword ptr FS:[EAX]
011ddc68  648920  MOV dword ptr FS:[EAX],ESP
011ddc6b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ddc6e  8b4008  MOV EAX,dword ptr [EAX + 0x8]
011ddc71  48  DEC EAX
011ddc72  85c0  TEST EAX,EAX
011ddc74  7c29  JL 0x011ddc9f
011ddc76  40  INC EAX
011ddc77  8945d4  MOV dword ptr [EBP + -0x2c],EAX
011ddc7a  c745f400000000  MOV dword ptr [EBP + -0xc],0x0
011ddc81  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
011ddc84  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ddc87  e864532fff  CALL 0x004d2ff0
011ddc8c  8b500c  MOV EDX,dword ptr [EAX + 0xc]
011ddc8f  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011ddc92  8b08  MOV ECX,dword ptr [EAX]
011ddc94  ff513c  CALL dword ptr [ECX + 0x3c]
011ddc97  ff45f4  INC dword ptr [EBP + -0xc]
011ddc9a  ff4dd4  DEC dword ptr [EBP + -0x2c]
011ddc9d  75e2  JNZ 0x011ddc81
011ddc9f  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011ddca2  50  PUSH EAX
011ddca3  6a00  PUSH 0x0
011ddca5  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011ddca8  89459c  MOV dword ptr [EBP + -0x64],EAX
011ddcab  c645a000  MOV byte ptr [EBP + -0x60],0x0
011ddcaf  dd4508  FLD double ptr [EBP + 0x8]
011ddcb2  db7d90  FSTP extended double ptr [EBP + -0x70]
011ddcb5  9b  WAIT
011ddcb6  8d4590  LEA EAX,[EBP + -0x70]
011ddcb9  8945a4  MOV dword ptr [EBP + -0x5c],EAX
011ddcbc  c645a803  MOV byte ptr [EBP + -0x58],0x3
011ddcc0  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011ddcc3  8945ac  MOV dword ptr [EBP + -0x54],EAX
011ddcc6  c645b007  MOV byte ptr [EBP + -0x50],0x7
011ddcca  8d559c  LEA EDX,[EBP + -0x64]
011ddccd  b902000000  MOV ECX,0x2
011ddcd2  b8d8e01d01  MOV EAX,0x11de0d8
011ddcd7  e8a4fd7cff  CALL 0x009ada80
011ddcdc  84c0  TEST AL,AL
011ddcde  7508  JNZ 0x011ddce8
011ddce0  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011ddce3  8b10  MOV EDX,dword ptr [EAX]
011ddce5  ff5248  CALL dword ptr [EDX + 0x48]
011ddce8  33c0  XOR EAX,EAX
011ddcea  5a  POP EDX
011ddceb  59  POP ECX
011ddcec  59  POP ECX
011ddced  648910  MOV dword ptr FS:[EAX],EDX
011ddcf0  6807dd1d01  PUSH 0x11ddd07
011ddcf5  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011ddcf8  e8bfb322ff  CALL 0x004090bc
011ddcfd  58  POP EAX
011ddcfe  ffe0  JMP EAX
