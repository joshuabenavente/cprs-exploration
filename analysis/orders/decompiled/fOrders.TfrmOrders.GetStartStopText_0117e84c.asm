; Static instruction listing. Function bodies and indirect exception flow require review.
0117e84c  55  PUSH EBP
0117e84d  8bec  MOV EBP,ESP
0117e84f  83c4d8  ADD ESP,-0x28
0117e852  53  PUSH EBX
0117e853  33db  XOR EBX,EBX
0117e855  895dd8  MOV dword ptr [EBP + -0x28],EBX
0117e858  895ddc  MOV dword ptr [EBP + -0x24],EBX
0117e85b  895df0  MOV dword ptr [EBP + -0x10],EBX
0117e85e  894df4  MOV dword ptr [EBP + -0xc],ECX
0117e861  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117e864  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117e867  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117e86a  e859c828ff  CALL 0x0040b0c8
0117e86f  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0117e872  e851c828ff  CALL 0x0040b0c8
0117e877  33c0  XOR EAX,EAX
0117e879  55  PUSH EBP
0117e87a  68c8e91701  PUSH 0x117e9c8
0117e87f  64ff30  PUSH dword ptr FS:[EAX]
0117e882  648920  MOV dword ptr FS:[EAX],ESP
0117e885  8b4d08  MOV ECX,dword ptr [EBP + 0x8]
0117e888  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117e88b  b8e4e91701  MOV EAX,0x117e9e4
0117e890  e8ff2e83ff  CALL 0x009b1794
0117e895  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117e898  e83f2f83ff  CALL 0x009b17dc
0117e89d  84c0  TEST AL,AL
0117e89f  743d  JZ 0x0117e8de
0117e8a1  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117e8a4  8945ec  MOV dword ptr [EBP + -0x14],EAX
0117e8a7  837dec00  CMP dword ptr [EBP + -0x14],0x0
0117e8ab  7409  JZ 0x0117e8b6
0117e8ad  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
0117e8b0  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
0117e8b3  8945ec  MOV dword ptr [EBP + -0x14],EAX
0117e8b6  837dec07  CMP dword ptr [EBP + -0x14],0x7
0117e8ba  7522  JNZ 0x0117e8de
0117e8bc  8d45dc  LEA EAX,[EBP + -0x24]
0117e8bf  50  PUSH EAX
0117e8c0  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e8c3  8b00  MOV EAX,dword ptr [EAX]
0117e8c5  b901000000  MOV ECX,0x1
0117e8ca  66ba2000  MOV DX,0x20
0117e8ce  e819c461ff  CALL 0x0079acec
0117e8d3  8b55dc  MOV EDX,dword ptr [EBP + -0x24]
0117e8d6  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e8d9  e8e6ca28ff  CALL 0x0040b3c4
0117e8de  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e8e1  8b00  MOV EAX,dword ptr [EAX]
0117e8e3  8945e8  MOV dword ptr [EBP + -0x18],EAX
0117e8e6  837de800  CMP dword ptr [EBP + -0x18],0x0
0117e8ea  7409  JZ 0x0117e8f5
0117e8ec  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
0117e8ef  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
0117e8f2  8945e8  MOV dword ptr [EBP + -0x18],EAX
0117e8f5  837de800  CMP dword ptr [EBP + -0x18],0x0
0117e8f9  7e12  JLE 0x0117e90d
0117e8fb  8b4d08  MOV ECX,dword ptr [EBP + 0x8]
0117e8fe  8b09  MOV ECX,dword ptr [ECX]
0117e900  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e903  ba10ea1701  MOV EDX,0x117ea10
0117e908  e87fd828ff  CALL 0x0040c18c
0117e90d  8d4df0  LEA ECX,[EBP + -0x10]
0117e910  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0117e913  b8e4e91701  MOV EAX,0x117e9e4
0117e918  e8772e83ff  CALL 0x009b1794
0117e91d  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0117e920  e8b72e83ff  CALL 0x009b17dc
0117e925  84c0  TEST AL,AL
0117e927  743b  JZ 0x0117e964
0117e929  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0117e92c  8945e4  MOV dword ptr [EBP + -0x1c],EAX
0117e92f  837de400  CMP dword ptr [EBP + -0x1c],0x0
0117e933  7409  JZ 0x0117e93e
0117e935  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117e938  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
0117e93b  8945e4  MOV dword ptr [EBP + -0x1c],EAX
0117e93e  837de407  CMP dword ptr [EBP + -0x1c],0x7
0117e942  7520  JNZ 0x0117e964
0117e944  8d45d8  LEA EAX,[EBP + -0x28]
0117e947  50  PUSH EAX
0117e948  b901000000  MOV ECX,0x1
0117e94d  66ba2000  MOV DX,0x20
0117e951  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e954  e893c361ff  CALL 0x0079acec
0117e959  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
0117e95c  8d45f0  LEA EAX,[EBP + -0x10]
0117e95f  e8a8ca28ff  CALL 0x0040b40c
0117e964  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117e967  8945e0  MOV dword ptr [EBP + -0x20],EAX
0117e96a  837de000  CMP dword ptr [EBP + -0x20],0x0
0117e96e  7409  JZ 0x0117e979
0117e970  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
0117e973  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
0117e976  8945e0  MOV dword ptr [EBP + -0x20],EAX
0117e979  837de000  CMP dword ptr [EBP + -0x20],0x0
0117e97d  7e1f  JLE 0x0117e99e
0117e97f  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e982  ff30  PUSH dword ptr [EAX]
0117e984  682cea1701  PUSH 0x117ea2c
0117e989  6840ea1701  PUSH 0x117ea40
0117e98e  ff75f0  PUSH dword ptr [EBP + -0x10]
0117e991  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117e994  ba04000000  MOV EDX,0x4
0117e999  e876d828ff  CALL 0x0040c214
0117e99e  33c0  XOR EAX,EAX
0117e9a0  5a  POP EDX
0117e9a1  59  POP ECX
0117e9a2  59  POP ECX
0117e9a3  648910  MOV dword ptr FS:[EAX],EDX
0117e9a6  68cfe91701  PUSH 0x117e9cf
0117e9ab  8d45d8  LEA EAX,[EBP + -0x28]
0117e9ae  ba02000000  MOV EDX,0x2
0117e9b3  e87cc628ff  CALL 0x0040b034
0117e9b8  8d45f0  LEA EAX,[EBP + -0x10]
0117e9bb  ba03000000  MOV EDX,0x3
0117e9c0  e86fc628ff  CALL 0x0040b034
0117e9c5  58  POP EAX
0117e9c6  ffe0  JMP EAX
