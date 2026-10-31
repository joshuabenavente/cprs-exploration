; Static instruction listing. Function bodies and indirect exception flow require review.
00be2334  55  PUSH EBP
00be2335  8bec  MOV EBP,ESP
00be2337  33c9  XOR ECX,ECX
00be2339  51  PUSH ECX
00be233a  51  PUSH ECX
00be233b  51  PUSH ECX
00be233c  51  PUSH ECX
00be233d  51  PUSH ECX
00be233e  53  PUSH EBX
00be233f  8945f8  MOV dword ptr [EBP + -0x8],EAX
00be2342  33c0  XOR EAX,EAX
00be2344  55  PUSH EBP
00be2345  686524be00  PUSH 0xbe2465
00be234a  64ff30  PUSH dword ptr FS:[EAX]
00be234d  648920  MOV dword ptr FS:[EAX],ESP
00be2350  33c9  XOR ECX,ECX
00be2352  b201  MOV DL,0x1
00be2354  b011  MOV AL,0x11
00be2356  e825f94200  CALL 0x01011c80
00be235b  84c0  TEST AL,AL
00be235d  0f84d7000000  JZ 0x00be243a
00be2363  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00be2366  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be236c  33d2  XOR EDX,EDX
00be236e  8b08  MOV ECX,dword ptr [EAX]
00be2370  ff919c000000  CALL dword ptr [ECX + 0x9c]
00be2376  33c0  XOR EAX,EAX
00be2378  55  PUSH EBP
00be2379  683324be00  PUSH 0xbe2433
00be237e  64ff30  PUSH dword ptr FS:[EAX]
00be2381  648920  MOV dword ptr FS:[EAX],ESP
00be2384  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00be2387  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be238d  e8d205aaff  CALL 0x00682964
00be2392  85c0  TEST EAX,EAX
00be2394  7418  JZ 0x00be23ae
00be2396  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00be2399  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be239f  e8c005aaff  CALL 0x00682964
00be23a4  8d55fc  LEA EDX,[EBP + -0x4]
00be23a7  8b08  MOV ECX,dword ptr [EAX]
00be23a9  ff5118  CALL dword ptr [ECX + 0x18]
00be23ac  eb08  JMP 0x00be23b6
00be23ae  8d45fc  LEA EAX,[EBP + -0x4]
00be23b1  e81e8c82ff  CALL 0x0040afd4
00be23b6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00be23b9  50  PUSH EAX
00be23ba  8d45f7  LEA EAX,[EBP + -0x9]
00be23bd  50  PUSH EAX
00be23be  8b0da0e22401  MOV ECX,dword ptr [0x0124e2a0]
00be23c4  8b09  MOV ECX,dword ptr [ECX]
00be23c6  8b15e0f22401  MOV EDX,dword ptr [0x0124f2e0]
00be23cc  8b12  MOV EDX,dword ptr [EDX]
00be23ce  a140eb2401  MOV EAX,[0x0124eb40]
00be23d3  8b00  MOV EAX,dword ptr [EAX]
00be23d5  e8d648f0ff  CALL 0x00ae6cb0
00be23da  807df700  CMP byte ptr [EBP + -0x9],0x0
00be23de  7430  JZ 0x00be2410
00be23e0  8d45f0  LEA EAX,[EBP + -0x10]
00be23e3  e820dd0000  CALL 0x00bf0108
00be23e8  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00be23eb  b946000000  MOV ECX,0x46
00be23f0  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00be23f3  8b18  MOV EBX,dword ptr [EAX]
00be23f5  ff534c  CALL dword ptr [EBX + 0x4c]
00be23f8  8d45ec  LEA EAX,[EBP + -0x14]
00be23fb  e808dd0000  CALL 0x00bf0108
00be2400  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00be2403  b932000000  MOV ECX,0x32
00be2408  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00be240b  8b18  MOV EBX,dword ptr [EAX]
00be240d  ff534c  CALL dword ptr [EBX + 0x4c]
00be2410  33c0  XOR EAX,EAX
00be2412  5a  POP EDX
00be2413  59  POP ECX
00be2414  59  POP ECX
00be2415  648910  MOV dword ptr FS:[EAX],EDX
00be2418  683a24be00  PUSH 0xbe243a
00be241d  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00be2420  8b804c030000  MOV EAX,dword ptr [EAX + 0x34c]
00be2426  b201  MOV DL,0x1
00be2428  8b08  MOV ECX,dword ptr [EAX]
00be242a  ff919c000000  CALL dword ptr [ECX + 0x9c]
00be2430  58  POP EAX
00be2431  ffe0  JMP EAX
00be243a  33c0  XOR EAX,EAX
00be243c  5a  POP EDX
00be243d  59  POP ECX
00be243e  59  POP ECX
00be243f  648910  MOV dword ptr FS:[EAX],EDX
00be2442  686c24be00  PUSH 0xbe246c
00be2447  8d45ec  LEA EAX,[EBP + -0x14]
00be244a  8b15dcfebe00  MOV EDX,dword ptr [0x00befedc]
00be2450  b902000000  MOV ECX,0x2
00be2455  e86aad82ff  CALL 0x0040d1c4
00be245a  8d45fc  LEA EAX,[EBP + -0x4]
00be245d  e8728b82ff  CALL 0x0040afd4
00be2462  58  POP EAX
00be2463  ffe0  JMP EAX
