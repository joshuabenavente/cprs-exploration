; Static instruction listing. Function bodies and indirect exception flow require review.
00ff1f14  55  PUSH EBP
00ff1f15  8bec  MOV EBP,ESP
00ff1f17  b92b000000  MOV ECX,0x2b
00ff1f1c  6a00  PUSH 0x0
00ff1f1e  6a00  PUSH 0x0
00ff1f20  49  DEC ECX
00ff1f21  75f9  JNZ 0x00ff1f1c
00ff1f23  51  PUSH ECX
00ff1f24  895588  MOV dword ptr [EBP + -0x78],EDX
00ff1f27  8945fc  MOV dword ptr [EBP + -0x4],EAX
00ff1f2a  33c0  XOR EAX,EAX
00ff1f2c  55  PUSH EBP
00ff1f2d  68062cff00  PUSH 0xff2c06
00ff1f32  64ff30  PUSH dword ptr FS:[EAX]
00ff1f35  648920  MOV dword ptr FS:[EAX],ESP
00ff1f38  33d2  XOR EDX,EDX
00ff1f3a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1f3d  e8aeb1ffff  CALL 0x00fed0f0
00ff1f42  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff1f47  8b00  MOV EAX,dword ptr [EAX]
00ff1f49  e802261e00  CALL 0x011d4550
00ff1f4e  8b480c  MOV ECX,dword ptr [EAX + 0xc]
00ff1f51  8d4584  LEA EAX,[EBP + -0x7c]
00ff1f54  ba202cff00  MOV EDX,0xff2c20
00ff1f59  e82ea241ff  CALL 0x0040c18c
00ff1f5e  8b5584  MOV EDX,dword ptr [EBP + -0x7c]
00ff1f61  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1f64  8b8034060000  MOV EAX,dword ptr [EAX + 0x634]
00ff1f6a  e88d0761ff  CALL 0x006026fc
00ff1f6f  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff1f74  8b00  MOV EAX,dword ptr [EAX]
00ff1f76  e8d5251e00  CALL 0x011d4550
00ff1f7b  8a501c  MOV DL,byte ptr [EAX + 0x1c]
00ff1f7e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1f81  8b8034060000  MOV EAX,dword ptr [EAX + 0x634]
00ff1f87  e8240661ff  CALL 0x006025b0
00ff1f8c  b201  MOV DL,0x1
00ff1f8e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1f91  e8aaec72ff  CALL 0x00720c40
00ff1f96  33c9  XOR ECX,ECX
00ff1f98  33d2  XOR EDX,EDX
00ff1f9a  a1ec949a00  MOV EAX,[0x009a94ec]
00ff1f9f  e884779bff  CALL 0x009a9728
00ff1fa4  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff1fa9  8b00  MOV EAX,dword ptr [EAX]
00ff1fab  8b4838  MOV ECX,dword ptr [EAX + 0x38]
00ff1fae  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff1fb3  8b00  MOV EAX,dword ptr [EAX]
00ff1fb5  8b5010  MOV EDX,dword ptr [EAX + 0x10]
00ff1fb8  8d4580  LEA EAX,[EBP + -0x80]
00ff1fbb  e8cca141ff  CALL 0x0040c18c
00ff1fc0  8b5580  MOV EDX,dword ptr [EBP + -0x80]
00ff1fc3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1fc6  8b809c040000  MOV EAX,dword ptr [EAX + 0x49c]
00ff1fcc  e82b0761ff  CALL 0x006026fc
00ff1fd1  8d957cffffff  LEA EDX,[EBP + 0xffffff7c]
00ff1fd7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1fda  e8912a0100  CALL 0x01004a70
00ff1fdf  8b957cffffff  MOV EDX,dword ptr [EBP + 0xffffff7c]
00ff1fe5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff1fe8  8b80a0040000  MOV EAX,dword ptr [EAX + 0x4a0]
00ff1fee  e8090761ff  CALL 0x006026fc
00ff1ff3  8d8574ffffff  LEA EAX,[EBP + 0xffffff74]
00ff1ff9  50  PUSH EAX
00ff1ffa  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff1fff  8b00  MOV EAX,dword ptr [EAX]
00ff2001  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff2004  b901000000  MOV ECX,0x1
00ff2009  66ba2f00  MOV DX,0x2f
00ff200d  e8da8c7aff  CALL 0x0079acec
00ff2012  8b8574ffffff  MOV EAX,dword ptr [EBP + 0xffffff74]
00ff2018  8d9578ffffff  LEA EDX,[EBP + 0xffffff78]
00ff201e  e8d9a543ff  CALL 0x0042c5fc
00ff2023  83bd78ffffff00  CMP dword ptr [EBP + 0xffffff78],0x0
00ff202a  751a  JNZ 0x00ff2046
00ff202c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff202f  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff2035  0590000000  ADD EAX,0x90
00ff203a  ba342cff00  MOV EDX,0xff2c34
00ff203f  e8809341ff  CALL 0x0040b3c4
00ff2044  eb6a  JMP 0x00ff20b0
00ff2046  8d8570ffffff  LEA EAX,[EBP + 0xffffff70]
00ff204c  50  PUSH EAX
00ff204d  b8342cff00  MOV EAX,0xff2c34
00ff2052  898560ffffff  MOV dword ptr [EBP + 0xffffff60],EAX
00ff2058  c68564ffffff11  MOV byte ptr [EBP + 0xffffff64],0x11
00ff205f  e82c571e00  CALL 0x011d7790
00ff2064  8d955cffffff  LEA EDX,[EBP + 0xffffff5c]
00ff206a  e849ff2000  CALL 0x01201fb8
00ff206f  8b855cffffff  MOV EAX,dword ptr [EBP + 0xffffff5c]
00ff2075  898568ffffff  MOV dword ptr [EBP + 0xffffff68],EAX
00ff207b  c6856cffffff11  MOV byte ptr [EBP + 0xffffff6c],0x11
00ff2082  8d9560ffffff  LEA EDX,[EBP + 0xffffff60]
00ff2088  b901000000  MOV ECX,0x1
00ff208d  b8882cff00  MOV EAX,0xff2c88
00ff2092  e881ce43ff  CALL 0x0042ef18
00ff2097  8b9570ffffff  MOV EDX,dword ptr [EBP + 0xffffff70]
00ff209d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff20a0  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff20a6  0590000000  ADD EAX,0x90
00ff20ab  e8149341ff  CALL 0x0040b3c4
00ff20b0  55  PUSH EBP
00ff20b1  8d9554ffffff  LEA EDX,[EBP + 0xffffff54]
00ff20b7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff20ba  8b809c040000  MOV EAX,dword ptr [EAX + 0x49c]
00ff20c0  e8e70561ff  CALL 0x006026ac
00ff20c5  8b8554ffffff  MOV EAX,dword ptr [EBP + 0xffffff54]
00ff20cb  8d9558ffffff  LEA EDX,[EBP + 0xffffff58]
00ff20d1  e826a543ff  CALL 0x0042c5fc
00ff20d6  8b8558ffffff  MOV EAX,dword ptr [EBP + 0xffffff58]
00ff20dc  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff20df  8b929c040000  MOV EDX,dword ptr [EDX + 0x49c]
00ff20e5  8b5274  MOV EDX,dword ptr [EDX + 0x74]
00ff20e8  e853fdffff  CALL 0x00ff1e40
00ff20ed  59  POP ECX
00ff20ee  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff20f1  8b929c040000  MOV EDX,dword ptr [EDX + 0x49c]
00ff20f7  8b5250  MOV EDX,dword ptr [EDX + 0x50]
00ff20fa  03d2  ADD EDX,EDX
00ff20fc  03c2  ADD EAX,EDX
00ff20fe  8945ec  MOV dword ptr [EBP + -0x14],EAX
00ff2101  55  PUSH EBP
00ff2102  8d954cffffff  LEA EDX,[EBP + 0xffffff4c]
00ff2108  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff210b  8b80a0040000  MOV EAX,dword ptr [EAX + 0x4a0]
00ff2111  e8960561ff  CALL 0x006026ac
00ff2116  8b854cffffff  MOV EAX,dword ptr [EBP + 0xffffff4c]
00ff211c  8d9550ffffff  LEA EDX,[EBP + 0xffffff50]
00ff2122  e8d5a443ff  CALL 0x0042c5fc
00ff2127  8b8550ffffff  MOV EAX,dword ptr [EBP + 0xffffff50]
00ff212d  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff2130  8b92a0040000  MOV EDX,dword ptr [EDX + 0x4a0]
00ff2136  8b5274  MOV EDX,dword ptr [EDX + 0x74]
00ff2139  e802fdffff  CALL 0x00ff1e40
00ff213e  59  POP ECX
00ff213f  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff2142  8b92a0040000  MOV EDX,dword ptr [EDX + 0x4a0]
00ff2148  8b5250  MOV EDX,dword ptr [EDX + 0x50]
00ff214b  03d2  ADD EDX,EDX
00ff214d  03c2  ADD EAX,EDX
00ff214f  8945f0  MOV dword ptr [EBP + -0x10],EAX
00ff2152  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00ff2155  3b45f0  CMP EAX,dword ptr [EBP + -0x10]
00ff2158  7e08  JLE 0x00ff2162
00ff215a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00ff215d  8945e8  MOV dword ptr [EBP + -0x18],EAX
00ff2160  eb06  JMP 0x00ff2168
00ff2162  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00ff2165  8945e8  MOV dword ptr [EBP + -0x18],EAX
00ff2168  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff216b  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff2171  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00ff2174  e837f860ff  CALL 0x006019b0
00ff2179  8d8544ffffff  LEA EAX,[EBP + 0xffffff44]
00ff217f  50  PUSH EAX
00ff2180  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2185  8b00  MOV EAX,dword ptr [EAX]
00ff2187  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff218a  b901000000  MOV ECX,0x1
00ff218f  66ba2f00  MOV DX,0x2f
00ff2193  e8548b7aff  CALL 0x0079acec
00ff2198  8b8544ffffff  MOV EAX,dword ptr [EBP + 0xffffff44]
00ff219e  8d9548ffffff  LEA EDX,[EBP + 0xffffff48]
00ff21a4  e853a443ff  CALL 0x0042c5fc
00ff21a9  83bd48ffffff00  CMP dword ptr [EBP + 0xffffff48],0x0
00ff21b0  0f8583000000  JNZ 0x00ff2239
00ff21b6  8d8540ffffff  LEA EAX,[EBP + 0xffffff40]
00ff21bc  50  PUSH EAX
00ff21bd  8d953cffffff  LEA EDX,[EBP + 0xffffff3c]
00ff21c3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff21c6  8b809c040000  MOV EAX,dword ptr [EAX + 0x49c]
00ff21cc  e8db0461ff  CALL 0x006026ac
00ff21d1  8b853cffffff  MOV EAX,dword ptr [EBP + 0xffffff3c]
00ff21d7  898560ffffff  MOV dword ptr [EBP + 0xffffff60],EAX
00ff21dd  c68564ffffff11  MOV byte ptr [EBP + 0xffffff64],0x11
00ff21e4  8d9538ffffff  LEA EDX,[EBP + 0xffffff38]
00ff21ea  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff21ed  8b80a0040000  MOV EAX,dword ptr [EAX + 0x4a0]
00ff21f3  e8b40461ff  CALL 0x006026ac
00ff21f8  8b8538ffffff  MOV EAX,dword ptr [EBP + 0xffffff38]
00ff21fe  898568ffffff  MOV dword ptr [EBP + 0xffffff68],EAX
00ff2204  c6856cffffff11  MOV byte ptr [EBP + 0xffffff6c],0x11
00ff220b  8d9560ffffff  LEA EDX,[EBP + 0xffffff60]
00ff2211  b901000000  MOV ECX,0x1
00ff2216  b8b02cff00  MOV EAX,0xff2cb0
00ff221b  e8f8cc43ff  CALL 0x0042ef18
00ff2220  8b9540ffffff  MOV EDX,dword ptr [EBP + 0xffffff40]
00ff2226  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2229  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff222f  e8c80461ff  CALL 0x006026fc
00ff2234  e9fb000000  JMP 0x00ff2334
00ff2239  a0c42cff00  MOV AL,[0x00ff2cc4]
00ff223e  50  PUSH EAX
00ff223f  8d8534ffffff  LEA EAX,[EBP + 0xffffff34]
00ff2245  50  PUSH EAX
00ff2246  8d8530ffffff  LEA EAX,[EBP + 0xffffff30]
00ff224c  50  PUSH EAX
00ff224d  8d9514ffffff  LEA EDX,[EBP + 0xffffff14]
00ff2253  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2256  8b809c040000  MOV EAX,dword ptr [EAX + 0x49c]
00ff225c  e84b0461ff  CALL 0x006026ac
00ff2261  8b8514ffffff  MOV EAX,dword ptr [EBP + 0xffffff14]
00ff2267  898518ffffff  MOV dword ptr [EBP + 0xffffff18],EAX
00ff226d  c6851cffffff11  MOV byte ptr [EBP + 0xffffff1c],0x11
00ff2274  8d9510ffffff  LEA EDX,[EBP + 0xffffff10]
00ff227a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff227d  8b80a0040000  MOV EAX,dword ptr [EAX + 0x4a0]
00ff2283  e8240461ff  CALL 0x006026ac
00ff2288  8b8510ffffff  MOV EAX,dword ptr [EBP + 0xffffff10]
00ff228e  898520ffffff  MOV dword ptr [EBP + 0xffffff20],EAX
00ff2294  c68524ffffff11  MOV byte ptr [EBP + 0xffffff24],0x11
00ff229b  a0c42cff00  MOV AL,[0x00ff2cc4]
00ff22a0  50  PUSH EAX
00ff22a1  8d850cffffff  LEA EAX,[EBP + 0xffffff0c]
00ff22a7  50  PUSH EAX
00ff22a8  a0c42cff00  MOV AL,[0x00ff2cc4]
00ff22ad  50  PUSH EAX
00ff22ae  8d8508ffffff  LEA EAX,[EBP + 0xffffff08]
00ff22b4  50  PUSH EAX
00ff22b5  a1dce62401  MOV EAX,[0x0124e6dc]
00ff22ba  8b00  MOV EAX,dword ptr [EAX]
00ff22bc  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff22bf  b9d42cff00  MOV ECX,0xff2cd4
00ff22c4  baec2cff00  MOV EDX,0xff2cec
00ff22c9  e8ca5d44ff  CALL 0x00438098
00ff22ce  8b8508ffffff  MOV EAX,dword ptr [EBP + 0xffffff08]
00ff22d4  b9fc2cff00  MOV ECX,0xff2cfc
00ff22d9  ba102dff00  MOV EDX,0xff2d10
00ff22de  e8b55d44ff  CALL 0x00438098
00ff22e3  8b850cffffff  MOV EAX,dword ptr [EBP + 0xffffff0c]
00ff22e9  898528ffffff  MOV dword ptr [EBP + 0xffffff28],EAX
00ff22ef  c6852cffffff11  MOV byte ptr [EBP + 0xffffff2c],0x11
00ff22f6  8d9518ffffff  LEA EDX,[EBP + 0xffffff18]
00ff22fc  b902000000  MOV ECX,0x2
00ff2301  b8242dff00  MOV EAX,0xff2d24
00ff2306  e80dcc43ff  CALL 0x0042ef18
00ff230b  8b8530ffffff  MOV EAX,dword ptr [EBP + 0xffffff30]
00ff2311  b9d42cff00  MOV ECX,0xff2cd4
00ff2316  ba502dff00  MOV EDX,0xff2d50
00ff231b  e8785d44ff  CALL 0x00438098
00ff2320  8b9534ffffff  MOV EDX,dword ptr [EBP + 0xffffff34]
00ff2326  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2329  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff232f  e8c80361ff  CALL 0x006026fc
00ff2334  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2337  e87c050100  CALL 0x010028b8
00ff233c  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2341  8b00  MOV EAX,dword ptr [EAX]
00ff2343  8b4030  MOV EAX,dword ptr [EAX + 0x30]
00ff2346  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00ff2349  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff234c  8945e0  MOV dword ptr [EBP + -0x20],EAX
00ff234f  837de000  CMP dword ptr [EBP + -0x20],0x0
00ff2353  7409  JZ 0x00ff235e
00ff2355  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00ff2358  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff235b  8945e0  MOV dword ptr [EBP + -0x20],EAX
00ff235e  837de000  CMP dword ptr [EBP + -0x20],0x0
00ff2362  7e15  JLE 0x00ff2379
00ff2364  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2367  8b80e0050000  MOV EAX,dword ptr [EAX + 0x5e0]
00ff236d  ba602dff00  MOV EDX,0xff2d60
00ff2372  e8850361ff  CALL 0x006026fc
00ff2377  eb13  JMP 0x00ff238c
00ff2379  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff237c  8b80e0050000  MOV EAX,dword ptr [EAX + 0x5e0]
00ff2382  ba802dff00  MOV EDX,0xff2d80
00ff2387  e8700361ff  CALL 0x006026fc
00ff238c  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2391  8b00  MOV EAX,dword ptr [EAX]
00ff2393  8b5030  MOV EDX,dword ptr [EAX + 0x30]
00ff2396  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2399  8b80e4050000  MOV EAX,dword ptr [EAX + 0x5e4]
00ff239f  e8580361ff  CALL 0x006026fc
00ff23a4  8d9500ffffff  LEA EDX,[EBP + 0xffffff00]
00ff23aa  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff23ad  8b80e0050000  MOV EAX,dword ptr [EAX + 0x5e0]
00ff23b3  e8f40261ff  CALL 0x006026ac
00ff23b8  ffb500ffffff  PUSH dword ptr [EBP + 0xffffff00]
00ff23be  68a42dff00  PUSH 0xff2da4
00ff23c3  8d95fcfeffff  LEA EDX,[EBP + 0xfffffefc]
00ff23c9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff23cc  8b80e4050000  MOV EAX,dword ptr [EAX + 0x5e4]
00ff23d2  e8d50261ff  CALL 0x006026ac
00ff23d7  ffb5fcfeffff  PUSH dword ptr [EBP + 0xfffffefc]
00ff23dd  8d8504ffffff  LEA EAX,[EBP + 0xffffff04]
00ff23e3  ba03000000  MOV EDX,0x3
00ff23e8  e8279e41ff  CALL 0x0040c214
00ff23ed  8b9504ffffff  MOV EDX,dword ptr [EBP + 0xffffff04]
00ff23f3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff23f6  8b80dc050000  MOV EAX,dword ptr [EAX + 0x5dc]
00ff23fc  e8fb0261ff  CALL 0x006026fc
00ff2401  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2406  8b00  MOV EAX,dword ptr [EAX]
00ff2408  8b4060  MOV EAX,dword ptr [EAX + 0x60]
00ff240b  8945dc  MOV dword ptr [EBP + -0x24],EAX
00ff240e  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00ff2411  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff2414  837dd800  CMP dword ptr [EBP + -0x28],0x0
00ff2418  7409  JZ 0x00ff2423
00ff241a  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
00ff241d  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff2420  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff2423  837dd800  CMP dword ptr [EBP + -0x28],0x0
00ff2427  7e06  JLE 0x00ff242f
00ff2429  c645cf01  MOV byte ptr [EBP + -0x31],0x1
00ff242d  eb2a  JMP 0x00ff2459
00ff242f  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2434  8b00  MOV EAX,dword ptr [EAX]
00ff2436  8b4064  MOV EAX,dword ptr [EAX + 0x64]
00ff2439  8945d4  MOV dword ptr [EBP + -0x2c],EAX
00ff243c  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00ff243f  8945d0  MOV dword ptr [EBP + -0x30],EAX
00ff2442  837dd000  CMP dword ptr [EBP + -0x30],0x0
00ff2446  7409  JZ 0x00ff2451
00ff2448  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00ff244b  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff244e  8945d0  MOV dword ptr [EBP + -0x30],EAX
00ff2451  837dd000  CMP dword ptr [EBP + -0x30],0x0
00ff2455  0f9f45cf  SETG byte ptr [EBP + -0x31]
00ff2459  807dcf00  CMP byte ptr [EBP + -0x31],0x0
00ff245d  0f840d010000  JZ 0x00ff2570
00ff2463  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2468  8b00  MOV EAX,dword ptr [EAX]
00ff246a  8b5060  MOV EDX,dword ptr [EAX + 0x60]
00ff246d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2470  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff2476  e8810261ff  CALL 0x006026fc
00ff247b  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2480  8b00  MOV EAX,dword ptr [EAX]
00ff2482  83786400  CMP dword ptr [EAX + 0x64],0x0
00ff2486  7460  JZ 0x00ff24e8
00ff2488  8d95f4feffff  LEA EDX,[EBP + 0xfffffef4]
00ff248e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2491  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff2497  e8100261ff  CALL 0x006026ac
00ff249c  ffb5f4feffff  PUSH dword ptr [EBP + 0xfffffef4]
00ff24a2  68b42dff00  PUSH 0xff2db4
00ff24a7  8d8df0feffff  LEA ECX,[EBP + 0xfffffef0]
00ff24ad  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff24b2  8b00  MOV EAX,dword ptr [EAX]
00ff24b4  8b4064  MOV EAX,dword ptr [EAX + 0x64]
00ff24b7  33d2  XOR EDX,EDX
00ff24b9  e8aa059cff  CALL 0x009b2a68
00ff24be  ffb5f0feffff  PUSH dword ptr [EBP + 0xfffffef0]
00ff24c4  8d85f8feffff  LEA EAX,[EBP + 0xfffffef8]
00ff24ca  ba03000000  MOV EDX,0x3
00ff24cf  e8409d41ff  CALL 0x0040c214
00ff24d4  8b95f8feffff  MOV EDX,dword ptr [EBP + 0xfffffef8]
00ff24da  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff24dd  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff24e3  e8140261ff  CALL 0x006026fc
00ff24e8  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff24ed  8b00  MOV EAX,dword ptr [EAX]
00ff24ef  8b406c  MOV EAX,dword ptr [EAX + 0x6c]
00ff24f2  8945c8  MOV dword ptr [EBP + -0x38],EAX
00ff24f5  8b45c8  MOV EAX,dword ptr [EBP + -0x38]
00ff24f8  8945c4  MOV dword ptr [EBP + -0x3c],EAX
00ff24fb  837dc400  CMP dword ptr [EBP + -0x3c],0x0
00ff24ff  7409  JZ 0x00ff250a
00ff2501  8b45c4  MOV EAX,dword ptr [EBP + -0x3c]
00ff2504  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff2507  8945c4  MOV dword ptr [EBP + -0x3c],EAX
00ff250a  837dc400  CMP dword ptr [EBP + -0x3c],0x0
00ff250e  7e60  JLE 0x00ff2570
00ff2510  8d95e8feffff  LEA EDX,[EBP + 0xfffffee8]
00ff2516  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2519  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff251f  e8880161ff  CALL 0x006026ac
00ff2524  ffb5e8feffff  PUSH dword ptr [EBP + 0xfffffee8]
00ff252a  68b42dff00  PUSH 0xff2db4
00ff252f  8d8de4feffff  LEA ECX,[EBP + 0xfffffee4]
00ff2535  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff253a  8b00  MOV EAX,dword ptr [EAX]
00ff253c  8b406c  MOV EAX,dword ptr [EAX + 0x6c]
00ff253f  33d2  XOR EDX,EDX
00ff2541  e822059cff  CALL 0x009b2a68
00ff2546  ffb5e4feffff  PUSH dword ptr [EBP + 0xfffffee4]
00ff254c  8d85ecfeffff  LEA EAX,[EBP + 0xfffffeec]
00ff2552  ba03000000  MOV EDX,0x3
00ff2557  e8b89c41ff  CALL 0x0040c214
00ff255c  8b95ecfeffff  MOV EDX,dword ptr [EBP + 0xfffffeec]
00ff2562  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2565  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff256b  e88c0161ff  CALL 0x006026fc
00ff2570  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2575  8b00  MOV EAX,dword ptr [EAX]
00ff2577  8b4068  MOV EAX,dword ptr [EAX + 0x68]
00ff257a  8945c0  MOV dword ptr [EBP + -0x40],EAX
00ff257d  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
00ff2580  8945bc  MOV dword ptr [EBP + -0x44],EAX
00ff2583  837dbc00  CMP dword ptr [EBP + -0x44],0x0
00ff2587  7409  JZ 0x00ff2592
00ff2589  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
00ff258c  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff258f  8945bc  MOV dword ptr [EBP + -0x44],EAX
00ff2592  837dbc00  CMP dword ptr [EBP + -0x44],0x0
00ff2596  7e41  JLE 0x00ff25d9
00ff2598  8d8ddcfeffff  LEA ECX,[EBP + 0xfffffedc]
00ff259e  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff25a3  8b00  MOV EAX,dword ptr [EAX]
00ff25a5  8b4068  MOV EAX,dword ptr [EAX + 0x68]
00ff25a8  33d2  XOR EDX,EDX
00ff25aa  e8b9049cff  CALL 0x009b2a68
00ff25af  8b8ddcfeffff  MOV ECX,dword ptr [EBP + 0xfffffedc]
00ff25b5  8d85e0feffff  LEA EAX,[EBP + 0xfffffee0]
00ff25bb  bac82dff00  MOV EDX,0xff2dc8
00ff25c0  e8c79b41ff  CALL 0x0040c18c
00ff25c5  8b95e0feffff  MOV EDX,dword ptr [EBP + 0xfffffee0]
00ff25cb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff25ce  8b8078050000  MOV EAX,dword ptr [EAX + 0x578]
00ff25d4  e8230161ff  CALL 0x006026fc
00ff25d9  8d95d4feffff  LEA EDX,[EBP + 0xfffffed4]
00ff25df  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff25e2  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff25e8  e8bf0061ff  CALL 0x006026ac
00ff25ed  ffb5d4feffff  PUSH dword ptr [EBP + 0xfffffed4]
00ff25f3  68a42dff00  PUSH 0xff2da4
00ff25f8  8d95d0feffff  LEA EDX,[EBP + 0xfffffed0]
00ff25fe  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2601  8b8078050000  MOV EAX,dword ptr [EAX + 0x578]
00ff2607  e8a00061ff  CALL 0x006026ac
00ff260c  ffb5d0feffff  PUSH dword ptr [EBP + 0xfffffed0]
00ff2612  8d85d8feffff  LEA EAX,[EBP + 0xfffffed8]
00ff2618  ba03000000  MOV EDX,0x3
00ff261d  e8f29b41ff  CALL 0x0040c214
00ff2622  8b95d8feffff  MOV EDX,dword ptr [EBP + 0xfffffed8]
00ff2628  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff262b  8b8070050000  MOV EAX,dword ptr [EAX + 0x570]
00ff2631  e8c60061ff  CALL 0x006026fc
00ff2636  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff263b  8b00  MOV EAX,dword ptr [EAX]
00ff263d  8b4070  MOV EAX,dword ptr [EAX + 0x70]
00ff2640  8945b8  MOV dword ptr [EBP + -0x48],EAX
00ff2643  8b45b8  MOV EAX,dword ptr [EBP + -0x48]
00ff2646  8945b4  MOV dword ptr [EBP + -0x4c],EAX
00ff2649  837db400  CMP dword ptr [EBP + -0x4c],0x0
00ff264d  7409  JZ 0x00ff2658
00ff264f  8b45b4  MOV EAX,dword ptr [EBP + -0x4c]
00ff2652  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff2655  8945b4  MOV dword ptr [EBP + -0x4c],EAX
00ff2658  837db400  CMP dword ptr [EBP + -0x4c],0x0
00ff265c  7e60  JLE 0x00ff26be
00ff265e  8d95c8feffff  LEA EDX,[EBP + 0xfffffec8]
00ff2664  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2667  8b8078050000  MOV EAX,dword ptr [EAX + 0x578]
00ff266d  e83a0061ff  CALL 0x006026ac
00ff2672  ffb5c8feffff  PUSH dword ptr [EBP + 0xfffffec8]
00ff2678  68082eff00  PUSH 0xff2e08
00ff267d  8d8dc4feffff  LEA ECX,[EBP + 0xfffffec4]
00ff2683  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2688  8b00  MOV EAX,dword ptr [EAX]
00ff268a  8b4070  MOV EAX,dword ptr [EAX + 0x70]
00ff268d  33d2  XOR EDX,EDX
00ff268f  e8d4039cff  CALL 0x009b2a68
00ff2694  ffb5c4feffff  PUSH dword ptr [EBP + 0xfffffec4]
00ff269a  8d85ccfeffff  LEA EAX,[EBP + 0xfffffecc]
00ff26a0  ba03000000  MOV EDX,0x3
00ff26a5  e86a9b41ff  CALL 0x0040c214
00ff26aa  8b95ccfeffff  MOV EDX,dword ptr [EBP + 0xfffffecc]
00ff26b0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff26b3  8b8078050000  MOV EAX,dword ptr [EAX + 0x578]
00ff26b9  e83e0061ff  CALL 0x006026fc
00ff26be  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff26c3  8b00  MOV EAX,dword ptr [EAX]
00ff26c5  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff26c8  8945b0  MOV dword ptr [EBP + -0x50],EAX
00ff26cb  8b45b0  MOV EAX,dword ptr [EBP + -0x50]
00ff26ce  8945ac  MOV dword ptr [EBP + -0x54],EAX
00ff26d1  837dac00  CMP dword ptr [EBP + -0x54],0x0
00ff26d5  7409  JZ 0x00ff26e0
00ff26d7  8b45ac  MOV EAX,dword ptr [EBP + -0x54]
00ff26da  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff26dd  8945ac  MOV dword ptr [EBP + -0x54],EAX
00ff26e0  837dac00  CMP dword ptr [EBP + -0x54],0x0
00ff26e4  7e41  JLE 0x00ff2727
00ff26e6  8d8dbcfeffff  LEA ECX,[EBP + 0xfffffebc]
00ff26ec  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff26f1  8b00  MOV EAX,dword ptr [EAX]
00ff26f3  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff26f6  33d2  XOR EDX,EDX
00ff26f8  e86b039cff  CALL 0x009b2a68
00ff26fd  8b8dbcfeffff  MOV ECX,dword ptr [EBP + 0xfffffebc]
00ff2703  8d85c0feffff  LEA EAX,[EBP + 0xfffffec0]
00ff2709  ba482eff00  MOV EDX,0xff2e48
00ff270e  e8799a41ff  CALL 0x0040c18c
00ff2713  8b95c0feffff  MOV EDX,dword ptr [EBP + 0xfffffec0]
00ff2719  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff271c  8b8058060000  MOV EAX,dword ptr [EAX + 0x658]
00ff2722  e8d5ff60ff  CALL 0x006026fc
00ff2727  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff272c  8b00  MOV EAX,dword ptr [EAX]
00ff272e  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff2731  8945a8  MOV dword ptr [EBP + -0x58],EAX
00ff2734  8b45a8  MOV EAX,dword ptr [EBP + -0x58]
00ff2737  8945a4  MOV dword ptr [EBP + -0x5c],EAX
00ff273a  837da400  CMP dword ptr [EBP + -0x5c],0x0
00ff273e  7409  JZ 0x00ff2749
00ff2740  8b45a4  MOV EAX,dword ptr [EBP + -0x5c]
00ff2743  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff2746  8945a4  MOV dword ptr [EBP + -0x5c],EAX
00ff2749  837da400  CMP dword ptr [EBP + -0x5c],0x0
00ff274d  7536  JNZ 0x00ff2785
00ff274f  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2754  8b00  MOV EAX,dword ptr [EAX]
00ff2756  80783501  CMP byte ptr [EAX + 0x35],0x1
00ff275a  7529  JNZ 0x00ff2785
00ff275c  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2761  8b00  MOV EAX,dword ptr [EAX]
00ff2763  8b4048  MOV EAX,dword ptr [EAX + 0x48]
00ff2766  ba8c2eff00  MOV EDX,0xff2e8c
00ff276b  e8b49b41ff  CALL 0x0040c324
00ff2770  7513  JNZ 0x00ff2785
00ff2772  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2775  8b8058060000  MOV EAX,dword ptr [EAX + 0x658]
00ff277b  ba9c2eff00  MOV EDX,0xff2e9c
00ff2780  e877ff60ff  CALL 0x006026fc
00ff2785  8d95b4feffff  LEA EDX,[EBP + 0xfffffeb4]
00ff278b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff278e  8b8074050000  MOV EAX,dword ptr [EAX + 0x574]
00ff2794  e813ff60ff  CALL 0x006026ac
00ff2799  ffb5b4feffff  PUSH dword ptr [EBP + 0xfffffeb4]
00ff279f  68a42dff00  PUSH 0xff2da4
00ff27a4  8d95b0feffff  LEA EDX,[EBP + 0xfffffeb0]
00ff27aa  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff27ad  8b8078050000  MOV EAX,dword ptr [EAX + 0x578]
00ff27b3  e8f4fe60ff  CALL 0x006026ac
00ff27b8  ffb5b0feffff  PUSH dword ptr [EBP + 0xfffffeb0]
00ff27be  68a42dff00  PUSH 0xff2da4
00ff27c3  8d95acfeffff  LEA EDX,[EBP + 0xfffffeac]
00ff27c9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff27cc  8b8058060000  MOV EAX,dword ptr [EAX + 0x658]
00ff27d2  e8d5fe60ff  CALL 0x006026ac
00ff27d7  ffb5acfeffff  PUSH dword ptr [EBP + 0xfffffeac]
00ff27dd  8d85b8feffff  LEA EAX,[EBP + 0xfffffeb8]
00ff27e3  ba05000000  MOV EDX,0x5
00ff27e8  e8279a41ff  CALL 0x0040c214
00ff27ed  8b95b8feffff  MOV EDX,dword ptr [EBP + 0xfffffeb8]
00ff27f3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff27f6  8b8070050000  MOV EAX,dword ptr [EAX + 0x570]
00ff27fc  e8fbfe60ff  CALL 0x006026fc
00ff2801  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2804  e83f7b0000  CALL 0x00ffa348
00ff2809  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff280c  e80bb6ffff  CALL 0x00fede1c
00ff2811  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2814  e83fa261ff  CALL 0x0060ca58
00ff2819  8bd0  MOV EDX,EAX
00ff281b  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2820  8b00  MOV EAX,dword ptr [EAX]
00ff2822  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff2825  e88ec51900  CALL 0x0118edb8
00ff282a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff282d  e82ee2ffff  CALL 0x00ff0a60
00ff2832  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2837  8b00  MOV EAX,dword ptr [EAX]
00ff2839  dd4018  FLD double ptr [EAX + 0x18]
00ff283c  db7d90  FSTP extended double ptr [EBP + -0x70]
00ff283f  9b  WAIT
00ff2840  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2845  8b00  MOV EAX,dword ptr [EAX]
00ff2847  ff7014  PUSH dword ptr [EAX + 0x14]
00ff284a  68f02eff00  PUSH 0xff2ef0
00ff284f  668b4598  MOV AX,word ptr [EBP + -0x68]
00ff2853  50  PUSH EAX
00ff2854  ff7594  PUSH dword ptr [EBP + -0x6c]
00ff2857  ff7590  PUSH dword ptr [EBP + -0x70]
00ff285a  8d95a4feffff  LEA EDX,[EBP + 0xfffffea4]
00ff2860  a188f72401  MOV EAX,[0x0124f788]
00ff2865  e8aae043ff  CALL 0x00430914
00ff286a  ffb5a4feffff  PUSH dword ptr [EBP + 0xfffffea4]
00ff2870  68f02eff00  PUSH 0xff2ef0
00ff2875  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff287a  8b00  MOV EAX,dword ptr [EAX]
00ff287c  ff7010  PUSH dword ptr [EAX + 0x10]
00ff287f  8d85a8feffff  LEA EAX,[EBP + 0xfffffea8]
00ff2885  ba05000000  MOV EDX,0x5
00ff288a  e8859941ff  CALL 0x0040c214
00ff288f  8b95a8feffff  MOV EDX,dword ptr [EBP + 0xfffffea8]
00ff2895  b8002fff00  MOV EAX,0xff2f00
00ff289a  e8d5161e00  CALL 0x011d3f74
00ff289f  8d45f4  LEA EAX,[EBP + -0xc]
00ff28a2  e82d8741ff  CALL 0x0040afd4
00ff28a7  8d55f8  LEA EDX,[EBP + -0x8]
00ff28aa  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff28af  8b00  MOV EAX,dword ptr [EAX]
00ff28b1  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff28b4  e80fc21d00  CALL 0x011ceac8
00ff28b9  84c0  TEST AL,AL
00ff28bb  740b  JZ 0x00ff28c8
00ff28bd  8d45f4  LEA EAX,[EBP + -0xc]
00ff28c0  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00ff28c3  e8448b41ff  CALL 0x0040b40c
00ff28c8  8d55f8  LEA EDX,[EBP + -0x8]
00ff28cb  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff28d0  8b00  MOV EAX,dword ptr [EAX]
00ff28d2  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff28d5  e8a6bf1d00  CALL 0x011ce880
00ff28da  84c0  TEST AL,AL
00ff28dc  741e  JZ 0x00ff28fc
00ff28de  837df400  CMP dword ptr [EBP + -0xc],0x0
00ff28e2  740d  JZ 0x00ff28f1
00ff28e4  8d45f4  LEA EAX,[EBP + -0xc]
00ff28e7  ba102dff00  MOV EDX,0xff2d10
00ff28ec  e8439841ff  CALL 0x0040c134
00ff28f1  8d45f4  LEA EAX,[EBP + -0xc]
00ff28f4  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00ff28f7  e8389841ff  CALL 0x0040c134
00ff28fc  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2901  8b00  MOV EAX,dword ptr [EAX]
00ff2903  8b4804  MOV ECX,dword ptr [EAX + 0x4]
00ff2906  8b15c8f92401  MOV EDX,dword ptr [0x0124f9c8]
00ff290c  a154f92401  MOV EAX,[0x0124f954]
00ff2911  8b00  MOV EAX,dword ptr [EAX]
00ff2913  e8c0d0e7ff  CALL 0x00e6f9d8
00ff2918  a1c8f92401  MOV EAX,[0x0124f9c8]
00ff291d  803800  CMP byte ptr [EAX],0x0
00ff2920  747b  JZ 0x00ff299d
00ff2922  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2925  8b8064060000  MOV EAX,dword ptr [EAX + 0x664]
00ff292b  33d2  XOR EDX,EDX
00ff292d  e87efc60ff  CALL 0x006025b0
00ff2932  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2935  8b8038060000  MOV EAX,dword ptr [EAX + 0x638]
00ff293b  b201  MOV DL,0x1
00ff293d  8b08  MOV ECX,dword ptr [EAX]
00ff293f  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff2945  b880000000  MOV EAX,0x80
00ff294a  e8ed409cff  CALL 0x009b6a3c
00ff294f  8bd0  MOV EDX,EAX
00ff2951  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2954  8b803c060000  MOV EAX,dword ptr [EAX + 0x63c]
00ff295a  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff295d  e8ceb05dff  CALL 0x005cda30
00ff2962  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2965  8b803c060000  MOV EAX,dword ptr [EAX + 0x63c]
00ff296b  b201  MOV DL,0x1
00ff296d  8b08  MOV ECX,dword ptr [EAX]
00ff296f  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff2975  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2978  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff297f  756d  JNZ 0x00ff29ee
00ff2981  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2986  8b00  MOV EAX,dword ptr [EAX]
00ff2988  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff298b  e8acd0e7ff  CALL 0x00e6fa3c
00ff2990  84c0  TEST AL,AL
00ff2992  745a  JZ 0x00ff29ee
00ff2994  33c0  XOR EAX,EAX
00ff2996  e8e1dce7ff  CALL 0x00e7067c
00ff299b  eb51  JMP 0x00ff29ee
00ff299d  e806389eff  CALL 0x009d61a8
00ff29a2  8bd0  MOV EDX,EAX
00ff29a4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff29a7  8b8064060000  MOV EAX,dword ptr [EAX + 0x664]
00ff29ad  e8fefb60ff  CALL 0x006025b0
00ff29b2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff29b5  8b8038060000  MOV EAX,dword ptr [EAX + 0x638]
00ff29bb  33d2  XOR EDX,EDX
00ff29bd  8b08  MOV ECX,dword ptr [EAX]
00ff29bf  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff29c5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff29c8  8b803c060000  MOV EAX,dword ptr [EAX + 0x63c]
00ff29ce  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff29d1  ba0f0000ff  MOV EDX,0xff00000f
00ff29d6  e855b05dff  CALL 0x005cda30
00ff29db  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff29de  8b803c060000  MOV EAX,dword ptr [EAX + 0x63c]
00ff29e4  33d2  XOR EDX,EDX
00ff29e6  8b08  MOV ECX,dword ptr [EAX]
00ff29e8  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff29ee  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff29f1  0534070000  ADD EAX,0x734
00ff29f6  8b15e0f22401  MOV EDX,dword ptr [0x0124f2e0]
00ff29fc  8b12  MOV EDX,dword ptr [EDX]
00ff29fe  8b5204  MOV EDX,dword ptr [EDX + 0x4]
00ff2a01  e8be8941ff  CALL 0x0040b3c4
00ff2a06  33d2  XOR EDX,EDX
00ff2a08  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a0b  e8a8ba0000  CALL 0x00ffe4b8
00ff2a10  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a13  8b8040060000  MOV EAX,dword ptr [EAX + 0x640]
00ff2a19  8b5050  MOV EDX,dword ptr [EAX + 0x50]
00ff2a1c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a1f  8b8030060000  MOV EAX,dword ptr [EAX + 0x630]
00ff2a25  2b5058  SUB EDX,dword ptr [EAX + 0x58]
00ff2a28  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a2b  8b8030060000  MOV EAX,dword ptr [EAX + 0x630]
00ff2a31  e80eef60ff  CALL 0x00601944
00ff2a36  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a39  8b8030060000  MOV EAX,dword ptr [EAX + 0x630]
00ff2a3f  8b5050  MOV EDX,dword ptr [EAX + 0x50]
00ff2a42  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a45  8b8000060000  MOV EAX,dword ptr [EAX + 0x600]
00ff2a4b  2b5058  SUB EDX,dword ptr [EAX + 0x58]
00ff2a4e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a51  8b8000060000  MOV EAX,dword ptr [EAX + 0x600]
00ff2a57  e8e8ee60ff  CALL 0x00601944
00ff2a5c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a5f  8b8000060000  MOV EAX,dword ptr [EAX + 0x600]
00ff2a65  8b5050  MOV EDX,dword ptr [EAX + 0x50]
00ff2a68  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a6b  8b8070060000  MOV EAX,dword ptr [EAX + 0x670]
00ff2a71  2b5058  SUB EDX,dword ptr [EAX + 0x58]
00ff2a74  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2a77  8b8070060000  MOV EAX,dword ptr [EAX + 0x670]
00ff2a7d  e8c2ee60ff  CALL 0x00601944
00ff2a82  e81945e0ff  CALL 0x00df6fa0
00ff2a87  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00ff2a8a  89458c  MOV dword ptr [EBP + -0x74],EAX
00ff2a8d  837d8c00  CMP dword ptr [EBP + -0x74],0x0
00ff2a91  7409  JZ 0x00ff2a9c
00ff2a93  8b458c  MOV EAX,dword ptr [EBP + -0x74]
00ff2a96  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
00ff2a99  89458c  MOV dword ptr [EBP + -0x74],EAX
00ff2a9c  837d8c00  CMP dword ptr [EBP + -0x74],0x0
00ff2aa0  7e08  JLE 0x00ff2aaa
00ff2aa2  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00ff2aa5  e87a60feff  CALL 0x00fd8b24
00ff2aaa  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff2aaf  8b00  MOV EAX,dword ptr [EAX]
00ff2ab1  8b5004  MOV EDX,dword ptr [EAX + 0x4]
00ff2ab4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2ab7  e83cc30000  CALL 0x00ffedf8
00ff2abc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2abf  e824c20000  CALL 0x00ffece8
00ff2ac4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2ac7  8b80bc060000  MOV EAX,dword ptr [EAX + 0x6bc]
00ff2acd  8b10  MOV EDX,dword ptr [EAX]
00ff2acf  ff929c010000  CALL dword ptr [EDX + 0x19c]
00ff2ad5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff2ad8  e82b040000  CALL 0x00ff2f08
00ff2add  33c0  XOR EAX,EAX
00ff2adf  5a  POP EDX
00ff2ae0  59  POP ECX
00ff2ae1  59  POP ECX
00ff2ae2  648910  MOV dword ptr FS:[EAX],EDX
00ff2ae5  68102cff00  PUSH 0xff2c10
00ff2aea  8d85a4feffff  LEA EAX,[EBP + 0xfffffea4]
00ff2af0  ba02000000  MOV EDX,0x2
00ff2af5  e83a8541ff  CALL 0x0040b034
00ff2afa  8d85acfeffff  LEA EAX,[EBP + 0xfffffeac]
00ff2b00  ba04000000  MOV EDX,0x4
00ff2b05  e82a8541ff  CALL 0x0040b034
00ff2b0a  8d85bcfeffff  LEA EAX,[EBP + 0xfffffebc]
00ff2b10  ba03000000  MOV EDX,0x3
00ff2b15  e81a8541ff  CALL 0x0040b034
00ff2b1a  8d85c8feffff  LEA EAX,[EBP + 0xfffffec8]
00ff2b20  ba05000000  MOV EDX,0x5
00ff2b25  e80a8541ff  CALL 0x0040b034
00ff2b2a  8d85dcfeffff  LEA EAX,[EBP + 0xfffffedc]
00ff2b30  ba03000000  MOV EDX,0x3
00ff2b35  e8fa8441ff  CALL 0x0040b034
00ff2b3a  8d85e8feffff  LEA EAX,[EBP + 0xfffffee8]
00ff2b40  ba02000000  MOV EDX,0x2
00ff2b45  e8ea8441ff  CALL 0x0040b034
00ff2b4a  8d85f0feffff  LEA EAX,[EBP + 0xfffffef0]
00ff2b50  e87f8441ff  CALL 0x0040afd4
00ff2b55  8d85f4feffff  LEA EAX,[EBP + 0xfffffef4]
00ff2b5b  ba05000000  MOV EDX,0x5
00ff2b60  e8cf8441ff  CALL 0x0040b034
00ff2b65  8d8508ffffff  LEA EAX,[EBP + 0xffffff08]
00ff2b6b  ba02000000  MOV EDX,0x2
00ff2b70  e8bf8441ff  CALL 0x0040b034
00ff2b75  8d8510ffffff  LEA EAX,[EBP + 0xffffff10]
00ff2b7b  ba02000000  MOV EDX,0x2
00ff2b80  e8af8441ff  CALL 0x0040b034
00ff2b85  8d8530ffffff  LEA EAX,[EBP + 0xffffff30]
00ff2b8b  ba02000000  MOV EDX,0x2
00ff2b90  e89f8441ff  CALL 0x0040b034
00ff2b95  8d8538ffffff  LEA EAX,[EBP + 0xffffff38]
00ff2b9b  ba02000000  MOV EDX,0x2
00ff2ba0  e88f8441ff  CALL 0x0040b034
00ff2ba5  8d8540ffffff  LEA EAX,[EBP + 0xffffff40]
00ff2bab  ba03000000  MOV EDX,0x3
00ff2bb0  e87f8441ff  CALL 0x0040b034
00ff2bb5  8d854cffffff  LEA EAX,[EBP + 0xffffff4c]
00ff2bbb  e8148441ff  CALL 0x0040afd4
00ff2bc0  8d8550ffffff  LEA EAX,[EBP + 0xffffff50]
00ff2bc6  e8098441ff  CALL 0x0040afd4
00ff2bcb  8d8554ffffff  LEA EAX,[EBP + 0xffffff54]
00ff2bd1  e8fe8341ff  CALL 0x0040afd4
00ff2bd6  8d8558ffffff  LEA EAX,[EBP + 0xffffff58]
00ff2bdc  ba02000000  MOV EDX,0x2
00ff2be1  e84e8441ff  CALL 0x0040b034
00ff2be6  8d8570ffffff  LEA EAX,[EBP + 0xffffff70]
00ff2bec  ba06000000  MOV EDX,0x6
00ff2bf1  e83e8441ff  CALL 0x0040b034
00ff2bf6  8d45f4  LEA EAX,[EBP + -0xc]
00ff2bf9  ba02000000  MOV EDX,0x2
00ff2bfe  e8318441ff  CALL 0x0040b034
00ff2c03  58  POP EAX
00ff2c04  ffe0  JMP EAX
