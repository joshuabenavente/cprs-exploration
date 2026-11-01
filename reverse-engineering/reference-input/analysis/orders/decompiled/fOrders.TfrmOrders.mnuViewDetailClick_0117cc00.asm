; Static instruction listing. Function bodies and indirect exception flow require review.
0117cc00  55  PUSH EBP
0117cc01  8bec  MOV EBP,ESP
0117cc03  83c4b4  ADD ESP,-0x4c
0117cc06  53  PUSH EBX
0117cc07  33c9  XOR ECX,ECX
0117cc09  894db4  MOV dword ptr [EBP + -0x4c],ECX
0117cc0c  894dbc  MOV dword ptr [EBP + -0x44],ECX
0117cc0f  894db8  MOV dword ptr [EBP + -0x48],ECX
0117cc12  894dc0  MOV dword ptr [EBP + -0x40],ECX
0117cc15  894de4  MOV dword ptr [EBP + -0x1c],ECX
0117cc18  894de0  MOV dword ptr [EBP + -0x20],ECX
0117cc1b  8955c4  MOV dword ptr [EBP + -0x3c],EDX
0117cc1e  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117cc21  33c0  XOR EAX,EAX
0117cc23  55  PUSH EBP
0117cc24  687ccf1701  PUSH 0x117cf7c
0117cc29  64ff30  PUSH dword ptr FS:[EAX]
0117cc2c  648920  MOV dword ptr FS:[EAX],ESP
0117cc2f  ba94cf1701  MOV EDX,0x117cf94
0117cc34  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117cc37  e8d84a0000  CALL 0x01181714
0117cc3c  84c0  TEST AL,AL
0117cc3e  0f850e030000  JNZ 0x0117cf52
0117cc44  b201  MOV DL,0x1
0117cc46  a100734a00  MOV EAX,[0x004a7300]
0117cc4b  e8a4b535ff  CALL 0x004d81f4
0117cc50  8945ec  MOV dword ptr [EBP + -0x14],EAX
0117cc53  33c0  XOR EAX,EAX
0117cc55  8945f0  MOV dword ptr [EBP + -0x10],EAX
0117cc58  33c0  XOR EAX,EAX
0117cc5a  55  PUSH EBP
0117cc5b  684bcf1701  PUSH 0x117cf4b
0117cc60  64ff30  PUSH dword ptr FS:[EAX]
0117cc63  648920  MOV dword ptr FS:[EAX],ESP
0117cc66  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117cc69  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117cc6f  8945dc  MOV dword ptr [EBP + -0x24],EAX
0117cc72  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cc75  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cc7b  8b10  MOV EDX,dword ptr [EAX]
0117cc7d  ff5214  CALL dword ptr [EDX + 0x14]
0117cc80  48  DEC EAX
0117cc81  85c0  TEST EAX,EAX
0117cc83  0f8caa020000  JL 0x0117cf33
0117cc89  40  INC EAX
0117cc8a  8945d8  MOV dword ptr [EBP + -0x28],EAX
0117cc8d  c745f800000000  MOV dword ptr [EBP + -0x8],0x0
0117cc94  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cc97  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cc9a  e8d14f4bff  CALL 0x00631c70
0117cc9f  84c0  TEST AL,AL
0117cca1  0f8480020000  JZ 0x0117cf27
0117cca7  b83cd01701  MOV EAX,0x117d03c
0117ccac  e83b9483ff  CALL 0x009b60ec
0117ccb1  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117ccb4  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117ccba  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117ccbd  8b08  MOV ECX,dword ptr [EAX]
0117ccbf  ff5118  CALL dword ptr [ECX + 0x18]
0117ccc2  8b500c  MOV EDX,dword ptr [EAX + 0xc]
0117ccc5  8d45e4  LEA EAX,[EBP + -0x1c]
0117ccc8  e83fe728ff  CALL 0x0040b40c
0117cccd  8d45e0  LEA EAX,[EBP + -0x20]
0117ccd0  50  PUSH EAX
0117ccd1  b901000000  MOV ECX,0x1
0117ccd6  66ba3b00  MOV DX,0x3b
0117ccda  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117ccdd  e80ae061ff  CALL 0x0079acec
0117cce2  6a00  PUSH 0x0
0117cce4  6a00  PUSH 0x0
0117cce6  6a00  PUSH 0x0
0117cce8  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
0117cceb  e8404e83ff  CALL 0x009b1b30
0117ccf0  d9ee  FLDZ
0117ccf2  dae9  FUCOMPP
0117ccf4  9bdfe0  FSTSW AX
0117ccf7  f6c444  TEST AH,0x44
0117ccfa  7a13  JP 0x0117cd0f
0117ccfc  33c9  XOR ECX,ECX
0117ccfe  33d2  XOR EDX,EDX
0117cd00  b880d01701  MOV EAX,0x117d080
0117cd05  e892f461ff  CALL 0x0079c19c
0117cd0a  e9dd010000  JMP 0x0117ceec
0117cd0f  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
0117cd12  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117cd15  e892de0500  CALL 0x011dabac
0117cd1a  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cd1d  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cd23  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cd26  8b08  MOV ECX,dword ptr [EAX]
0117cd28  ff5118  CALL dword ptr [ECX + 0x18]
0117cd2b  8b4064  MOV EAX,dword ptr [EAX + 0x64]
0117cd2e  baf0d01701  MOV EDX,0x117d0f0
0117cd33  e8ecf528ff  CALL 0x0040c324
0117cd38  0f8484000000  JZ 0x0117cdc2
0117cd3e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cd41  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cd47  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cd4a  8b08  MOV ECX,dword ptr [EAX]
0117cd4c  ff5118  CALL dword ptr [ECX + 0x18]
0117cd4f  8b4064  MOV EAX,dword ptr [EAX + 0x64]
0117cd52  ba14d11701  MOV EDX,0x117d114
0117cd57  e8c8f528ff  CALL 0x0040c324
0117cd5c  7464  JZ 0x0117cdc2
0117cd5e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cd61  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cd67  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cd6a  8b08  MOV ECX,dword ptr [EAX]
0117cd6c  ff5118  CALL dword ptr [ECX + 0x18]
0117cd6f  8b4064  MOV EAX,dword ptr [EAX + 0x64]
0117cd72  ba34d11701  MOV EDX,0x117d134
0117cd77  e8a8f528ff  CALL 0x0040c324
0117cd7c  7444  JZ 0x0117cdc2
0117cd7e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cd81  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cd87  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cd8a  8b08  MOV ECX,dword ptr [EAX]
0117cd8c  ff5118  CALL dword ptr [ECX + 0x18]
0117cd8f  8b4064  MOV EAX,dword ptr [EAX + 0x64]
0117cd92  ba64d11701  MOV EDX,0x117d164
0117cd97  e888f528ff  CALL 0x0040c324
0117cd9c  7424  JZ 0x0117cdc2
0117cd9e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cda1  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117cda7  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cdaa  8b08  MOV ECX,dword ptr [EAX]
0117cdac  ff5118  CALL dword ptr [ECX + 0x18]
0117cdaf  8b4064  MOV EAX,dword ptr [EAX + 0x64]
0117cdb2  ba98d11701  MOV EDX,0x117d198
0117cdb7  e868f528ff  CALL 0x0040c324
0117cdbc  0f858d000000  JNZ 0x0117ce4f
0117cdc2  33d2  XOR EDX,EDX
0117cdc4  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cdc7  8b08  MOV ECX,dword ptr [EAX]
0117cdc9  ff513c  CALL dword ptr [ECX + 0x3c]
0117cdcc  8d4dc0  LEA ECX,[EBP + -0x40]
0117cdcf  ba4a000000  MOV EDX,0x4a
0117cdd4  66b83d00  MOV AX,0x3d
0117cdd8  e86ff928ff  CALL 0x0040c74c
0117cddd  8b55c0  MOV EDX,dword ptr [EBP + -0x40]
0117cde0  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cde3  8b08  MOV ECX,dword ptr [EAX]
0117cde5  ff513c  CALL dword ptr [ECX + 0x3c]
0117cde8  33d2  XOR EDX,EDX
0117cdea  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cded  8b08  MOV ECX,dword ptr [EAX]
0117cdef  ff513c  CALL dword ptr [ECX + 0x3c]
0117cdf2  b201  MOV DL,0x1
0117cdf4  a100734a00  MOV EAX,[0x004a7300]
0117cdf9  e8f6b335ff  CALL 0x004d81f4
0117cdfe  8945e8  MOV dword ptr [EBP + -0x18],EAX
0117ce01  33c0  XOR EAX,EAX
0117ce03  55  PUSH EBP
0117ce04  6848ce1701  PUSH 0x117ce48
0117ce09  64ff30  PUSH dword ptr FS:[EAX]
0117ce0c  648920  MOV dword ptr FS:[EAX],ESP
0117ce0f  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
0117ce12  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
0117ce15  e8ea0f96ff  CALL 0x00adde04
0117ce1a  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
0117ce1d  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
0117ce20  e80b7283ff  CALL 0x009b4030
0117ce25  33c0  XOR EAX,EAX
0117ce27  5a  POP EDX
0117ce28  59  POP ECX
0117ce29  59  POP ECX
0117ce2a  648910  MOV dword ptr FS:[EAX],EDX
0117ce2d  684fce1701  PUSH 0x117ce4f
0117ce32  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
0117ce35  8945d0  MOV dword ptr [EBP + -0x30],EAX
0117ce38  33c0  XOR EAX,EAX
0117ce3a  8945e8  MOV dword ptr [EBP + -0x18],EAX
0117ce3d  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
0117ce40  e877c228ff  CALL 0x004090bc
0117ce45  58  POP EAX
0117ce46  ffe0  JMP EAX
0117ce4f  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
0117ce52  e88de70500  CALL 0x011db5e4
0117ce57  48  DEC EAX
0117ce58  7573  JNZ 0x0117cecd
0117ce5a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117ce5d  8b10  MOV EDX,dword ptr [EAX]
0117ce5f  ff5214  CALL dword ptr [EDX + 0x14]
0117ce62  48  DEC EAX
0117ce63  85c0  TEST EAX,EAX
0117ce65  7c55  JL 0x0117cebc
0117ce67  40  INC EAX
0117ce68  8945d4  MOV dword ptr [EBP + -0x2c],EAX
0117ce6b  c745f400000000  MOV dword ptr [EBP + -0xc],0x0
0117ce72  8d4db8  LEA ECX,[EBP + -0x48]
0117ce75  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0117ce78  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117ce7b  8b18  MOV EBX,dword ptr [EAX]
0117ce7d  ff530c  CALL dword ptr [EBX + 0xc]
0117ce80  8b45b8  MOV EAX,dword ptr [EBP + -0x48]
0117ce83  8d55bc  LEA EDX,[EBP + -0x44]
0117ce86  e81df32aff  CALL 0x0042c1a8
0117ce8b  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
0117ce8e  8945cc  MOV dword ptr [EBP + -0x34],EAX
0117ce91  b901000000  MOV ECX,0x1
0117ce96  8b55cc  MOV EDX,dword ptr [EBP + -0x34]
0117ce99  b8b8d11701  MOV EAX,0x117d1b8
0117ce9e  e80df628ff  CALL 0x0040c4b0
0117cea3  8945c8  MOV dword ptr [EBP + -0x38],EAX
0117cea6  837dc800  CMP dword ptr [EBP + -0x38],0x0
0117ceaa  7e08  JLE 0x0117ceb4
0117ceac  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0117ceaf  8945f0  MOV dword ptr [EBP + -0x10],EAX
0117ceb2  eb08  JMP 0x0117cebc
0117ceb4  ff45f4  INC dword ptr [EBP + -0xc]
0117ceb7  ff4dd4  DEC dword ptr [EBP + -0x2c]
0117ceba  75b6  JNZ 0x0117ce72
0117cebc  837df000  CMP dword ptr [EBP + -0x10],0x0
0117cec0  7e0b  JLE 0x0117cecd
0117cec2  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
0117cec5  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cec8  8b08  MOV ECX,dword ptr [EAX]
0117ceca  ff514c  CALL dword ptr [ECX + 0x4c]
0117cecd  6a01  PUSH 0x1
0117cecf  8d45b4  LEA EAX,[EBP + -0x4c]
0117ced2  8b4de4  MOV ECX,dword ptr [EBP + -0x1c]
0117ced5  bad4d11701  MOV EDX,0x117d1d4
0117ceda  e8adf228ff  CALL 0x0040c18c
0117cedf  8b55b4  MOV EDX,dword ptr [EBP + -0x4c]
0117cee2  b101  MOV CL,0x1
0117cee4  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cee7  e800b1e8ff  CALL 0x01007fec
0117ceec  33c0  XOR EAX,EAX
0117ceee  e8f99183ff  CALL 0x009b60ec
0117cef3  a1c4f72401  MOV EAX,[0x0124f7c4]
0117cef8  8b00  MOV EAX,dword ptr [EAX]
0117cefa  e8e9efe6ff  CALL 0x00febee8
0117ceff  84c0  TEST AL,AL
0117cf01  7510  JNZ 0x0117cf13
0117cf03  a1c4f72401  MOV EAX,[0x0124f7c4]
0117cf08  8b00  MOV EAX,dword ptr [EAX]
0117cf0a  e8c179e8ff  CALL 0x010048d0
0117cf0f  84c0  TEST AL,AL
0117cf11  7407  JZ 0x0117cf1a
0117cf13  e81cd828ff  CALL 0x0040a734
0117cf18  eb38  JMP 0x0117cf52
0117cf1a  33c9  XOR ECX,ECX
0117cf1c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117cf1f  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117cf22  e88d4d4bff  CALL 0x00631cb4
0117cf27  ff45f8  INC dword ptr [EBP + -0x8]
0117cf2a  ff4dd8  DEC dword ptr [EBP + -0x28]
0117cf2d  0f8561fdffff  JNZ 0x0117cc94
0117cf33  33c0  XOR EAX,EAX
0117cf35  5a  POP EDX
0117cf36  59  POP ECX
0117cf37  59  POP ECX
0117cf38  648910  MOV dword ptr FS:[EAX],EDX
0117cf3b  6852cf1701  PUSH 0x117cf52
0117cf40  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117cf43  e874c128ff  CALL 0x004090bc
0117cf48  58  POP EAX
0117cf49  ffe0  JMP EAX
0117cf52  33c0  XOR EAX,EAX
0117cf54  5a  POP EDX
0117cf55  59  POP ECX
0117cf56  59  POP ECX
0117cf57  648910  MOV dword ptr FS:[EAX],EDX
0117cf5a  6883cf1701  PUSH 0x117cf83
0117cf5f  8d45b4  LEA EAX,[EBP + -0x4c]
0117cf62  ba04000000  MOV EDX,0x4
0117cf67  e8c8e028ff  CALL 0x0040b034
0117cf6c  8d45e0  LEA EAX,[EBP + -0x20]
0117cf6f  ba02000000  MOV EDX,0x2
0117cf74  e8bbe028ff  CALL 0x0040b034
0117cf79  58  POP EAX
0117cf7a  ffe0  JMP EAX
