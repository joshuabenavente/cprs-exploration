; Static instruction listing. Function bodies and indirect exception flow require review.
00bee478  55  PUSH EBP
00bee479  8bec  MOV EBP,ESP
00bee47b  83c4ac  ADD ESP,-0x54
00bee47e  53  PUSH EBX
00bee47f  56  PUSH ESI
00bee480  57  PUSH EDI
00bee481  33db  XOR EBX,EBX
00bee483  895db8  MOV dword ptr [EBP + -0x48],EBX
00bee486  895dd0  MOV dword ptr [EBP + -0x30],EBX
00bee489  895dbc  MOV dword ptr [EBP + -0x44],EBX
00bee48c  895dfc  MOV dword ptr [EBP + -0x4],EBX
00bee48f  895df8  MOV dword ptr [EBP + -0x8],EBX
00bee492  895df4  MOV dword ptr [EBP + -0xc],EBX
00bee495  895df0  MOV dword ptr [EBP + -0x10],EBX
00bee498  894dec  MOV dword ptr [EBP + -0x14],ECX
00bee49b  8bd8  MOV EBX,EAX
00bee49d  33c0  XOR EAX,EAX
00bee49f  55  PUSH EBP
00bee4a0  6866e9be00  PUSH 0xbee966
00bee4a5  64ff30  PUSH dword ptr FS:[EAX]
00bee4a8  648920  MOV dword ptr FS:[EAX],ESP
00bee4ab  33d2  XOR EDX,EDX
00bee4ad  55  PUSH EBP
00bee4ae  68e3e8be00  PUSH 0xbee8e3
00bee4b3  64ff32  PUSH dword ptr FS:[EDX]
00bee4b6  648922  MOV dword ptr FS:[EDX],ESP
00bee4b9  8b4314  MOV EAX,dword ptr [EBX + 0x14]
00bee4bc  8b10  MOV EDX,dword ptr [EAX]
00bee4be  ff5214  CALL dword ptr [EDX + 0x14]
00bee4c1  8bd0  MOV EDX,EAX
00bee4c3  8b4328  MOV EAX,dword ptr [EBX + 0x28]
00bee4c6  8b08  MOV ECX,dword ptr [EAX]
00bee4c8  ff5120  CALL dword ptr [ECX + 0x20]
00bee4cb  33d2  XOR EDX,EDX
00bee4cd  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee4d0  e8db40a1ff  CALL 0x006025b0
00bee4d5  33d2  XOR EDX,EDX
00bee4d7  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee4da  e80931a1ff  CALL 0x006015e8
00bee4df  8b4318  MOV EAX,dword ptr [EBX + 0x18]
00bee4e2  83c004  ADD EAX,0x4
00bee4e5  e8dab386ff  CALL 0x004598c4
00bee4ea  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee4ed  8b80f0020000  MOV EAX,dword ptr [EAX + 0x2f0]
00bee4f3  e81c698eff  CALL 0x004d4e14
00bee4f8  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee4fb  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee501  e80e698eff  CALL 0x004d4e14
00bee506  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee509  8b80ec020000  MOV EAX,dword ptr [EAX + 0x2ec]
00bee50f  e800698eff  CALL 0x004d4e14
00bee514  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee517  8b80ec020000  MOV EAX,dword ptr [EAX + 0x2ec]
00bee51d  e8b2ccacff  CALL 0x006bb1d4
00bee522  eb0e  JMP 0x00bee532
00bee524  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee527  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee52d  e8fecaacff  CALL 0x006bb030
00bee532  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee535  8bb0e8020000  MOV ESI,dword ptr [EAX + 0x2e8]
00bee53b  8b4328  MOV EAX,dword ptr [EBX + 0x28]
00bee53e  8b10  MOV EDX,dword ptr [EAX]
00bee540  ff521c  CALL dword ptr [EDX + 0x1c]
00bee543  8b5608  MOV EDX,dword ptr [ESI + 0x8]
00bee546  3b4208  CMP EAX,dword ptr [EDX + 0x8]
00bee549  7fd9  JG 0x00bee524
00bee54b  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee54e  8bb0e8020000  MOV ESI,dword ptr [EAX + 0x2e8]
00bee554  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bee557  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee55a  50  PUSH EAX
00bee55b  8d431c  LEA EAX,[EBX + 0x1c]
00bee55e  b901000000  MOV ECX,0x1
00bee563  8b15d0dabe00  MOV EDX,dword ptr [0x00bedad0]
00bee569  e84a0482ff  CALL 0x0040e9b8
00bee56e  83c404  ADD ESP,0x4
00bee571  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee574  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee57a  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee57d  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee580  48  DEC EAX
00bee581  85c0  TEST EAX,EAX
00bee583  0f8c95000000  JL 0x00bee61e
00bee589  40  INC EAX
00bee58a  8945dc  MOV dword ptr [EBP + -0x24],EAX
00bee58d  33f6  XOR ESI,ESI
00bee58f  8d45e4  LEA EAX,[EBP + -0x1c]
00bee592  50  PUSH EAX
00bee593  b901000000  MOV ECX,0x1
00bee598  ba01000000  MOV EDX,0x1
00bee59d  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee5a0  e887f0fdff  CALL 0x00bcd62c
00bee5a5  8d45d0  LEA EAX,[EBP + -0x30]
00bee5a8  50  PUSH EAX
00bee5a9  8d55bc  LEA EDX,[EBP + -0x44]
00bee5ac  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bee5af  8b00  MOV EAX,dword ptr [EAX]
00bee5b1  e82ea981ff  CALL 0x00408ee4
00bee5b6  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
00bee5b9  8945c0  MOV dword ptr [EBP + -0x40],EAX
00bee5bc  c645c411  MOV byte ptr [EBP + -0x3c],0x11
00bee5c0  8975c8  MOV dword ptr [EBP + -0x38],ESI
00bee5c3  c645cc00  MOV byte ptr [EBP + -0x34],0x0
00bee5c7  8d55c0  LEA EDX,[EBP + -0x40]
00bee5ca  b901000000  MOV ECX,0x1
00bee5cf  b880e9be00  MOV EAX,0xbee980
00bee5d4  e83f0984ff  CALL 0x0042ef18
00bee5d9  8b55d0  MOV EDX,dword ptr [EBP + -0x30]
00bee5dc  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bee5df  8b08  MOV ECX,dword ptr [EAX]
00bee5e1  ff5128  CALL dword ptr [ECX + 0x28]
00bee5e4  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
00bee5e7  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bee5ea  8b08  MOV ECX,dword ptr [EAX]
00bee5ec  ff91a0000000  CALL dword ptr [ECX + 0xa0]
00bee5f2  56  PUSH ESI
00bee5f3  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee5f6  8b80f0020000  MOV EAX,dword ptr [EAX + 0x2f0]
00bee5fc  33c9  XOR ECX,ECX
00bee5fe  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
00bee601  e87ed0acff  CALL 0x006bb684
00bee606  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee609  8d14b0  LEA EDX,[EAX + ESI*0x4]
00bee60c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bee60f  e868f1fdff  CALL 0x00bcd77c
00bee614  46  INC ESI
00bee615  ff4ddc  DEC dword ptr [EBP + -0x24]
00bee618  0f8571ffffff  JNZ 0x00bee58f
00bee61e  8b4314  MOV EAX,dword ptr [EBX + 0x14]
00bee621  8b10  MOV EDX,dword ptr [EAX]
00bee623  ff5214  CALL dword ptr [EDX + 0x14]
00bee626  48  DEC EAX
00bee627  85c0  TEST EAX,EAX
00bee629  0f8c6c010000  JL 0x00bee79b
00bee62f  40  INC EAX
00bee630  8945dc  MOV dword ptr [EBP + -0x24],EAX
00bee633  33f6  XOR ESI,ESI
00bee635  8d4dfc  LEA ECX,[EBP + -0x4]
00bee638  8b4314  MOV EAX,dword ptr [EBX + 0x14]
00bee63b  8bd6  MOV EDX,ESI
00bee63d  8b38  MOV EDI,dword ptr [EAX]
00bee63f  ff5710  CALL dword ptr [EDI + 0x10]
00bee642  8b4328  MOV EAX,dword ptr [EBX + 0x28]
00bee645  8bd6  MOV EDX,ESI
00bee647  8b08  MOV ECX,dword ptr [EAX]
00bee649  ff5114  CALL dword ptr [ECX + 0x14]
00bee64c  8bd0  MOV EDX,EAX
00bee64e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee651  8b08  MOV ECX,dword ptr [EAX]
00bee653  ff5120  CALL dword ptr [ECX + 0x20]
00bee656  8b4328  MOV EAX,dword ptr [EBX + 0x28]
00bee659  8bd6  MOV EDX,ESI
00bee65b  8b08  MOV ECX,dword ptr [EAX]
00bee65d  ff5110  CALL dword ptr [ECX + 0x10]
00bee660  8bd0  MOV EDX,EAX
00bee662  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee665  8b08  MOV ECX,dword ptr [EAX]
00bee667  ff511c  CALL dword ptr [ECX + 0x1c]
00bee66a  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
00bee66d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee670  8b08  MOV ECX,dword ptr [EAX]
00bee672  ff5128  CALL dword ptr [ECX + 0x28]
00bee675  8945e8  MOV dword ptr [EBP + -0x18],EAX
00bee678  8b4318  MOV EAX,dword ptr [EBX + 0x18]
00bee67b  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00bee67e  8955d4  MOV dword ptr [EBP + -0x2c],EDX
00bee681  8d55d4  LEA EDX,[EBP + -0x2c]
00bee684  83c004  ADD EAX,0x4
00bee687  e814b186ff  CALL 0x004597a0
00bee68c  8d45f4  LEA EAX,[EBP + -0xc]
00bee68f  e8a42082ff  CALL 0x00410738
00bee694  8bc8  MOV ECX,EAX
00bee696  ba94e9be00  MOV EDX,0xbee994
00bee69b  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bee69e  e845ab81ff  CALL 0x004091e8
00bee6a3  84c0  TEST AL,AL
00bee6a5  742a  JZ 0x00bee6d1
00bee6a7  8d55b8  LEA EDX,[EBP + -0x48]
00bee6aa  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee6ad  8b08  MOV ECX,dword ptr [EAX]
00bee6af  ff5118  CALL dword ptr [ECX + 0x18]
00bee6b2  8b55b8  MOV EDX,dword ptr [EBP + -0x48]
00bee6b5  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee6b8  8b08  MOV ECX,dword ptr [EAX]
00bee6ba  ff5144  CALL dword ptr [ECX + 0x44]
00bee6bd  b202  MOV DL,0x2
00bee6bf  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee6c2  8b08  MOV ECX,dword ptr [EAX]
00bee6c4  ff5130  CALL dword ptr [ECX + 0x30]
00bee6c7  b201  MOV DL,0x1
00bee6c9  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bee6cc  8b08  MOV ECX,dword ptr [EAX]
00bee6ce  ff5134  CALL dword ptr [ECX + 0x34]
00bee6d1  8d45f8  LEA EAX,[EBP + -0x8]
00bee6d4  e85f2082ff  CALL 0x00410738
00bee6d9  8bc8  MOV ECX,EAX
00bee6db  baa4e9be00  MOV EDX,0xbee9a4
00bee6e0  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bee6e3  e838b184ff  CALL 0x00439820
00bee6e8  84c0  TEST AL,AL
00bee6ea  740b  JZ 0x00bee6f7
00bee6ec  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00bee6ef  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00bee6f2  8b08  MOV ECX,dword ptr [EAX]
00bee6f4  ff5128  CALL dword ptr [ECX + 0x28]
00bee6f7  8d45f0  LEA EAX,[EBP + -0x10]
00bee6fa  e8392082ff  CALL 0x00410738
00bee6ff  8bc8  MOV ECX,EAX
00bee701  bab4e9be00  MOV EDX,0xbee9b4
00bee706  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bee709  e812b184ff  CALL 0x00439820
00bee70e  84c0  TEST AL,AL
00bee710  7439  JZ 0x00bee74b
00bee712  8b4b20  MOV ECX,dword ptr [EBX + 0x20]
00bee715  8bd3  MOV EDX,EBX
00bee717  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bee71a  8b38  MOV EDI,dword ptr [EAX]
00bee71c  ff570c  CALL dword ptr [EDI + 0xc]
00bee71f  0fb64b24  MOVZX ECX,byte ptr [EBX + 0x24]
00bee723  8bd3  MOV EDX,EBX
00bee725  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bee728  8b38  MOV EDI,dword ptr [EAX]
00bee72a  ff5714  CALL dword ptr [EDI + 0x14]
00bee72d  eb1c  JMP 0x00bee74b
00bee72f  6800002440  PUSH 0x40240000
00bee734  6a00  PUSH 0x0
00bee736  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee739  8b10  MOV EDX,dword ptr [EAX]
00bee73b  ff5214  CALL dword ptr [EDX + 0x14]
00bee73e  8b531c  MOV EDX,dword ptr [EBX + 0x1c]
00bee741  8b0482  MOV EAX,dword ptr [EDX + EAX*0x4]
00bee744  b201  MOV DL,0x1
00bee746  8b08  MOV ECX,dword ptr [EAX]
00bee748  ff513c  CALL dword ptr [ECX + 0x3c]
00bee74b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee74e  8b10  MOV EDX,dword ptr [EAX]
00bee750  ff5214  CALL dword ptr [EDX + 0x14]
00bee753  8b531c  MOV EDX,dword ptr [EBX + 0x1c]
00bee756  8b0482  MOV EAX,dword ptr [EDX + EAX*0x4]
00bee759  8b10  MOV EDX,dword ptr [EAX]
00bee75b  ff5210  CALL dword ptr [EDX + 0x10]
00bee75e  8bf8  MOV EDI,EAX
00bee760  4f  DEC EDI
00bee761  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee764  8b10  MOV EDX,dword ptr [EAX]
00bee766  ff5210  CALL dword ptr [EDX + 0x10]
00bee769  3bf8  CMP EDI,EAX
00bee76b  7cc2  JL 0x00bee72f
00bee76d  6a00  PUSH 0x0
00bee76f  6a05  PUSH 0x5
00bee771  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee774  8b10  MOV EDX,dword ptr [EAX]
00bee776  ff5210  CALL dword ptr [EDX + 0x10]
00bee779  50  PUSH EAX
00bee77a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bee77d  8b10  MOV EDX,dword ptr [EAX]
00bee77f  ff5214  CALL dword ptr [EDX + 0x14]
00bee782  8b531c  MOV EDX,dword ptr [EBX + 0x1c]
00bee785  8b0482  MOV EAX,dword ptr [EDX + EAX*0x4]
00bee788  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
00bee78b  59  POP ECX
00bee78c  8b38  MOV EDI,dword ptr [EAX]
00bee78e  ff5740  CALL dword ptr [EDI + 0x40]
00bee791  46  INC ESI
00bee792  ff4ddc  DEC dword ptr [EBP + -0x24]
00bee795  0f859afeffff  JNZ 0x00bee635
00bee79b  33d2  XOR EDX,EDX
00bee79d  55  PUSH EBP
00bee79e  68b5e8be00  PUSH 0xbee8b5
00bee7a3  64ff32  PUSH dword ptr FS:[EDX]
00bee7a6  648922  MOV dword ptr FS:[EDX],ESP
00bee7a9  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee7ac  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee7b2  8b10  MOV EDX,dword ptr [EAX]
00bee7b4  ff5220  CALL dword ptr [EDX + 0x20]
00bee7b7  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee7ba  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee7c0  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee7c3  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00bee7c6  48  DEC EAX
00bee7c7  85c0  TEST EAX,EAX
00bee7c9  0f8cc8000000  JL 0x00bee897
00bee7cf  40  INC EAX
00bee7d0  8945dc  MOV dword ptr [EBP + -0x24],EAX
00bee7d3  33f6  XOR ESI,ESI
00bee7d5  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee7d8  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee7de  8bd6  MOV EDX,ESI
00bee7e0  e8b3c5acff  CALL 0x006bad98
00bee7e5  b201  MOV DL,0x1
00bee7e7  e8fcc4acff  CALL 0x006bace8
00bee7ec  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee7ef  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee7f5  8bd6  MOV EDX,ESI
00bee7f7  e89cc5acff  CALL 0x006bad98
00bee7fc  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
00bee7ff  8bbae8020000  MOV EDI,dword ptr [EDX + 0x2e8]
00bee805  8b5708  MOV EDX,dword ptr [EDI + 0x8]
00bee808  db4208  FILD dword ptr [EDX + 0x8]
00bee80b  d83dc4e9be00  FDIVR float ptr [0x00bee9c4]
00bee811  dd5db0  FSTP double ptr [EBP + -0x50]
00bee814  9b  WAIT
00bee815  ff75b4  PUSH dword ptr [EBP + -0x4c]
00bee818  ff75b0  PUSH dword ptr [EBP + -0x50]
00bee81b  e8d8c4acff  CALL 0x006bacf8
00bee820  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee823  8b04b0  MOV EAX,dword ptr [EAX + ESI*0x4]
00bee826  8b10  MOV EDX,dword ptr [EAX]
00bee828  ff5210  CALL dword ptr [EDX + 0x10]
00bee82b  48  DEC EAX
00bee82c  85c0  TEST EAX,EAX
00bee82e  7c52  JL 0x00bee882
00bee830  40  INC EAX
00bee831  8945d8  MOV dword ptr [EBP + -0x28],EAX
00bee834  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00bee83b  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee83e  8b04b0  MOV EAX,dword ptr [EAX + ESI*0x4]
00bee841  b101  MOV CL,0x1
00bee843  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00bee846  8b38  MOV EDI,dword ptr [EAX]
00bee848  ff5730  CALL dword ptr [EDI + 0x30]
00bee84b  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee84e  8b04b0  MOV EAX,dword ptr [EAX + ESI*0x4]
00bee851  8b10  MOV EDX,dword ptr [EAX]
00bee853  ff5210  CALL dword ptr [EDX + 0x10]
00bee856  8945ac  MOV dword ptr [EBP + -0x54],EAX
00bee859  db45ac  FILD dword ptr [EBP + -0x54]
00bee85c  d83dc4e9be00  FDIVR float ptr [0x00bee9c4]
00bee862  dd5db0  FSTP double ptr [EBP + -0x50]
00bee865  9b  WAIT
00bee866  ff75b4  PUSH dword ptr [EBP + -0x4c]
00bee869  ff75b0  PUSH dword ptr [EBP + -0x50]
00bee86c  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee86f  8b04b0  MOV EAX,dword ptr [EAX + ESI*0x4]
00bee872  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00bee875  8b08  MOV ECX,dword ptr [EAX]
00bee877  ff512c  CALL dword ptr [ECX + 0x2c]
00bee87a  ff45e0  INC dword ptr [EBP + -0x20]
00bee87d  ff4dd8  DEC dword ptr [EBP + -0x28]
00bee880  75b9  JNZ 0x00bee83b
00bee882  8b431c  MOV EAX,dword ptr [EBX + 0x1c]
00bee885  8b04b0  MOV EAX,dword ptr [EAX + ESI*0x4]
00bee888  8b10  MOV EDX,dword ptr [EAX]
00bee88a  ff5248  CALL dword ptr [EDX + 0x48]
00bee88d  46  INC ESI
00bee88e  ff4ddc  DEC dword ptr [EBP + -0x24]
00bee891  0f853effffff  JNZ 0x00bee7d5
00bee897  33c0  XOR EAX,EAX
00bee899  5a  POP EDX
00bee89a  59  POP ECX
00bee89b  59  POP ECX
00bee89c  648910  MOV dword ptr FS:[EAX],EDX
00bee89f  68bce8be00  PUSH 0xbee8bc
00bee8a4  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
00bee8a7  8b80e8020000  MOV EAX,dword ptr [EAX + 0x2e8]
00bee8ad  8b10  MOV EDX,dword ptr [EAX]
00bee8af  ff5224  CALL dword ptr [EDX + 0x24]
00bee8b2  58  POP EAX
00bee8b3  ffe0  JMP EAX
