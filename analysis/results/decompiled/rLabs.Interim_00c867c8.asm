; Static instruction listing. Function bodies and indirect exception flow require review.
00c867c8  55  PUSH EBP
00c867c9  8bec  MOV EBP,ESP
00c867cb  83c4cc  ADD ESP,-0x34
00c867ce  53  PUSH EBX
00c867cf  56  PUSH ESI
00c867d0  894dfc  MOV dword ptr [EBP + -0x4],ECX
00c867d3  8bf2  MOV ESI,EDX
00c867d5  8bd8  MOV EBX,EAX
00c867d7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00c867da  e8e94878ff  CALL 0x0040b0c8
00c867df  33c0  XOR EAX,EAX
00c867e1  55  PUSH EBP
00c867e2  686968c800  PUSH 0xc86869
00c867e7  64ff30  PUSH dword ptr FS:[EAX]
00c867ea  648920  MOV dword ptr FS:[EAX],ESP
00c867ed  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00c867f0  85c0  TEST EAX,EAX
00c867f2  7403  JZ 0x00c867f7
00c867f4  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00c867f7  85c0  TEST EAX,EAX
00c867f9  7e3e  JLE 0x00c86839
00c867fb  53  PUSH EBX
00c867fc  6a00  PUSH 0x0
00c867fe  8975e4  MOV dword ptr [EBP + -0x1c],ESI
00c86801  c645e811  MOV byte ptr [EBP + -0x18],0x11
00c86805  dd4510  FLD double ptr [EBP + 0x10]
00c86808  db7dd8  FSTP extended double ptr [EBP + -0x28]
00c8680b  9b  WAIT
00c8680c  8d45d8  LEA EAX,[EBP + -0x28]
00c8680f  8945ec  MOV dword ptr [EBP + -0x14],EAX
00c86812  c645f003  MOV byte ptr [EBP + -0x10],0x3
00c86816  dd4508  FLD double ptr [EBP + 0x8]
00c86819  db7dcc  FSTP extended double ptr [EBP + -0x34]
00c8681c  9b  WAIT
00c8681d  8d45cc  LEA EAX,[EBP + -0x34]
00c86820  8945f4  MOV dword ptr [EBP + -0xc],EAX
00c86823  c645f803  MOV byte ptr [EBP + -0x8],0x3
00c86827  8d55e4  LEA EDX,[EBP + -0x1c]
00c8682a  b902000000  MOV ECX,0x2
00c8682f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00c86832  e84972d2ff  CALL 0x009ada80
00c86837  eb18  JMP 0x00c86851
00c86839  ba8468c800  MOV EDX,0xc86884
00c8683e  8bc3  MOV EAX,EBX
00c86840  8b08  MOV ECX,dword ptr [EAX]
00c86842  ff513c  CALL dword ptr [ECX + 0x3c]
00c86845  bafc68c800  MOV EDX,0xc868fc
00c8684a  8bc3  MOV EAX,EBX
00c8684c  8b08  MOV ECX,dword ptr [EAX]
00c8684e  ff513c  CALL dword ptr [ECX + 0x3c]
00c86851  33c0  XOR EAX,EAX
00c86853  5a  POP EDX
00c86854  59  POP ECX
00c86855  59  POP ECX
00c86856  648910  MOV dword ptr FS:[EAX],EDX
00c86859  687068c800  PUSH 0xc86870
00c8685e  8d45fc  LEA EAX,[EBP + -0x4]
00c86861  e86e4778ff  CALL 0x0040afd4
00c86866  58  POP EAX
00c86867  ffe0  JMP EAX
