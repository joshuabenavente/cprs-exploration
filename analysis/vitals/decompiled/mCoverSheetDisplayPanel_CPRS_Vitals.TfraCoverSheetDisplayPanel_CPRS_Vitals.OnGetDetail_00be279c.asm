; Static instruction listing. Function bodies and indirect exception flow require review.
00be279c  55  PUSH EBP
00be279d  8bec  MOV EBP,ESP
00be279f  51  PUSH ECX
00be27a0  b907000000  MOV ECX,0x7
00be27a5  6a00  PUSH 0x0
00be27a7  6a00  PUSH 0x0
00be27a9  49  DEC ECX
00be27aa  75f9  JNZ 0x00be27a5
00be27ac  51  PUSH ECX
00be27ad  874dfc  XCHG dword ptr [EBP + -0x4],ECX
00be27b0  53  PUSH EBX
00be27b1  56  PUSH ESI
00be27b2  8bd9  MOV EBX,ECX
00be27b4  8bf2  MOV ESI,EDX
00be27b6  33c0  XOR EAX,EAX
00be27b8  55  PUSH EBP
00be27b9  687f29be00  PUSH 0xbe297f
00be27be  64ff30  PUSH dword ptr FS:[EAX]
00be27c1  648920  MOV dword ptr FS:[EAX],ESP
00be27c4  6a00  PUSH 0x0
00be27c6  6a00  PUSH 0x0
00be27c8  ba04000000  MOV EDX,0x4
00be27cd  8bc6  MOV EAX,ESI
00be27cf  e8b8d2feff  CALL 0x00bcfa8c
00be27d4  83c4f8  ADD ESP,-0x8
00be27d7  dd1c24  FSTP double ptr [ESP]
00be27da  9b  WAIT
00be27db  e834e6dcff  CALL 0x009b0e14
00be27e0  dd5df8  FSTP double ptr [EBP + -0x8]
00be27e3  9b  WAIT
00be27e4  8bc3  MOV EAX,EBX
00be27e6  8b10  MOV EDX,dword ptr [EAX]
00be27e8  ff5248  CALL dword ptr [EDX + 0x48]
00be27eb  8d45f4  LEA EAX,[EBP + -0xc]
00be27ee  50  PUSH EAX
00be27ef  b89829be00  MOV EAX,0xbe2998
00be27f4  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be27f7  c645e811  MOV byte ptr [EBP + -0x18],0x11
00be27fb  8d45e0  LEA EAX,[EBP + -0x20]
00be27fe  50  PUSH EAX
00be27ff  33c9  XOR ECX,ECX
00be2801  ba02000000  MOV EDX,0x2
00be2806  8bc6  MOV EAX,ESI
00be2808  e873d6feff  CALL 0x00bcfe80
00be280d  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00be2810  8945ec  MOV dword ptr [EBP + -0x14],EAX
00be2813  c645f011  MOV byte ptr [EBP + -0x10],0x11
00be2817  8d55e4  LEA EDX,[EBP + -0x1c]
00be281a  b901000000  MOV ECX,0x1
00be281f  b8c829be00  MOV EAX,0xbe29c8
00be2824  e8efc684ff  CALL 0x0042ef18
00be2829  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00be282c  8bc3  MOV EAX,EBX
00be282e  8b08  MOV ECX,dword ptr [EAX]
00be2830  ff513c  CALL dword ptr [ECX + 0x3c]
00be2833  8d45dc  LEA EAX,[EBP + -0x24]
00be2836  50  PUSH EAX
00be2837  b8e029be00  MOV EAX,0xbe29e0
00be283c  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be283f  c645e811  MOV byte ptr [EBP + -0x18],0x11
00be2843  ff75fc  PUSH dword ptr [EBP + -0x4]
00be2846  ff75f8  PUSH dword ptr [EBP + -0x8]
00be2849  8d4dd8  LEA ECX,[EBP + -0x28]
00be284c  8b1588f72401  MOV EDX,dword ptr [0x0124f788]
00be2852  b8102abe00  MOV EAX,0xbe2a10
00be2857  e8f4fc84ff  CALL 0x00432550
00be285c  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
00be285f  8945ec  MOV dword ptr [EBP + -0x14],EAX
00be2862  c645f011  MOV byte ptr [EBP + -0x10],0x11
00be2866  8d55e4  LEA EDX,[EBP + -0x1c]
00be2869  b901000000  MOV ECX,0x1
00be286e  b8c829be00  MOV EAX,0xbe29c8
00be2873  e8a0c684ff  CALL 0x0042ef18
00be2878  8b55dc  MOV EDX,dword ptr [EBP + -0x24]
00be287b  8bc3  MOV EAX,EBX
00be287d  8b08  MOV ECX,dword ptr [EAX]
00be287f  ff513c  CALL dword ptr [ECX + 0x3c]
00be2882  8d45d4  LEA EAX,[EBP + -0x2c]
00be2885  50  PUSH EAX
00be2886  b8442abe00  MOV EAX,0xbe2a44
00be288b  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be288e  c645e811  MOV byte ptr [EBP + -0x18],0x11
00be2892  8d45d0  LEA EAX,[EBP + -0x30]
00be2895  50  PUSH EAX
00be2896  33c9  XOR ECX,ECX
00be2898  ba05000000  MOV EDX,0x5
00be289d  8bc6  MOV EAX,ESI
00be289f  e8dcd5feff  CALL 0x00bcfe80
00be28a4  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00be28a7  8945ec  MOV dword ptr [EBP + -0x14],EAX
00be28aa  c645f011  MOV byte ptr [EBP + -0x10],0x11
00be28ae  8d55e4  LEA EDX,[EBP + -0x1c]
00be28b1  b901000000  MOV ECX,0x1
00be28b6  b8c829be00  MOV EAX,0xbe29c8
00be28bb  e858c684ff  CALL 0x0042ef18
00be28c0  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
00be28c3  8bc3  MOV EAX,EBX
00be28c5  8b08  MOV ECX,dword ptr [EAX]
00be28c7  ff513c  CALL dword ptr [ECX + 0x3c]
00be28ca  8d45cc  LEA EAX,[EBP + -0x34]
00be28cd  50  PUSH EAX
00be28ce  b8742abe00  MOV EAX,0xbe2a74
00be28d3  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be28d6  c645e811  MOV byte ptr [EBP + -0x18],0x11
00be28da  8d45c8  LEA EAX,[EBP + -0x38]
00be28dd  50  PUSH EAX
00be28de  33c9  XOR ECX,ECX
00be28e0  ba06000000  MOV EDX,0x6
00be28e5  8bc6  MOV EAX,ESI
00be28e7  e894d5feff  CALL 0x00bcfe80
00be28ec  8b45c8  MOV EAX,dword ptr [EBP + -0x38]
00be28ef  8945ec  MOV dword ptr [EBP + -0x14],EAX
00be28f2  c645f011  MOV byte ptr [EBP + -0x10],0x11
00be28f6  8d55e4  LEA EDX,[EBP + -0x1c]
00be28f9  b901000000  MOV ECX,0x1
00be28fe  b8c829be00  MOV EAX,0xbe29c8
00be2903  e810c684ff  CALL 0x0042ef18
00be2908  8b55cc  MOV EDX,dword ptr [EBP + -0x34]
00be290b  8bc3  MOV EAX,EBX
00be290d  8b08  MOV ECX,dword ptr [EAX]
00be290f  ff513c  CALL dword ptr [ECX + 0x3c]
00be2912  8d45c4  LEA EAX,[EBP + -0x3c]
00be2915  50  PUSH EAX
00be2916  b8a42abe00  MOV EAX,0xbe2aa4
00be291b  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00be291e  c645e811  MOV byte ptr [EBP + -0x18],0x11
00be2922  8d45c0  LEA EAX,[EBP + -0x40]
00be2925  50  PUSH EAX
00be2926  33c9  XOR ECX,ECX
00be2928  ba07000000  MOV EDX,0x7
00be292d  8bc6  MOV EAX,ESI
00be292f  e84cd5feff  CALL 0x00bcfe80
00be2934  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
00be2937  8945ec  MOV dword ptr [EBP + -0x14],EAX
00be293a  c645f011  MOV byte ptr [EBP + -0x10],0x11
00be293e  8d55e4  LEA EDX,[EBP + -0x1c]
00be2941  b901000000  MOV ECX,0x1
00be2946  b8c829be00  MOV EAX,0xbe29c8
00be294b  e8c8c584ff  CALL 0x0042ef18
00be2950  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
00be2953  8bc3  MOV EAX,EBX
00be2955  8b08  MOV ECX,dword ptr [EAX]
00be2957  ff513c  CALL dword ptr [ECX + 0x3c]
00be295a  33c0  XOR EAX,EAX
00be295c  5a  POP EDX
00be295d  59  POP ECX
00be295e  59  POP ECX
00be295f  648910  MOV dword ptr FS:[EAX],EDX
00be2962  688629be00  PUSH 0xbe2986
00be2967  8d45c0  LEA EAX,[EBP + -0x40]
00be296a  ba09000000  MOV EDX,0x9
00be296f  e8c08682ff  CALL 0x0040b034
00be2974  8d45f4  LEA EAX,[EBP + -0xc]
00be2977  e8588682ff  CALL 0x0040afd4
00be297c  58  POP EAX
00be297d  ffe0  JMP EAX
