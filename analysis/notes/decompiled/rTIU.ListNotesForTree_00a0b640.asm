; Static instruction listing. Function bodies and indirect exception flow require review.
00a0b640  55  PUSH EBP
00a0b641  8bec  MOV EBP,ESP
00a0b643  81c474ffffff  ADD ESP,0xffffff74
00a0b649  53  PUSH EBX
00a0b64a  56  PUSH ESI
00a0b64b  57  PUSH EDI
00a0b64c  33db  XOR EBX,EBX
00a0b64e  899d74ffffff  MOV dword ptr [EBP + 0xffffff74],EBX
00a0b654  899d78ffffff  MOV dword ptr [EBP + 0xffffff78],EBX
00a0b65a  895d80  MOV dword ptr [EBP + -0x80],EBX
00a0b65d  899d7cffffff  MOV dword ptr [EBP + 0xffffff7c],EBX
00a0b663  894dfc  MOV dword ptr [EBP + -0x4],ECX
00a0b666  8bfa  MOV EDI,EDX
00a0b668  8bd8  MOV EBX,EAX
00a0b66a  8b450c  MOV EAX,dword ptr [EBP + 0xc]
00a0b66d  e856fa9fff  CALL 0x0040b0c8
00a0b672  33c0  XOR EAX,EAX
00a0b674  55  PUSH EBP
00a0b675  68feb7a000  PUSH 0xa0b7fe
00a0b67a  64ff30  PUSH dword ptr FS:[EAX]
00a0b67d  648920  MOV dword ptr FS:[EAX],ESP
00a0b680  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0b683  e84cf99fff  CALL 0x0040afd4
00a0b688  807d1400  CMP byte ptr [EBP + 0x14],0x0
00a0b68c  7406  JZ 0x00a0b694
00a0b68e  66be4100  MOV SI,0x41
00a0b692  eb04  JMP 0x00a0b698
00a0b694  66be4400  MOV SI,0x44
00a0b698  85ff  TEST EDI,EDI
00a0b69a  0f8e36010000  JLE 0x00a0b7d6
00a0b6a0  53  PUSH EBX
00a0b6a1  6a00  PUSH 0x0
00a0b6a3  c7459c03000000  MOV dword ptr [EBP + -0x64],0x3
00a0b6aa  c645a000  MOV byte ptr [EBP + -0x60],0x0
00a0b6ae  897da4  MOV dword ptr [EBP + -0x5c],EDI
00a0b6b1  c645a800  MOV byte ptr [EBP + -0x58],0x0
00a0b6b5  a1e0f22401  MOV EAX,[0x0124f2e0]
00a0b6ba  8b00  MOV EAX,dword ptr [EAX]
00a0b6bc  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00a0b6bf  8945ac  MOV dword ptr [EBP + -0x54],EAX
00a0b6c2  c645b011  MOV byte ptr [EBP + -0x50],0x11
00a0b6c6  dd4528  FLD double ptr [EBP + 0x28]
00a0b6c9  db7d90  FSTP extended double ptr [EBP + -0x70]
00a0b6cc  9b  WAIT
00a0b6cd  8d4590  LEA EAX,[EBP + -0x70]
00a0b6d0  8945b4  MOV dword ptr [EBP + -0x4c],EAX
00a0b6d3  c645b803  MOV byte ptr [EBP + -0x48],0x3
00a0b6d7  dd4520  FLD double ptr [EBP + 0x20]
00a0b6da  db7d84  FSTP extended double ptr [EBP + -0x7c]
00a0b6dd  9b  WAIT
00a0b6de  8d4584  LEA EAX,[EBP + -0x7c]
00a0b6e1  8945bc  MOV dword ptr [EBP + -0x44],EAX
00a0b6e4  c645c003  MOV byte ptr [EBP + -0x40],0x3
00a0b6e8  8d4518  LEA EAX,[EBP + 0x18]
00a0b6eb  8945c4  MOV dword ptr [EBP + -0x3c],EAX
00a0b6ee  c645c810  MOV byte ptr [EBP + -0x38],0x10
00a0b6f2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00a0b6f5  8945cc  MOV dword ptr [EBP + -0x34],EAX
00a0b6f8  c645d000  MOV byte ptr [EBP + -0x30],0x0
00a0b6fc  668975d4  MOV word ptr [EBP + -0x2c],SI
00a0b700  c645d809  MOV byte ptr [EBP + -0x28],0x9
00a0b704  c645dc01  MOV byte ptr [EBP + -0x24],0x1
00a0b708  c645e001  MOV byte ptr [EBP + -0x20],0x1
00a0b70c  33c0  XOR EAX,EAX
00a0b70e  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00a0b711  c645e800  MOV byte ptr [EBP + -0x18],0x0
00a0b715  8b4510  MOV EAX,dword ptr [EBP + 0x10]
00a0b718  8945ec  MOV dword ptr [EBP + -0x14],EAX
00a0b71b  c645f000  MOV byte ptr [EBP + -0x10],0x0
00a0b71f  8b450c  MOV EAX,dword ptr [EBP + 0xc]
00a0b722  8945f4  MOV dword ptr [EBP + -0xc],EAX
00a0b725  c645f811  MOV byte ptr [EBP + -0x8],0x11
00a0b729  8d559c  LEA EDX,[EBP + -0x64]
00a0b72c  b90b000000  MOV ECX,0xb
00a0b731  b81cb8a000  MOV EAX,0xa0b81c
00a0b736  e84523faff  CALL 0x009ada80
00a0b73b  8bc3  MOV EAX,EBX
00a0b73d  8b10  MOV EDX,dword ptr [EAX]
00a0b73f  ff5214  CALL dword ptr [EDX + 0x14]
00a0b742  85c0  TEST EAX,EAX
00a0b744  0f8e8c000000  JLE 0x00a0b7d6
00a0b74a  33f6  XOR ESI,ESI
00a0b74c  eb79  JMP 0x00a0b7c7
00a0b74e  8d8d7cffffff  LEA ECX,[EBP + 0xffffff7c]
00a0b754  8bd6  MOV EDX,ESI
00a0b756  8bc3  MOV EAX,EBX
00a0b758  8b38  MOV EDI,dword ptr [EAX]
00a0b75a  ff570c  CALL dword ptr [EDI + 0xc]
00a0b75d  8b857cffffff  MOV EAX,dword ptr [EBP + 0xffffff7c]
00a0b763  8d5580  LEA EDX,[EBP + -0x80]
00a0b766  e8910ea2ff  CALL 0x0042c5fc
00a0b76b  837d8000  CMP dword ptr [EBP + -0x80],0x0
00a0b76f  750b  JNZ 0x00a0b77c
00a0b771  8bd6  MOV EDX,ESI
00a0b773  8bc3  MOV EAX,EBX
00a0b775  8b08  MOV ECX,dword ptr [EAX]
00a0b777  ff514c  CALL dword ptr [ECX + 0x4c]
00a0b77a  eb4b  JMP 0x00a0b7c7
00a0b77c  8d8d78ffffff  LEA ECX,[EBP + 0xffffff78]
00a0b782  8bd6  MOV EDX,ESI
00a0b784  8bc3  MOV EAX,EBX
00a0b786  8b38  MOV EDI,dword ptr [EAX]
00a0b788  ff570c  CALL dword ptr [EDI + 0xc]
00a0b78b  8b9578ffffff  MOV EDX,dword ptr [EBP + 0xffffff78]
00a0b791  b85cb8a000  MOV EAX,0xa0b85c
00a0b796  e88dc5a2ff  CALL 0x00437d28
00a0b79b  85c0  TEST EAX,EAX
00a0b79d  7e27  JLE 0x00a0b7c6
00a0b79f  8b4508  MOV EAX,dword ptr [EBP + 0x8]
00a0b7a2  50  PUSH EAX
00a0b7a3  8d8d74ffffff  LEA ECX,[EBP + 0xffffff74]
00a0b7a9  8bd6  MOV EDX,ESI
00a0b7ab  8bc3  MOV EAX,EBX
00a0b7ad  8b38  MOV EDI,dword ptr [EAX]
00a0b7af  ff570c  CALL dword ptr [EDI + 0xc]
00a0b7b2  8b8574ffffff  MOV EAX,dword ptr [EBP + 0xffffff74]
00a0b7b8  b901000000  MOV ECX,0x1
00a0b7bd  66ba5e00  MOV DX,0x5e
00a0b7c1  e8a677faff  CALL 0x009b2f6c
00a0b7c6  46  INC ESI
00a0b7c7  8bc3  MOV EAX,EBX
00a0b7c9  8b10  MOV EDX,dword ptr [EAX]
00a0b7cb  ff5214  CALL dword ptr [EDX + 0x14]
00a0b7ce  3bf0  CMP ESI,EAX
00a0b7d0  0f8c78ffffff  JL 0x00a0b74e
00a0b7d6  33c0  XOR EAX,EAX
00a0b7d8  5a  POP EDX
00a0b7d9  59  POP ECX
00a0b7da  59  POP ECX
00a0b7db  648910  MOV dword ptr FS:[EAX],EDX
00a0b7de  6805b8a000  PUSH 0xa0b805
00a0b7e3  8d8574ffffff  LEA EAX,[EBP + 0xffffff74]
00a0b7e9  ba04000000  MOV EDX,0x4
00a0b7ee  e841f89fff  CALL 0x0040b034
00a0b7f3  8d450c  LEA EAX,[EBP + 0xc]
00a0b7f6  e8d9f79fff  CALL 0x0040afd4
00a0b7fb  58  POP EAX
00a0b7fc  ffe0  JMP EAX
