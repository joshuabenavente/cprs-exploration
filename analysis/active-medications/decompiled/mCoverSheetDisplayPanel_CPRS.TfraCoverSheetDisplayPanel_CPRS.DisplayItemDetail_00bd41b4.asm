; Static instruction listing. Function bodies and indirect exception flow require review.
00bd41b4  55  PUSH EBP
00bd41b5  8bec  MOV EBP,ESP
00bd41b7  6a00  PUSH 0x0
00bd41b9  6a00  PUSH 0x0
00bd41bb  6a00  PUSH 0x0
00bd41bd  6a00  PUSH 0x0
00bd41bf  6a00  PUSH 0x0
00bd41c1  6a00  PUSH 0x0
00bd41c3  6a00  PUSH 0x0
00bd41c5  6a00  PUSH 0x0
00bd41c7  53  PUSH EBX
00bd41c8  56  PUSH ESI
00bd41c9  57  PUSH EDI
00bd41ca  8bf1  MOV ESI,ECX
00bd41cc  8955f4  MOV dword ptr [EBP + -0xc],EDX
00bd41cf  8bd8  MOV EBX,EAX
00bd41d1  33c0  XOR EAX,EAX
00bd41d3  55  PUSH EBP
00bd41d4  683543bd00  PUSH 0xbd4335
00bd41d9  64ff30  PUSH dword ptr FS:[EAX]
00bd41dc  648920  MOV dword ptr FS:[EAX],ESP
00bd41df  85f6  TEST ESI,ESI
00bd41e1  0f840f010000  JZ 0x00bd42f6
00bd41e7  8bc6  MOV EAX,ESI
00bd41e9  e81289aaff  CALL 0x0067cb00
00bd41ee  898360030000  MOV dword ptr [EBX + 0x360],EAX
00bd41f4  807d0800  CMP byte ptr [EBP + 0x8],0x0
00bd41f8  0f8502010000  JNZ 0x00bd4300
00bd41fe  837e2800  CMP dword ptr [ESI + 0x28],0x0
00bd4202  0f84f8000000  JZ 0x00bd4300
00bd4208  8d4dec  LEA ECX,[EBP + -0x14]
00bd420b  8b4628  MOV EAX,dword ptr [ESI + 0x28]
00bd420e  ba01000000  MOV EDX,0x1
00bd4213  e824b7ffff  CALL 0x00bcf93c
00bd4218  837dec00  CMP dword ptr [EBP + -0x14],0x0
00bd421c  0f84de000000  JZ 0x00bd4300
00bd4222  33d2  XOR EDX,EDX
00bd4224  55  PUSH EBP
00bd4225  68ef42bd00  PUSH 0xbd42ef
00bd422a  64ff32  PUSH dword ptr FS:[EDX]
00bd422d  648922  MOV dword ptr FS:[EDX],ESP
00bd4230  b201  MOV DL,0x1
00bd4232  a100734a00  MOV EAX,[0x004a7300]
00bd4237  e8b83f90ff  CALL 0x004d81f4
00bd423c  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bd423f  8b5628  MOV EDX,dword ptr [ESI + 0x28]
00bd4242  8b4df0  MOV ECX,dword ptr [EBP + -0x10]
00bd4245  8bc3  MOV EAX,EBX
00bd4247  8b38  MOV EDI,dword ptr [EAX]
00bd4249  ff9710020000  CALL dword ptr [EDI + 0x210]
00bd424f  8d55e8  LEA EDX,[EBP + -0x18]
00bd4252  8bc3  MOV EAX,EBX
00bd4254  8b08  MOV ECX,dword ptr [EAX]
00bd4256  ff9198010000  CALL dword ptr [ECX + 0x198]
00bd425c  ff75e8  PUSH dword ptr [EBP + -0x18]
00bd425f  685443bd00  PUSH 0xbd4354
00bd4264  8d55e4  LEA EDX,[EBP + -0x1c]
00bd4267  8bc6  MOV EAX,ESI
00bd4269  8b08  MOV ECX,dword ptr [EAX]
00bd426b  ff5118  CALL dword ptr [ECX + 0x18]
00bd426e  ff75e4  PUSH dword ptr [EBP + -0x1c]
00bd4271  8d45f8  LEA EAX,[EBP + -0x8]
00bd4274  ba03000000  MOV EDX,0x3
00bd4279  e8967f83ff  CALL 0x0040c214
00bd427e  8d45fc  LEA EAX,[EBP + -0x4]
00bd4281  e8b2c483ff  CALL 0x00410738
00bd4286  50  PUSH EAX
00bd4287  687443bd00  PUSH 0xbd4374
00bd428c  8d55e0  LEA EDX,[EBP + -0x20]
00bd428f  8bc3  MOV EAX,EBX
00bd4291  8b08  MOV ECX,dword ptr [EAX]
00bd4293  ff91ec010000  CALL dword ptr [ECX + 0x1ec]
00bd4299  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00bd429c  50  PUSH EAX
00bd429d  8b00  MOV EAX,dword ptr [EAX]
00bd429f  ff10  CALL dword ptr [EAX]
00bd42a1  85c0  TEST EAX,EAX
00bd42a3  751b  JNZ 0x00bd42c0
00bd42a5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bd42a8  8b10  MOV EDX,dword ptr [EAX]
00bd42aa  ff5258  CALL dword ptr [EDX + 0x58]
00bd42ad  50  PUSH EAX
00bd42ae  8b4df8  MOV ECX,dword ptr [EBP + -0x8]
00bd42b1  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
00bd42b4  8bc3  MOV EAX,EBX
00bd42b6  8b18  MOV EBX,dword ptr [EAX]
00bd42b8  ff9314020000  CALL dword ptr [EBX + 0x214]
00bd42be  eb12  JMP 0x00bd42d2
00bd42c0  6a00  PUSH 0x0
00bd42c2  8b4df8  MOV ECX,dword ptr [EBP + -0x8]
00bd42c5  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
00bd42c8  8bc3  MOV EAX,EBX
00bd42ca  8b18  MOV EBX,dword ptr [EAX]
00bd42cc  ff9314020000  CALL dword ptr [EBX + 0x214]
00bd42d2  33c0  XOR EAX,EAX
00bd42d4  5a  POP EDX
00bd42d5  59  POP ECX
00bd42d6  59  POP ECX
00bd42d7  648910  MOV dword ptr FS:[EAX],EDX
00bd42da  680043bd00  PUSH 0xbd4300
00bd42df  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bd42e2  33d2  XOR EDX,EDX
00bd42e4  8955f0  MOV dword ptr [EBP + -0x10],EDX
00bd42e7  e8d04d83ff  CALL 0x004090bc
00bd42ec  58  POP EAX
00bd42ed  ffe0  JMP EAX
00bd42f6  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00bd42f9  8bc3  MOV EAX,EBX
00bd42fb  e8a4fdffff  CALL 0x00bd40a4
00bd4300  33c0  XOR EAX,EAX
00bd4302  5a  POP EDX
00bd4303  59  POP ECX
00bd4304  59  POP ECX
00bd4305  648910  MOV dword ptr FS:[EAX],EDX
00bd4308  683c43bd00  PUSH 0xbd433c
00bd430d  8d45e0  LEA EAX,[EBP + -0x20]
00bd4310  e823c483ff  CALL 0x00410738
00bd4315  8d45e4  LEA EAX,[EBP + -0x1c]
00bd4318  ba03000000  MOV EDX,0x3
00bd431d  e8126d83ff  CALL 0x0040b034
00bd4322  8d45f8  LEA EAX,[EBP + -0x8]
00bd4325  e8aa6c83ff  CALL 0x0040afd4
00bd432a  8d45fc  LEA EAX,[EBP + -0x4]
00bd432d  e806c483ff  CALL 0x00410738
00bd4332  58  POP EAX
00bd4333  ffe0  JMP EAX
