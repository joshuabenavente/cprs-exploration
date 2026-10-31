; Static instruction listing. Function bodies and indirect exception flow require review.
00fecc4c  55  PUSH EBP
00fecc4d  8bec  MOV EBP,ESP
00fecc4f  83c4f4  ADD ESP,-0xc
00fecc52  8955f8  MOV dword ptr [EBP + -0x8],EDX
00fecc55  8945fc  MOV dword ptr [EBP + -0x4],EAX
00fecc58  803deca6250100  CMP byte ptr [0x0125a6ec],0x0
00fecc5f  7409  JZ 0x00fecc6a
00fecc61  c645f700  MOV byte ptr [EBP + -0x9],0x0
00fecc65  e979020000  JMP 0x00fecee3
00fecc6a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fecc6d  80b80807000000  CMP byte ptr [EAX + 0x708],0x0
00fecc74  7528  JNZ 0x00fecc9e
00fecc76  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fecc79  80b8e306000000  CMP byte ptr [EAX + 0x6e3],0x0
00fecc80  751c  JNZ 0x00fecc9e
00fecc82  a1e0f22401  MOV EAX,[0x0124f2e0]
00fecc87  8b00  MOV EAX,dword ptr [EAX]
00fecc89  83780400  CMP dword ptr [EAX + 0x4],0x0
00fecc8d  740f  JZ 0x00fecc9e
00fecc8f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fecc92  8b80d8050000  MOV EAX,dword ptr [EAX + 0x5d8]
00fecc98  80786900  CMP byte ptr [EAX + 0x69],0x0
00fecc9c  7409  JZ 0x00fecca7
00fecc9e  c645f701  MOV byte ptr [EBP + -0x9],0x1
00fecca2  e93c020000  JMP 0x00fecee3
00fecca7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feccaa  c680db06000001  MOV byte ptr [EAX + 0x6db],0x1
00feccb1  33c0  XOR EAX,EAX
00feccb3  55  PUSH EBP
00feccb4  68dccefe00  PUSH 0xfecedc
00feccb9  64ff30  PUSH dword ptr FS:[EAX]
00feccbc  648920  MOV dword ptr FS:[EAX],ESP
00feccbf  c645f701  MOV byte ptr [EBP + -0x9],0x1
00feccc3  e8f0a5e0ff  CALL 0x00df72b8
00feccc8  84c0  TEST AL,AL
00feccca  7515  JNZ 0x00fecce1
00fecccc  e813deafff  CALL 0x00aeaae4
00feccd1  84c0  TEST AL,AL
00feccd3  750c  JNZ 0x00fecce1
00feccd5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feccd8  e887130000  CALL 0x00fee064
00feccdd  84c0  TEST AL,AL
00feccdf  7411  JZ 0x00feccf2
00fecce1  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00fecce4  baf8cefe00  MOV EDX,0xfecef8
00fecce9  e8d6e641ff  CALL 0x0040b3c4
00feccee  c645f700  MOV byte ptr [EBP + -0x9],0x0
00feccf2  807df700  CMP byte ptr [EBP + -0x9],0x0
00feccf6  740e  JZ 0x00fecd06
00feccf8  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00feccfb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feccfe  e81d510100  CALL 0x01001e20
00fecd03  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd06  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd0a  7415  JZ 0x00fecd21
00fecd0c  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd0f  a19cf52401  MOV EAX,[0x0124f59c]
00fecd14  8b00  MOV EAX,dword ptr [EAX]
00fecd16  8b08  MOV ECX,dword ptr [EAX]
00fecd18  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecd1e  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd21  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd25  7415  JZ 0x00fecd3c
00fecd27  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd2a  a168ef2401  MOV EAX,[0x0124ef68]
00fecd2f  8b00  MOV EAX,dword ptr [EAX]
00fecd31  8b08  MOV ECX,dword ptr [EAX]
00fecd33  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecd39  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd3c  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd40  7415  JZ 0x00fecd57
00fecd42  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd45  a190e02401  MOV EAX,[0x0124e090]
00fecd4a  8b00  MOV EAX,dword ptr [EAX]
00fecd4c  8b08  MOV ECX,dword ptr [EAX]
00fecd4e  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecd54  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd57  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd5b  7415  JZ 0x00fecd72
00fecd5d  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd60  a174e52401  MOV EAX,[0x0124e574]
00fecd65  8b00  MOV EAX,dword ptr [EAX]
00fecd67  8b08  MOV ECX,dword ptr [EAX]
00fecd69  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecd6f  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd72  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd76  7415  JZ 0x00fecd8d
00fecd78  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd7b  a108f32401  MOV EAX,[0x0124f308]
00fecd80  8b00  MOV EAX,dword ptr [EAX]
00fecd82  8b08  MOV ECX,dword ptr [EAX]
00fecd84  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecd8a  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecd8d  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecd91  7415  JZ 0x00fecda8
00fecd93  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecd96  a13cec2401  MOV EAX,[0x0124ec3c]
00fecd9b  8b00  MOV EAX,dword ptr [EAX]
00fecd9d  8b08  MOV ECX,dword ptr [EAX]
00fecd9f  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecda5  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecda8  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecdac  741f  JZ 0x00fecdcd
00fecdae  a138ed2401  MOV EAX,[0x0124ed38]
00fecdb3  833800  CMP dword ptr [EAX],0x0
00fecdb6  7415  JZ 0x00fecdcd
00fecdb8  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecdbb  a138ed2401  MOV EAX,[0x0124ed38]
00fecdc0  8b00  MOV EAX,dword ptr [EAX]
00fecdc2  8b08  MOV ECX,dword ptr [EAX]
00fecdc4  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecdca  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecdcd  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecdd1  7415  JZ 0x00fecde8
00fecdd3  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecdd6  a15cf32401  MOV EAX,[0x0124f35c]
00fecddb  8b00  MOV EAX,dword ptr [EAX]
00fecddd  8b08  MOV ECX,dword ptr [EAX]
00fecddf  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fecde5  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecde8  807df700  CMP byte ptr [EBP + -0x9],0x0
00fecdec  7415  JZ 0x00fece03
00fecdee  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fecdf1  a1b4e52401  MOV EAX,[0x0124e5b4]
00fecdf6  8b00  MOV EAX,dword ptr [EAX]
00fecdf8  8b08  MOV ECX,dword ptr [EAX]
00fecdfa  ff91cc010000  CALL dword ptr [ECX + 0x1cc]
00fece00  8845f7  MOV byte ptr [EBP + -0x9],AL
00fece03  807df700  CMP byte ptr [EBP + -0x9],0x0
00fece07  7412  JZ 0x00fece1b
00fece09  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00fece0c  a178f22401  MOV EAX,[0x0124f278]
00fece11  8b00  MOV EAX,dword ptr [EAX]
00fece13  e8ec12c9ff  CALL 0x00c7e104
00fece18  8845f7  MOV byte ptr [EBP + -0x9],AL
00fece1b  a1dcf92401  MOV EAX,[0x0124f9dc]
00fece20  8b00  MOV EAX,dword ptr [EAX]
00fece22  80785600  CMP byte ptr [EAX + 0x56],0x0
00fece26  0f8596000000  JNZ 0x00fecec2
00fece2c  807df700  CMP byte ptr [EBP + -0x9],0x0
00fece30  0f848c000000  JZ 0x00fecec2
00fece36  a1dcf82401  MOV EAX,[0x0124f8dc]
00fece3b  8b00  MOV EAX,dword ptr [EAX]
00fece3d  e8da951e00  CALL 0x011d641c
00fece42  84c0  TEST AL,AL
00fece44  747c  JZ 0x00fecec2
00fece46  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fece49  e8467a0100  CALL 0x01004894
00fece4e  83e07f  AND EAX,0x7f
00fece51  8b15e0fb2401  MOV EDX,dword ptr [0x0124fbe0]
00fece57  668b0442  MOV AX,word ptr [EDX + EAX*0x2]
00fece5b  6683e830  SUB AX,0x30
00fece5f  742e  JZ 0x00fece8f
00fece61  66ffc8  DEC AX
00fece64  755c  JNZ 0x00fecec2
00fece66  a1dcf82401  MOV EAX,[0x0124f8dc]
00fece6b  8b00  MOV EAX,dword ptr [EAX]
00fece6d  e8aa951e00  CALL 0x011d641c
00fece72  84c0  TEST AL,AL
00fece74  7413  JZ 0x00fece89
00fece76  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00fece79  ba28cffe00  MOV EDX,0xfecf28
00fece7e  e841e541ff  CALL 0x0040b3c4
00fece83  c645f700  MOV byte ptr [EBP + -0x9],0x0
00fece87  eb39  JMP 0x00fecec2
00fece89  c645f701  MOV byte ptr [EBP + -0x9],0x1
00fece8d  eb33  JMP 0x00fecec2
00fece8f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fece92  e851f0ffff  CALL 0x00febee8
00fece97  84c0  TEST AL,AL
00fece99  7515  JNZ 0x00feceb0
00fece9b  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
00fece9e  8b00  MOV EAX,dword ptr [EAX]
00fecea0  ba70cffe00  MOV EDX,0xfecf70
00fecea5  e87af441ff  CALL 0x0040c324
00feceaa  7404  JZ 0x00feceb0
00feceac  33c0  XOR EAX,EAX
00feceae  eb02  JMP 0x00feceb2
00feceb0  b001  MOV AL,0x1
00feceb2  8845f6  MOV byte ptr [EBP + -0xa],AL
00feceb5  33d2  XOR EDX,EDX
00feceb7  8a45f6  MOV AL,byte ptr [EBP + -0xa]
00feceba  e8a1b0fcff  CALL 0x00fb7f60
00fecebf  8845f7  MOV byte ptr [EBP + -0x9],AL
00fecec2  33c0  XOR EAX,EAX
00fecec4  5a  POP EDX
00fecec5  59  POP ECX
00fecec6  59  POP ECX
00fecec7  648910  MOV dword ptr FS:[EAX],EDX
00fececa  68e3cefe00  PUSH 0xfecee3
00fececf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feced2  c680db06000000  MOV byte ptr [EAX + 0x6db],0x0
00feced9  58  POP EAX
00feceda  ffe0  JMP EAX
00fecee3  8a45f7  MOV AL,byte ptr [EBP + -0x9]
00fecee6  8be5  MOV ESP,EBP
00fecee8  5d  POP EBP
00fecee9  c3  RET
