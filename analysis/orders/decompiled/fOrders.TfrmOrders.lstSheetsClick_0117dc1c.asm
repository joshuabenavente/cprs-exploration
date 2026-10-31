; Static instruction listing. Function bodies and indirect exception flow require review.
0117dc1c  55  PUSH EBP
0117dc1d  8bec  MOV EBP,ESP
0117dc1f  b909000000  MOV ECX,0x9
0117dc24  6a00  PUSH 0x0
0117dc26  6a00  PUSH 0x0
0117dc28  49  DEC ECX
0117dc29  75f9  JNZ 0x0117dc24
0117dc2b  53  PUSH EBX
0117dc2c  8955ec  MOV dword ptr [EBP + -0x14],EDX
0117dc2f  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117dc32  33c0  XOR EAX,EAX
0117dc34  55  PUSH EBP
0117dc35  68dde21701  PUSH 0x117e2dd
0117dc3a  64ff30  PUSH dword ptr FS:[EAX]
0117dc3d  648920  MOV dword ptr FS:[EAX],ESP
0117dc40  e86b5af6ff  CALL 0x010e36b0
0117dc45  84c0  TEST AL,AL
0117dc47  0f8449060000  JZ 0x0117e296
0117dc4d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dc50  c6808c06000001  MOV byte ptr [EAX + 0x68c],0x1
0117dc57  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dc5a  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117dc60  8b10  MOV EDX,dword ptr [EAX]
0117dc62  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117dc68  85c0  TEST EAX,EAX
0117dc6a  0f8c26060000  JL 0x0117e296
0117dc70  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dc73  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117dc79  8945f0  MOV dword ptr [EBP + -0x10],EAX
0117dc7c  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117dc7f  8b10  MOV EDX,dword ptr [EAX]
0117dc81  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117dc87  50  PUSH EAX
0117dc88  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117dc8b  e8843363ff  CALL 0x007b1014
0117dc90  5a  POP EDX
0117dc91  8b08  MOV ECX,dword ptr [EAX]
0117dc93  ff5118  CALL dword ptr [ECX + 0x18]
0117dc96  8945f8  MOV dword ptr [EBP + -0x8],EAX
0117dc99  8d45e8  LEA EAX,[EBP + -0x18]
0117dc9c  50  PUSH EAX
0117dc9d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dca0  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117dca6  8b10  MOV EDX,dword ptr [EAX]
0117dca8  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117dcae  50  PUSH EAX
0117dcaf  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
0117dcb2  e85d3363ff  CALL 0x007b1014
0117dcb7  8d4de4  LEA ECX,[EBP + -0x1c]
0117dcba  5a  POP EDX
0117dcbb  8b18  MOV EBX,dword ptr [EAX]
0117dcbd  ff530c  CALL dword ptr [EBX + 0xc]
0117dcc0  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117dcc3  b901000000  MOV ECX,0x1
0117dcc8  66ba5e00  MOV DX,0x5e
0117dccc  e81bd061ff  CALL 0x0079acec
0117dcd1  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
0117dcd4  33d2  XOR EDX,EDX
0117dcd6  e85df52aff  CALL 0x0042d238
0117dcdb  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117dcde  894254  MOV dword ptr [EDX + 0x54],EAX
0117dce1  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117dce4  83785400  CMP dword ptr [EAX + 0x54],0x0
0117dce8  7e0a  JLE 0x0117dcf4
0117dcea  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dced  c6808c06000000  MOV byte ptr [EAX + 0x68c],0x0
0117dcf4  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117dcf7  83784c00  CMP dword ptr [EAX + 0x4c],0x0
0117dcfb  750c  JNZ 0x0117dd09
0117dcfd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd00  c6809106000000  MOV byte ptr [EAX + 0x691],0x0
0117dd07  eb0a  JMP 0x0117dd13
0117dd09  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd0c  c6809106000001  MOV byte ptr [EAX + 0x691],0x1
0117dd13  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd16  83b88806000000  CMP dword ptr [EAX + 0x688],0x0
0117dd1d  0f84f4000000  JZ 0x0117de17
0117dd23  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117dd26  8b404c  MOV EAX,dword ptr [EAX + 0x4c]
0117dd29  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117dd2c  8b9288060000  MOV EDX,dword ptr [EDX + 0x688]
0117dd32  3b424c  CMP EAX,dword ptr [EDX + 0x4c]
0117dd35  0f84dc000000  JZ 0x0117de17
0117dd3b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd3e  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dd44  83784c00  CMP dword ptr [EAX + 0x4c],0x0
0117dd48  0f8ec9000000  JLE 0x0117de17
0117dd4e  8d55f4  LEA EDX,[EBP + -0xc]
0117dd51  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd54  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dd5a  8b4054  MOV EAX,dword ptr [EAX + 0x54]
0117dd5d  e87af22aff  CALL 0x0042cfdc
0117dd62  a168ef2401  MOV EAX,[0x0124ef68]
0117dd67  8b00  MOV EAX,dword ptr [EAX]
0117dd69  80b8fd05000000  CMP byte ptr [EAX + 0x5fd],0x0
0117dd70  0f8520050000  JNZ 0x0117e296
0117dd76  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd79  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dd7f  83785400  CMP dword ptr [EAX + 0x54],0x0
0117dd83  7e2c  JLE 0x0117ddb1
0117dd85  6a00  PUSH 0x0
0117dd87  6a00  PUSH 0x0
0117dd89  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd8c  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dd92  8b4850  MOV ECX,dword ptr [EAX + 0x50]
0117dd95  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dd98  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dd9e  8b5054  MOV EDX,dword ptr [EAX + 0x54]
0117dda1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dda4  e863ca0000  CALL 0x0118a80c
0117dda9  84c0  TEST AL,AL
0117ddab  0f85e5040000  JNZ 0x0117e296
0117ddb1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117ddb4  80b8e906000000  CMP byte ptr [EAX + 0x6e9],0x0
0117ddbb  755a  JNZ 0x0117de17
0117ddbd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117ddc0  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117ddc6  8d5050  LEA EDX,[EAX + 0x50]
0117ddc9  b101  MOV CL,0x1
0117ddcb  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
0117ddce  e8c9900600  CALL 0x011e6e9c
0117ddd3  84c0  TEST AL,AL
0117ddd5  7440  JZ 0x0117de17
0117ddd7  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0117ddda  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dddd  e8d2c80000  CALL 0x0118a6b4
0117dde2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dde5  c6808c06000001  MOV byte ptr [EAX + 0x68c],0x1
0117ddec  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117ddef  e8e89e0000  CALL 0x01187cdc
0117ddf4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117ddf7  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117ddfd  33d2  XOR EDX,EDX
0117ddff  8b08  MOV ECX,dword ptr [EAX]
0117de01  ff9170010000  CALL dword ptr [ECX + 0x170]
0117de07  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117de0a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de0d  e80afeffff  CALL 0x0117dc1c
0117de12  e97f040000  JMP 0x0117e296
0117de17  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de1a  83b88806000000  CMP dword ptr [EAX + 0x688],0x0
0117de21  7433  JZ 0x0117de56
0117de23  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de26  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117de2c  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
0117de2f  7525  JNZ 0x0117de56
0117de31  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de34  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117de3a  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
0117de3d  0f85d5030000  JNZ 0x0117e218
0117de43  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de46  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117de4c  83784c00  CMP dword ptr [EAX + 0x4c],0x0
0117de50  0f8ec2030000  JLE 0x0117e218
0117de56  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de59  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117de5c  899088060000  MOV dword ptr [EAX + 0x688],EDX
0117de62  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de65  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117de6b  83784c00  CMP dword ptr [EAX + 0x4c],0x0
0117de6f  0f8e23030000  JLE 0x0117e198
0117de75  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de78  c6808c06000000  MOV byte ptr [EAX + 0x68c],0x0
0117de7f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de82  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117de88  e8873163ff  CALL 0x007b1014
0117de8d  8b10  MOV EDX,dword ptr [EAX]
0117de8f  ff5248  CALL dword ptr [EDX + 0x48]
0117de92  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117de95  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117de9b  8b4834  MOV ECX,dword ptr [EAX + 0x34]
0117de9e  8d45e0  LEA EAX,[EBP + -0x20]
0117dea1  baf8e21701  MOV EDX,0x117e2f8
0117dea6  e8e1e228ff  CALL 0x0040c18c
0117deab  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
0117deae  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117deb1  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117deb7  e8404848ff  CALL 0x006026fc
0117debc  8d55dc  LEA EDX,[EBP + -0x24]
0117debf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dec2  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117dec8  e8df4748ff  CALL 0x006026ac
0117decd  8b55dc  MOV EDX,dword ptr [EBP + -0x24]
0117ded0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117ded3  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117ded9  e8ea3163ff  CALL 0x007b10c8
0117dede  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dee1  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117dee7  e8283163ff  CALL 0x007b1014
0117deec  8b10  MOV EDX,dword ptr [EAX]
0117deee  ff5248  CALL dword ptr [EDX + 0x48]
0117def1  8d55d8  LEA EDX,[EBP + -0x28]
0117def4  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
0117def7  8b404c  MOV EAX,dword ptr [EAX + 0x4c]
0117defa  e8ddf02aff  CALL 0x0042cfdc
0117deff  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
0117df02  50  PUSH EAX
0117df03  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df06  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117df0c  e8033163ff  CALL 0x007b1014
0117df11  5a  POP EDX
0117df12  e899240600  CALL 0x011e03b0
0117df17  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df1a  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117df20  e8ef3063ff  CALL 0x007b1014
0117df25  8b10  MOV EDX,dword ptr [EAX]
0117df27  ff5214  CALL dword ptr [EDX + 0x14]
0117df2a  48  DEC EAX
0117df2b  7d13  JGE 0x0117df40
0117df2d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df30  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117df36  e8d93063ff  CALL 0x007b1014
0117df3b  e800240600  CALL 0x011e0340
0117df40  8d45d4  LEA EAX,[EBP + -0x2c]
0117df43  50  PUSH EAX
0117df44  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df47  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117df4d  8b10  MOV EDX,dword ptr [EAX]
0117df4f  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117df55  50  PUSH EAX
0117df56  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df59  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117df5f  e8b03063ff  CALL 0x007b1014
0117df64  8d4dd0  LEA ECX,[EBP + -0x30]
0117df67  5a  POP EDX
0117df68  8b18  MOV EBX,dword ptr [EAX]
0117df6a  ff530c  CALL dword ptr [EBX + 0xc]
0117df6d  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
0117df70  b901000000  MOV ECX,0x1
0117df75  66ba5e00  MOV DX,0x5e
0117df79  e86ecd61ff  CALL 0x0079acec
0117df7e  8b4dd4  MOV ECX,dword ptr [EBP + -0x2c]
0117df81  b201  MOV DL,0x1
0117df83  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df86  e875d0ffff  CALL 0x0117b000
0117df8b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df8e  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
0117df94  b201  MOV DL,0x1
0117df96  e8a9b258ff  CALL 0x00709244
0117df9b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117df9e  8b80d0050000  MOV EAX,dword ptr [EAX + 0x5d0]
0117dfa4  b201  MOV DL,0x1
0117dfa6  e899b258ff  CALL 0x00709244
0117dfab  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dfae  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117dfb4  8b80d8020000  MOV EAX,dword ptr [EAX + 0x2d8]
0117dfba  8b10  MOV EDX,dword ptr [EAX]
0117dfbc  ff5214  CALL dword ptr [EDX + 0x14]
0117dfbf  85c0  TEST EAX,EAX
0117dfc1  0f85b2010000  JNZ 0x0117e179
0117dfc7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dfca  80b88f06000000  CMP byte ptr [EAX + 0x68f],0x0
0117dfd1  0f85a2010000  JNZ 0x0117e179
0117dfd7  a168ef2401  MOV EAX,[0x0124ef68]
0117dfdc  8b00  MOV EAX,dword ptr [EAX]
0117dfde  80b8fd05000000  CMP byte ptr [EAX + 0x5fd],0x0
0117dfe5  0f85ab020000  JNZ 0x0117e296
0117dfeb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117dfee  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117dff4  83785400  CMP dword ptr [EAX + 0x54],0x0
0117dff8  7e2c  JLE 0x0117e026
0117dffa  6a00  PUSH 0x0
0117dffc  6a00  PUSH 0x0
0117dffe  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e001  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117e007  8b4850  MOV ECX,dword ptr [EAX + 0x50]
0117e00a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e00d  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117e013  8b5054  MOV EDX,dword ptr [EAX + 0x54]
0117e016  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e019  e8eec70000  CALL 0x0118a80c
0117e01e  84c0  TEST AL,AL
0117e020  0f8570020000  JNZ 0x0117e296
0117e026  8d45cc  LEA EAX,[EBP + -0x34]
0117e029  50  PUSH EAX
0117e02a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e02d  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e033  8b10  MOV EDX,dword ptr [EAX]
0117e035  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117e03b  50  PUSH EAX
0117e03c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e03f  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e045  e8ca2f63ff  CALL 0x007b1014
0117e04a  8d4dc8  LEA ECX,[EBP + -0x38]
0117e04d  5a  POP EDX
0117e04e  8b18  MOV EBX,dword ptr [EAX]
0117e050  ff530c  CALL dword ptr [EBX + 0xc]
0117e053  8b45c8  MOV EAX,dword ptr [EBP + -0x38]
0117e056  b901000000  MOV ECX,0x1
0117e05b  66ba5e00  MOV DX,0x5e
0117e05f  e888cc61ff  CALL 0x0079acec
0117e064  8b45cc  MOV EAX,dword ptr [EBP + -0x34]
0117e067  e8545b0600  CALL 0x011e3bc0
0117e06c  84c0  TEST AL,AL
0117e06e  0f8405010000  JZ 0x0117e179
0117e074  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e077  80b89006000000  CMP byte ptr [EAX + 0x690],0x0
0117e07e  0f84f5000000  JZ 0x0117e179
0117e084  66b92400  MOV CX,0x24
0117e088  ba14e31701  MOV EDX,0x117e314
0117e08d  b83ce31701  MOV EAX,0x117e33c
0117e092  e8116483ff  CALL 0x009b44a8
0117e097  83f806  CMP EAX,0x6
0117e09a  0f85d9000000  JNZ 0x0117e179
0117e0a0  8d45c4  LEA EAX,[EBP + -0x3c]
0117e0a3  50  PUSH EAX
0117e0a4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e0a7  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e0ad  8b10  MOV EDX,dword ptr [EAX]
0117e0af  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117e0b5  50  PUSH EAX
0117e0b6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e0b9  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e0bf  e8502f63ff  CALL 0x007b1014
0117e0c4  8d4dc0  LEA ECX,[EBP + -0x40]
0117e0c7  5a  POP EDX
0117e0c8  8b18  MOV EBX,dword ptr [EAX]
0117e0ca  ff530c  CALL dword ptr [EBX + 0xc]
0117e0cd  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
0117e0d0  b901000000  MOV ECX,0x1
0117e0d5  66ba5e00  MOV DX,0x5e
0117e0d9  e80ecc61ff  CALL 0x0079acec
0117e0de  8b45c4  MOV EAX,dword ptr [EBP + -0x3c]
0117e0e1  e82a570600  CALL 0x011e3810
0117e0e6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e0e9  c6808c06000001  MOV byte ptr [EAX + 0x68c],0x1
0117e0f0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e0f3  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e0f9  8b10  MOV EDX,dword ptr [EAX]
0117e0fb  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117e101  50  PUSH EAX
0117e102  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e105  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e10b  e8042f63ff  CALL 0x007b1014
0117e110  5a  POP EDX
0117e111  8b08  MOV ECX,dword ptr [EAX]
0117e113  ff5118  CALL dword ptr [ECX + 0x18]
0117e116  e8a1af28ff  CALL 0x004090bc
0117e11b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e11e  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e124  8b10  MOV EDX,dword ptr [EAX]
0117e126  ff926c010000  CALL dword ptr [EDX + 0x16c]
0117e12c  50  PUSH EAX
0117e12d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e130  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e136  e8d92e63ff  CALL 0x007b1014
0117e13b  5a  POP EDX
0117e13c  8b08  MOV ECX,dword ptr [EAX]
0117e13e  ff514c  CALL dword ptr [ECX + 0x4c]
0117e141  b201  MOV DL,0x1
0117e143  a124871d01  MOV EAX,[0x011d8724]
0117e148  e83faf28ff  CALL 0x0040908c
0117e14d  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117e150  898288060000  MOV dword ptr [EDX + 0x688],EAX
0117e156  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e159  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117e15f  33d2  XOR EDX,EDX
0117e161  8b08  MOV ECX,dword ptr [EAX]
0117e163  ff9170010000  CALL dword ptr [ECX + 0x170]
0117e169  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117e16c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e16f  e8a8faffff  CALL 0x0117dc1c
0117e174  e91d010000  JMP 0x0117e296
0117e179  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e17c  80b88f06000000  CMP byte ptr [EAX + 0x68f],0x0
0117e183  0f8403010000  JZ 0x0117e28c
0117e189  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e18c  c6808f06000000  MOV byte ptr [EAX + 0x68f],0x0
0117e193  e9f4000000  JMP 0x0117e28c
0117e198  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e19b  c6808f06000000  MOV byte ptr [EAX + 0x68f],0x0
0117e1a2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1a5  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
0117e1ab  33d2  XOR EDX,EDX
0117e1ad  e892b058ff  CALL 0x00709244
0117e1b2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1b5  8b80d0050000  MOV EAX,dword ptr [EAX + 0x5d0]
0117e1bb  33d2  XOR EDX,EDX
0117e1bd  e882b058ff  CALL 0x00709244
0117e1c2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1c5  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117e1cb  bad4e31701  MOV EDX,0x117e3d4
0117e1d0  e8274548ff  CALL 0x006026fc
0117e1d5  8d55bc  LEA EDX,[EBP + -0x44]
0117e1d8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1db  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117e1e1  e8c64448ff  CALL 0x006026ac
0117e1e6  8b55bc  MOV EDX,dword ptr [EBP + -0x44]
0117e1e9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1ec  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117e1f2  e8d12e63ff  CALL 0x007b10c8
0117e1f7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e1fa  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117e200  e80f2e63ff  CALL 0x007b1014
0117e205  e836210600  CALL 0x011e0340
0117e20a  33c9  XOR ECX,ECX
0117e20c  b201  MOV DL,0x1
0117e20e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e211  e8eacdffff  CALL 0x0117b000
0117e216  eb74  JMP 0x0117e28c
0117e218  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e21b  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
0117e221  33d2  XOR EDX,EDX
0117e223  e81cb058ff  CALL 0x00709244
0117e228  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e22b  8b80d0050000  MOV EAX,dword ptr [EAX + 0x5d0]
0117e231  33d2  XOR EDX,EDX
0117e233  e80cb058ff  CALL 0x00709244
0117e238  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e23b  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117e241  bad4e31701  MOV EDX,0x117e3d4
0117e246  e8b14448ff  CALL 0x006026fc
0117e24b  8d55b8  LEA EDX,[EBP + -0x48]
0117e24e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e251  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
0117e257  e8504448ff  CALL 0x006026ac
0117e25c  8b55b8  MOV EDX,dword ptr [EBP + -0x48]
0117e25f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e262  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117e268  e85b2e63ff  CALL 0x007b10c8
0117e26d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e270  8b8044050000  MOV EAX,dword ptr [EAX + 0x544]
0117e276  e8992d63ff  CALL 0x007b1014
0117e27b  e8c0200600  CALL 0x011e0340
0117e280  33c9  XOR ECX,ECX
0117e282  b201  MOV DL,0x1
0117e284  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e287  e874cdffff  CALL 0x0117b000
0117e28c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117e28f  c6808c06000001  MOV byte ptr [EAX + 0x68c],0x1
0117e296  33c0  XOR EAX,EAX
0117e298  5a  POP EDX
0117e299  59  POP ECX
0117e29a  59  POP ECX
0117e29b  648910  MOV dword ptr FS:[EAX],EDX
0117e29e  68e4e21701  PUSH 0x117e2e4
0117e2a3  8d45b8  LEA EAX,[EBP + -0x48]
0117e2a6  ba02000000  MOV EDX,0x2
0117e2ab  e884cd28ff  CALL 0x0040b034
0117e2b0  8d45c0  LEA EAX,[EBP + -0x40]
0117e2b3  ba07000000  MOV EDX,0x7
0117e2b8  e877cd28ff  CALL 0x0040b034
0117e2bd  8d45dc  LEA EAX,[EBP + -0x24]
0117e2c0  e80fcd28ff  CALL 0x0040afd4
0117e2c5  8d45e0  LEA EAX,[EBP + -0x20]
0117e2c8  ba03000000  MOV EDX,0x3
0117e2cd  e862cd28ff  CALL 0x0040b034
0117e2d2  8d45f4  LEA EAX,[EBP + -0xc]
0117e2d5  e8facc28ff  CALL 0x0040afd4
0117e2da  58  POP EAX
0117e2db  ffe0  JMP EAX
