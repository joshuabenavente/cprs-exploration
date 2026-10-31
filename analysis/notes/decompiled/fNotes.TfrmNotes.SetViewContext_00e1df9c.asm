; Static instruction listing. Function bodies and indirect exception flow require review.
00e1df9c  55  PUSH EBP
00e1df9d  8bec  MOV EBP,ESP
00e1df9f  83c4a4  ADD ESP,-0x5c
00e1dfa2  53  PUSH EBX
00e1dfa3  56  PUSH ESI
00e1dfa4  57  PUSH EDI
00e1dfa5  8bf2  MOV ESI,EDX
00e1dfa7  8d7da8  LEA EDI,[EBP + -0x58]
00e1dfaa  b916000000  MOV ECX,0x16
00e1dfaf  f3a5  MOVSD.REP ES:EDI,ESI
00e1dfb1  8bd8  MOV EBX,EAX
00e1dfb3  8d45a8  LEA EAX,[EBP + -0x58]
00e1dfb6  8b157840a100  MOV EDX,dword ptr [0x00a14078]
00e1dfbc  e82ff45eff  CALL 0x0040d3f0
00e1dfc1  be08a12501  MOV ESI,0x125a108
00e1dfc6  33c0  XOR EAX,EAX
00e1dfc8  55  PUSH EBP
00e1dfc9  6838e1e100  PUSH 0xe1e138
00e1dfce  64ff30  PUSH dword ptr FS:[EAX]
00e1dfd1  648920  MOV dword ptr FS:[EAX],ESP
00e1dfd4  83bbbc070000ff  CMP dword ptr [EBX + 0x7bc],-0x1
00e1dfdb  7414  JZ 0x00e1dff1
00e1dfdd  8d55a7  LEA EDX,[EBP + -0x59]
00e1dfe0  8bc3  MOV EAX,EBX
00e1dfe2  e885b4ffff  CALL 0x00e1946c
00e1dfe7  807da700  CMP byte ptr [EBP + -0x59],0x0
00e1dfeb  0f8429010000  JZ 0x00e1e11a
00e1dff1  8d83d0070000  LEA EAX,[EBX + 0x7d0]
00e1dff7  8d55a8  LEA EDX,[EBP + -0x58]
00e1dffa  8b0d7840a100  MOV ECX,dword ptr [0x00a14078]
00e1e000  e827f55eff  CALL 0x0040d52c
00e1e005  83caff  OR EDX,0xffffffff
00e1e008  8bc3  MOV EAX,EBX
00e1e00a  e87d040000  CALL 0x00e1e48c
00e1e00f  8b83cc040000  MOV EAX,dword ptr [EBX + 0x4cc]
00e1e015  b201  MOV DL,0x1
00e1e017  8b08  MOV ECX,dword ptr [EAX]
00e1e019  ff919c000000  CALL dword ptr [ECX + 0x9c]
00e1e01f  8bc3  MOV EAX,EBX
00e1e021  e8d2e0ffff  CALL 0x00e1c0f8
00e1e026  83bbf007000000  CMP dword ptr [EBX + 0x7f0],0x0
00e1e02d  0f84d7000000  JZ 0x00e1e10a
00e1e033  8d4604  LEA EAX,[ESI + 0x4]
00e1e036  8b93d4070000  MOV EDX,dword ptr [EBX + 0x7d4]
00e1e03c  e883d35eff  CALL 0x0040b3c4
00e1e041  8d4608  LEA EAX,[ESI + 0x8]
00e1e044  8b93d8070000  MOV EDX,dword ptr [EBX + 0x7d8]
00e1e04a  e875d35eff  CALL 0x0040b3c4
00e1e04f  8b83e0070000  MOV EAX,dword ptr [EBX + 0x7e0]
00e1e055  894610  MOV dword ptr [ESI + 0x10],EAX
00e1e058  8b83e4070000  MOV EAX,dword ptr [EBX + 0x7e4]
00e1e05e  894614  MOV dword ptr [ESI + 0x14],EAX
00e1e061  8b83e8070000  MOV EAX,dword ptr [EBX + 0x7e8]
00e1e067  894618  MOV dword ptr [ESI + 0x18],EAX
00e1e06a  8b83ec070000  MOV EAX,dword ptr [EBX + 0x7ec]
00e1e070  89461c  MOV dword ptr [ESI + 0x1c],EAX
00e1e073  8d4620  LEA EAX,[ESI + 0x20]
00e1e076  8b93f0070000  MOV EDX,dword ptr [EBX + 0x7f0]
00e1e07c  e843d35eff  CALL 0x0040b3c4
00e1e081  8b83f8070000  MOV EAX,dword ptr [EBX + 0x7f8]
00e1e087  894628  MOV dword ptr [ESI + 0x28],EAX
00e1e08a  8b83fc070000  MOV EAX,dword ptr [EBX + 0x7fc]
00e1e090  89462c  MOV dword ptr [ESI + 0x2c],EAX
00e1e093  8b8300080000  MOV EAX,dword ptr [EBX + 0x800]
00e1e099  894630  MOV dword ptr [ESI + 0x30],EAX
00e1e09c  0fb68304080000  MOVZX EAX,byte ptr [EBX + 0x804]
00e1e0a3  884634  MOV byte ptr [ESI + 0x34],AL
00e1e0a6  8d4640  LEA EAX,[ESI + 0x40]
00e1e0a9  8b9310080000  MOV EDX,dword ptr [EBX + 0x810]
00e1e0af  e810d35eff  CALL 0x0040b3c4
00e1e0b4  8d4638  LEA EAX,[ESI + 0x38]
00e1e0b7  8b9308080000  MOV EDX,dword ptr [EBX + 0x808]
00e1e0bd  e802d35eff  CALL 0x0040b3c4
00e1e0c2  0fb6830c080000  MOVZX EAX,byte ptr [EBX + 0x80c]
00e1e0c9  88463c  MOV byte ptr [ESI + 0x3c],AL
00e1e0cc  0fb68314080000  MOVZX EAX,byte ptr [EBX + 0x814]
00e1e0d3  884644  MOV byte ptr [ESI + 0x44],AL
00e1e0d6  8d464c  LEA EAX,[ESI + 0x4c]
00e1e0d9  8b931c080000  MOV EDX,dword ptr [EBX + 0x81c]
00e1e0df  e8e0d25eff  CALL 0x0040b3c4
00e1e0e4  8d4648  LEA EAX,[ESI + 0x48]
00e1e0e7  8b9318080000  MOV EDX,dword ptr [EBX + 0x818]
00e1e0ed  e8d2d25eff  CALL 0x0040b3c4
00e1e0f2  0fb68320080000  MOVZX EAX,byte ptr [EBX + 0x820]
00e1e0f9  884650  MOV byte ptr [ESI + 0x50],AL
00e1e0fc  c60601  MOV byte ptr [ESI],0x1
00e1e0ff  8bd3  MOV EDX,EBX
00e1e101  8bc3  MOV EAX,EBX
00e1e103  e81c85ffff  CALL 0x00e16624
00e1e108  eb10  JMP 0x00e1e11a
00e1e10a  33c0  XOR EAX,EAX
00e1e10c  a304a12501  MOV [0x0125a104],EAX
00e1e111  8bd3  MOV EDX,EBX
00e1e113  8bc3  MOV EAX,EBX
00e1e115  e80a85ffff  CALL 0x00e16624
00e1e11a  33c0  XOR EAX,EAX
00e1e11c  5a  POP EDX
00e1e11d  59  POP ECX
00e1e11e  59  POP ECX
00e1e11f  648910  MOV dword ptr FS:[EAX],EDX
00e1e122  683fe1e100  PUSH 0xe1e13f
00e1e127  8d45a8  LEA EAX,[EBP + -0x58]
00e1e12a  8b157840a100  MOV EDX,dword ptr [0x00a14078]
00e1e130  e853ec5eff  CALL 0x0040cd88
00e1e135  58  POP EAX
00e1e136  ffe0  JMP EAX
