; Static instruction listing. Function bodies and indirect exception flow require review.
00add94c  55  PUSH EBP
00add94d  8bec  MOV EBP,ESP
00add94f  b90f000000  MOV ECX,0xf
00add954  6a00  PUSH 0x0
00add956  6a00  PUSH 0x0
00add958  49  DEC ECX
00add959  75f9  JNZ 0x00add954
00add95b  53  PUSH EBX
00add95c  8955f8  MOV dword ptr [EBP + -0x8],EDX
00add95f  8945fc  MOV dword ptr [EBP + -0x4],EAX
00add962  33c0  XOR EAX,EAX
00add964  55  PUSH EBP
00add965  68f0dcad00  PUSH 0xaddcf0
00add96a  64ff30  PUSH dword ptr FS:[EAX]
00add96d  648920  MOV dword ptr FS:[EAX],ESP
00add970  8d45ec  LEA EAX,[EBP + -0x14]
00add973  ba08ddad00  MOV EDX,0xaddd08
00add978  e88fda92ff  CALL 0x0040b40c
00add97d  a1e0f22401  MOV EAX,[0x0124f2e0]
00add982  8b00  MOV EAX,dword ptr [EAX]
00add984  80783500  CMP byte ptr [EAX + 0x35],0x0
00add988  7434  JZ 0x00add9be
00add98a  a1e0f22401  MOV EAX,[0x0124f2e0]
00add98f  8b00  MOV EAX,dword ptr [EAX]
00add991  8b4040  MOV EAX,dword ptr [EAX + 0x40]
00add994  ba1cddad00  MOV EDX,0xaddd1c
00add999  e886e992ff  CALL 0x0040c324
00add99e  750f  JNZ 0x00add9af
00add9a0  8d45f0  LEA EAX,[EBP + -0x10]
00add9a3  ba2cddad00  MOV EDX,0xaddd2c
00add9a8  e85fda92ff  CALL 0x0040b40c
00add9ad  eb1c  JMP 0x00add9cb
00add9af  8d45f0  LEA EAX,[EBP + -0x10]
00add9b2  ba40ddad00  MOV EDX,0xaddd40
00add9b7  e850da92ff  CALL 0x0040b40c
00add9bc  eb0d  JMP 0x00add9cb
00add9be  8d45f0  LEA EAX,[EBP + -0x10]
00add9c1  ba50ddad00  MOV EDX,0xaddd50
00add9c6  e841da92ff  CALL 0x0040b40c
00add9cb  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00add9ce  8b10  MOV EDX,dword ptr [EAX]
00add9d0  ff5214  CALL dword ptr [EDX + 0x14]
00add9d3  48  DEC EAX
00add9d4  83f800  CMP EAX,0x0
00add9d7  0f8cc5020000  JL 0x00addca2
00add9dd  8945f4  MOV dword ptr [EBP + -0xc],EAX
00add9e0  c645e700  MOV byte ptr [EBP + -0x19],0x0
00add9e4  8d45d0  LEA EAX,[EBP + -0x30]
00add9e7  50  PUSH EAX
00add9e8  8d45cc  LEA EAX,[EBP + -0x34]
00add9eb  50  PUSH EAX
00add9ec  8d4dc8  LEA ECX,[EBP + -0x38]
00add9ef  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00add9f2  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00add9f5  8b18  MOV EBX,dword ptr [EAX]
00add9f7  ff530c  CALL dword ptr [EBX + 0xc]
00add9fa  8b45c8  MOV EAX,dword ptr [EBP + -0x38]
00add9fd  b901000000  MOV ECX,0x1
00adda02  66ba5e00  MOV DX,0x5e
00adda06  e86155edff  CALL 0x009b2f6c
00adda0b  8b45cc  MOV EAX,dword ptr [EBP + -0x34]
00adda0e  b902000000  MOV ECX,0x2
00adda13  66ba3b00  MOV DX,0x3b
00adda17  e85055edff  CALL 0x009b2f6c
00adda1c  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00adda1f  8945e0  MOV dword ptr [EBP + -0x20],EAX
00adda22  b901000000  MOV ECX,0x1
00adda27  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
00adda2a  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00adda2d  e87eea92ff  CALL 0x0040c4b0
00adda32  8945dc  MOV dword ptr [EBP + -0x24],EAX
00adda35  837ddc00  CMP dword ptr [EBP + -0x24],0x0
00adda39  7536  JNZ 0x00adda71
00adda3b  8d45c4  LEA EAX,[EBP + -0x3c]
00adda3e  50  PUSH EAX
00adda3f  8d4dc0  LEA ECX,[EBP + -0x40]
00adda42  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00adda45  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00adda48  8b18  MOV EBX,dword ptr [EAX]
00adda4a  ff530c  CALL dword ptr [EBX + 0xc]
00adda4d  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
00adda50  b905000000  MOV ECX,0x5
00adda55  66ba5e00  MOV DX,0x5e
00adda59  e80e55edff  CALL 0x009b2f6c
00adda5e  8b45c4  MOV EAX,dword ptr [EBP + -0x3c]
00adda61  ba60ddad00  MOV EDX,0xaddd60
00adda66  e8b9e892ff  CALL 0x0040c324
00adda6b  7404  JZ 0x00adda71
00adda6d  c645e701  MOV byte ptr [EBP + -0x19],0x1
00adda71  8d45bc  LEA EAX,[EBP + -0x44]
00adda74  50  PUSH EAX
00adda75  8d4db8  LEA ECX,[EBP + -0x48]
00adda78  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00adda7b  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00adda7e  8b18  MOV EBX,dword ptr [EAX]
00adda80  ff530c  CALL dword ptr [EBX + 0xc]
00adda83  8b45b8  MOV EAX,dword ptr [EBP + -0x48]
00adda86  b901000000  MOV ECX,0x1
00adda8b  66ba5e00  MOV DX,0x5e
00adda8f  e8d854edff  CALL 0x009b2f6c
00adda94  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
00adda97  8945d8  MOV dword ptr [EBP + -0x28],EAX
00adda9a  b901000000  MOV ECX,0x1
00adda9f  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
00addaa2  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00addaa5  e806ea92ff  CALL 0x0040c4b0
00addaaa  8945d4  MOV dword ptr [EBP + -0x2c],EAX
00addaad  837dd400  CMP dword ptr [EBP + -0x2c],0x0
00addab1  7e5a  JLE 0x00addb0d
00addab3  c645e700  MOV byte ptr [EBP + -0x19],0x0
00addab7  8d4de8  LEA ECX,[EBP + -0x18]
00addaba  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addabd  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addac0  8b18  MOV EBX,dword ptr [EAX]
00addac2  ff530c  CALL dword ptr [EBX + 0xc]
00addac5  8d45b0  LEA EAX,[EBP + -0x50]
00addac8  50  PUSH EAX
00addac9  b902000000  MOV ECX,0x2
00addace  66ba5e00  MOV DX,0x5e
00addad2  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00addad5  e89254edff  CALL 0x009b2f6c
00addada  8b4db0  MOV ECX,dword ptr [EBP + -0x50]
00addadd  8d45b4  LEA EAX,[EBP + -0x4c]
00addae0  ba70ddad00  MOV EDX,0xaddd70
00addae5  e8a2e692ff  CALL 0x0040c18c
00addaea  8b45b4  MOV EAX,dword ptr [EBP + -0x4c]
00addaed  50  PUSH EAX
00addaee  8d45e8  LEA EAX,[EBP + -0x18]
00addaf1  b902000000  MOV ECX,0x2
00addaf6  66ba5e00  MOV DX,0x5e
00addafa  e81556edff  CALL 0x009b3114
00addaff  8b4de8  MOV ECX,dword ptr [EBP + -0x18]
00addb02  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addb05  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addb08  8b18  MOV EBX,dword ptr [EAX]
00addb0a  ff5320  CALL dword ptr [EBX + 0x20]
00addb0d  8d45ac  LEA EAX,[EBP + -0x54]
00addb10  50  PUSH EAX
00addb11  8d4da8  LEA ECX,[EBP + -0x58]
00addb14  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addb17  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addb1a  8b18  MOV EBX,dword ptr [EAX]
00addb1c  ff530c  CALL dword ptr [EBX + 0xc]
00addb1f  8b45a8  MOV EAX,dword ptr [EBP + -0x58]
00addb22  b905000000  MOV ECX,0x5
00addb27  66ba5e00  MOV DX,0x5e
00addb2b  e83c54edff  CALL 0x009b2f6c
00addb30  8b45ac  MOV EAX,dword ptr [EBP + -0x54]
00addb33  ba60ddad00  MOV EDX,0xaddd60
00addb38  e8e7e792ff  CALL 0x0040c324
00addb3d  755a  JNZ 0x00addb99
00addb3f  c645e700  MOV byte ptr [EBP + -0x19],0x0
00addb43  8d4de8  LEA ECX,[EBP + -0x18]
00addb46  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addb49  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addb4c  8b18  MOV EBX,dword ptr [EAX]
00addb4e  ff530c  CALL dword ptr [EBX + 0xc]
00addb51  8d45a0  LEA EAX,[EBP + -0x60]
00addb54  50  PUSH EAX
00addb55  b902000000  MOV ECX,0x2
00addb5a  66ba5e00  MOV DX,0x5e
00addb5e  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00addb61  e80654edff  CALL 0x009b2f6c
00addb66  8b4da0  MOV ECX,dword ptr [EBP + -0x60]
00addb69  8d45a4  LEA EAX,[EBP + -0x5c]
00addb6c  ba90ddad00  MOV EDX,0xaddd90
00addb71  e816e692ff  CALL 0x0040c18c
00addb76  8b45a4  MOV EAX,dword ptr [EBP + -0x5c]
00addb79  50  PUSH EAX
00addb7a  8d45e8  LEA EAX,[EBP + -0x18]
00addb7d  b902000000  MOV ECX,0x2
00addb82  66ba5e00  MOV DX,0x5e
00addb86  e88955edff  CALL 0x009b3114
00addb8b  8b4de8  MOV ECX,dword ptr [EBP + -0x18]
00addb8e  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addb91  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addb94  8b18  MOV EBX,dword ptr [EAX]
00addb96  ff5320  CALL dword ptr [EBX + 0x20]
00addb99  8d459c  LEA EAX,[EBP + -0x64]
00addb9c  50  PUSH EAX
00addb9d  8d4d98  LEA ECX,[EBP + -0x68]
00addba0  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addba3  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addba6  8b18  MOV EBX,dword ptr [EAX]
00addba8  ff530c  CALL dword ptr [EBX + 0xc]
00addbab  8b4598  MOV EAX,dword ptr [EBP + -0x68]
00addbae  b904000000  MOV ECX,0x4
00addbb3  66ba5e00  MOV DX,0x5e
00addbb7  e8b053edff  CALL 0x009b2f6c
00addbbc  8b459c  MOV EAX,dword ptr [EBP + -0x64]
00addbbf  e8f0020000  CALL 0x00addeb4
00addbc4  83f802  CMP EAX,0x2
00addbc7  7504  JNZ 0x00addbcd
00addbc9  c645e701  MOV byte ptr [EBP + -0x19],0x1
00addbcd  807de700  CMP byte ptr [EBP + -0x19],0x0
00addbd1  7410  JZ 0x00addbe3
00addbd3  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addbd6  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addbd9  8b08  MOV ECX,dword ptr [EAX]
00addbdb  ff514c  CALL dword ptr [ECX + 0x4c]
00addbde  e9b2000000  JMP 0x00addc95
00addbe3  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00addbe6  ba2cddad00  MOV EDX,0xaddd2c
00addbeb  e834e792ff  CALL 0x0040c324
00addbf0  0f859f000000  JNZ 0x00addc95
00addbf6  8d4de8  LEA ECX,[EBP + -0x18]
00addbf9  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addbfc  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addbff  8b18  MOV EBX,dword ptr [EAX]
00addc01  ff530c  CALL dword ptr [EBX + 0xc]
00addc04  8d4590  LEA EAX,[EBP + -0x70]
00addc07  50  PUSH EAX
00addc08  8d458c  LEA EAX,[EBP + -0x74]
00addc0b  50  PUSH EAX
00addc0c  b901000000  MOV ECX,0x1
00addc11  66ba5e00  MOV DX,0x5e
00addc15  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00addc18  e84f53edff  CALL 0x009b2f6c
00addc1d  8b458c  MOV EAX,dword ptr [EBP + -0x74]
00addc20  b902000000  MOV ECX,0x2
00addc25  66ba3b00  MOV DX,0x3b
00addc29  e83e53edff  CALL 0x009b2f6c
00addc2e  8b4590  MOV EAX,dword ptr [EBP + -0x70]
00addc31  ba50ddad00  MOV EDX,0xaddd50
00addc36  e8e9e692ff  CALL 0x0040c324
00addc3b  0f94c0  SETZ AL
00addc3e  83e07f  AND EAX,0x7f
00addc41  ff3485487f2301  PUSH dword ptr [EAX*0x4 + 0x1237f48]
00addc48  68b4ddad00  PUSH 0xadddb4
00addc4d  8d4588  LEA EAX,[EBP + -0x78]
00addc50  50  PUSH EAX
00addc51  b902000000  MOV ECX,0x2
00addc56  66ba5e00  MOV DX,0x5e
00addc5a  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00addc5d  e80a53edff  CALL 0x009b2f6c
00addc62  ff7588  PUSH dword ptr [EBP + -0x78]
00addc65  8d4594  LEA EAX,[EBP + -0x6c]
00addc68  ba03000000  MOV EDX,0x3
00addc6d  e8a2e592ff  CALL 0x0040c214
00addc72  8b4594  MOV EAX,dword ptr [EBP + -0x6c]
00addc75  50  PUSH EAX
00addc76  8d45e8  LEA EAX,[EBP + -0x18]
00addc79  b902000000  MOV ECX,0x2
00addc7e  66ba5e00  MOV DX,0x5e
00addc82  e88d54edff  CALL 0x009b3114
00addc87  8b4de8  MOV ECX,dword ptr [EBP + -0x18]
00addc8a  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00addc8d  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addc90  8b18  MOV EBX,dword ptr [EAX]
00addc92  ff5320  CALL dword ptr [EBX + 0x20]
00addc95  ff4df4  DEC dword ptr [EBP + -0xc]
00addc98  837df4ff  CMP dword ptr [EBP + -0xc],-0x1
00addc9c  0f853efdffff  JNZ 0x00add9e0
00addca2  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addca5  8b10  MOV EDX,dword ptr [EAX]
00addca7  ff5214  CALL dword ptr [EDX + 0x14]
00addcaa  85c0  TEST EAX,EAX
00addcac  750d  JNZ 0x00addcbb
00addcae  bac8ddad00  MOV EDX,0xadddc8
00addcb3  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addcb6  8b08  MOV ECX,dword ptr [EAX]
00addcb8  ff513c  CALL dword ptr [ECX + 0x3c]
00addcbb  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00addcbe  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00addcc1  e8ee61edff  CALL 0x009b3eb4
00addcc6  33c0  XOR EAX,EAX
00addcc8  5a  POP EDX
00addcc9  59  POP ECX
00addcca  59  POP ECX
00addccb  648910  MOV dword ptr FS:[EAX],EDX
00addcce  68f7dcad00  PUSH 0xaddcf7
00addcd3  8d4588  LEA EAX,[EBP + -0x78]
00addcd6  ba13000000  MOV EDX,0x13
00addcdb  e854d392ff  CALL 0x0040b034
00addce0  8d45e8  LEA EAX,[EBP + -0x18]
00addce3  ba03000000  MOV EDX,0x3
00addce8  e847d392ff  CALL 0x0040b034
00addced  58  POP EAX
00addcee  ffe0  JMP EAX
