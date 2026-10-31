; Static instruction listing. Function bodies and indirect exception flow require review.
0117b878  55  PUSH EBP
0117b879  8bec  MOV EBP,ESP
0117b87b  83c4c0  ADD ESP,-0x40
0117b87e  53  PUSH EBX
0117b87f  33db  XOR EBX,EBX
0117b881  895dc0  MOV dword ptr [EBP + -0x40],EBX
0117b884  895ddc  MOV dword ptr [EBP + -0x24],EBX
0117b887  895dd8  MOV dword ptr [EBP + -0x28],EBX
0117b88a  895dd4  MOV dword ptr [EBP + -0x2c],EBX
0117b88d  895de0  MOV dword ptr [EBP + -0x20],EBX
0117b890  894df4  MOV dword ptr [EBP + -0xc],ECX
0117b893  8955f8  MOV dword ptr [EBP + -0x8],EDX
0117b896  8945fc  MOV dword ptr [EBP + -0x4],EAX
0117b899  33c0  XOR EAX,EAX
0117b89b  55  PUSH EBP
0117b89c  68a6bc1701  PUSH 0x117bca6
0117b8a1  64ff30  PUSH dword ptr FS:[EAX]
0117b8a4  648920  MOV dword ptr FS:[EAX],ESP
0117b8a7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b8aa  e8c9fdffff  CALL 0x0117b678
0117b8af  84c0  TEST AL,AL
0117b8b1  0f84ca030000  JZ 0x0117bc81
0117b8b7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b8ba  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117b8c0  e84f5763ff  CALL 0x007b1014
0117b8c5  8b10  MOV EDX,dword ptr [EAX]
0117b8c7  ff5214  CALL dword ptr [EDX + 0x14]
0117b8ca  85c0  TEST EAX,EAX
0117b8cc  7f28  JG 0x0117b8f6
0117b8ce  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b8d1  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117b8d7  e8385763ff  CALL 0x007b1014
0117b8dc  50  PUSH EAX
0117b8dd  8d45e0  LEA EAX,[EBP + -0x20]
0117b8e0  8b4d10  MOV ECX,dword ptr [EBP + 0x10]
0117b8e3  bac0bc1701  MOV EDX,0x117bcc0
0117b8e8  e89f0829ff  CALL 0x0040c18c
0117b8ed  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
0117b8f0  58  POP EAX
0117b8f1  8b08  MOV ECX,dword ptr [EAX]
0117b8f3  ff513c  CALL dword ptr [ECX + 0x3c]
0117b8f6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b8f9  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117b8ff  33d2  XOR EDX,EDX
0117b901  8b08  MOV ECX,dword ptr [EAX]
0117b903  ff9170010000  CALL dword ptr [ECX + 0x170]
0117b909  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b90c  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117b912  e8fd5663ff  CALL 0x007b1014
0117b917  33d2  XOR EDX,EDX
0117b919  8b08  MOV ECX,dword ptr [EAX]
0117b91b  ff5118  CALL dword ptr [ECX + 0x18]
0117b91e  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117b921  898288060000  MOV dword ptr [EDX + 0x688],EAX
0117b927  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b92a  83b88806000000  CMP dword ptr [EAX + 0x688],0x0
0117b931  7515  JNZ 0x0117b948
0117b933  b201  MOV DL,0x1
0117b935  a124871d01  MOV EAX,[0x011d8724]
0117b93a  e84dd728ff  CALL 0x0040908c
0117b93f  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
0117b942  898288060000  MOV dword ptr [EDX + 0x688],EAX
0117b948  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117b94b  8b8088060000  MOV EAX,dword ptr [EAX + 0x688]
0117b951  8945e4  MOV dword ptr [EBP + -0x1c],EAX
0117b954  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117b957  33d2  XOR EDX,EDX
0117b959  895018  MOV dword ptr [EAX + 0x18],EDX
0117b95c  89501c  MOV dword ptr [EAX + 0x1c],EDX
0117b95f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117b962  33d2  XOR EDX,EDX
0117b964  895020  MOV dword ptr [EAX + 0x20],EDX
0117b967  895024  MOV dword ptr [EAX + 0x24],EDX
0117b96a  807d0c00  CMP byte ptr [EBP + 0xc],0x0
0117b96e  0f842f010000  JZ 0x0117baa3
0117b974  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117b977  c6401100  MOV byte ptr [EAX + 0x11],0x0
0117b97b  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117b97e  c6401001  MOV byte ptr [EAX + 0x10],0x1
0117b982  837df806  CMP dword ptr [EBP + -0x8],0x6
0117b986  0f858a000000  JNZ 0x0117ba16
0117b98c  8d45dc  LEA EAX,[EBP + -0x24]
0117b98f  50  PUSH EAX
0117b990  8d45d8  LEA EAX,[EBP + -0x28]
0117b993  50  PUSH EAX
0117b994  8d55d4  LEA EDX,[EBP + -0x2c]
0117b997  a190f42401  MOV EAX,[0x0124f490]
0117b99c  8b00  MOV EAX,dword ptr [EAX]
0117b99e  e8a5b10500  CALL 0x011d6b48
0117b9a3  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
0117b9a6  b902000000  MOV ECX,0x2
0117b9ab  66ba5e00  MOV DX,0x5e
0117b9af  e838f361ff  CALL 0x0079acec
0117b9b4  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
0117b9b7  b903000000  MOV ECX,0x3
0117b9bc  66ba3b00  MOV DX,0x3b
0117b9c0  e827f361ff  CALL 0x0079acec
0117b9c5  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
0117b9c8  e8bfee0400  CALL 0x011ca88c
0117b9cd  83c4f8  ADD ESP,-0x8
0117b9d0  dd1c24  FSTP double ptr [ESP]
0117b9d3  9b  WAIT
0117b9d4  e83b5483ff  CALL 0x009b0e14
0117b9d9  e8c2cb28ff  CALL 0x004085a0
0117b9de  8945cc  MOV dword ptr [EBP + -0x34],EAX
0117b9e1  8955d0  MOV dword ptr [EBP + -0x30],EDX
0117b9e4  df6dcc  FILD qword ptr [EBP + -0x34]
0117b9e7  dd5de8  FSTP double ptr [EBP + -0x18]
0117b9ea  9b  WAIT
0117b9eb  dd45e8  FLD double ptr [EBP + -0x18]
0117b9ee  d825ccbc1701  FSUB float ptr [0x0117bccc]
0117b9f4  dd5dcc  FSTP double ptr [EBP + -0x34]
0117b9f7  9b  WAIT
0117b9f8  ff75d0  PUSH dword ptr [EBP + -0x30]
0117b9fb  ff75cc  PUSH dword ptr [EBP + -0x34]
0117b9fe  e8815383ff  CALL 0x009b0d84
0117ba03  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117ba06  dd5818  FSTP double ptr [EAX + 0x18]
0117ba09  9b  WAIT
0117ba0a  e89dec0400  CALL 0x011ca6ac
0117ba0f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117ba12  dd5820  FSTP double ptr [EAX + 0x20]
0117ba15  9b  WAIT
0117ba16  837df808  CMP dword ptr [EBP + -0x8],0x8
0117ba1a  0f858b000000  JNZ 0x0117baab
0117ba20  a1e0f22401  MOV EAX,[0x0124f2e0]
0117ba25  8b00  MOV EAX,dword ptr [EAX]
0117ba27  d9ee  FLDZ
0117ba29  dd4050  FLD double ptr [EAX + 0x50]
0117ba2c  dae9  FUCOMPP
0117ba2e  9bdfe0  FSTSW AX
0117ba31  9e  SAHF
0117ba32  7626  JBE 0x0117ba5a
0117ba34  a1e0f22401  MOV EAX,[0x0124f2e0]
0117ba39  8b00  MOV EAX,dword ptr [EAX]
0117ba3b  ff7054  PUSH dword ptr [EAX + 0x54]
0117ba3e  ff7050  PUSH dword ptr [EAX + 0x50]
0117ba41  e8ce5383ff  CALL 0x009b0e14
0117ba46  e855cb28ff  CALL 0x004085a0
0117ba4b  8945cc  MOV dword ptr [EBP + -0x34],EAX
0117ba4e  8955d0  MOV dword ptr [EBP + -0x30],EDX
0117ba51  df6dcc  FILD qword ptr [EBP + -0x34]
0117ba54  dd5de8  FSTP double ptr [EBP + -0x18]
0117ba57  9b  WAIT
0117ba58  eb29  JMP 0x0117ba83
0117ba5a  e84dec0400  CALL 0x011ca6ac
0117ba5f  83c4f8  ADD ESP,-0x8
0117ba62  dd1c24  FSTP double ptr [ESP]
0117ba65  9b  WAIT
0117ba66  e8a95383ff  CALL 0x009b0e14
0117ba6b  e830cb28ff  CALL 0x004085a0
0117ba70  83e81e  SUB EAX,0x1e
0117ba73  83da00  SBB EDX,0x0
0117ba76  8945cc  MOV dword ptr [EBP + -0x34],EAX
0117ba79  8955d0  MOV dword ptr [EBP + -0x30],EDX
0117ba7c  df6dcc  FILD qword ptr [EBP + -0x34]
0117ba7f  dd5de8  FSTP double ptr [EBP + -0x18]
0117ba82  9b  WAIT
0117ba83  ff75ec  PUSH dword ptr [EBP + -0x14]
0117ba86  ff75e8  PUSH dword ptr [EBP + -0x18]
0117ba89  e8f65283ff  CALL 0x009b0d84
0117ba8e  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117ba91  dd5818  FSTP double ptr [EAX + 0x18]
0117ba94  9b  WAIT
0117ba95  e812ec0400  CALL 0x011ca6ac
0117ba9a  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117ba9d  dd5820  FSTP double ptr [EAX + 0x20]
0117baa0  9b  WAIT
0117baa1  eb08  JMP 0x0117baab
0117baa3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117baa6  e85dfbffff  CALL 0x0117b608
0117baab  837df81b  CMP dword ptr [EBP + -0x8],0x1b
0117baaf  7534  JNZ 0x0117bae5
0117bab1  e876f70500  CALL 0x011db22c
0117bab6  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bab9  dd5818  FSTP double ptr [EAX + 0x18]
0117babc  9b  WAIT
0117babd  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bac0  d9ee  FLDZ
0117bac2  dd4018  FLD double ptr [EAX + 0x18]
0117bac5  dae9  FUCOMPP
0117bac7  9bdfe0  FSTSW AX
0117baca  f6c405  TEST AH,0x5
0117bacd  7a0a  JP 0x0117bad9
0117bacf  b8dcbc1701  MOV EAX,0x117bcdc
0117bad4  e817f661ff  CALL 0x0079b0f0
0117bad9  e8ceeb0400  CALL 0x011ca6ac
0117bade  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bae1  dd5820  FSTP double ptr [EAX + 0x20]
0117bae4  9b  WAIT
0117bae5  837d0800  CMP dword ptr [EBP + 0x8],0x0
0117bae9  7e44  JLE 0x0117bb2f
0117baeb  e838582bff  CALL 0x00431328
0117baf0  e8abca28ff  CALL 0x004085a0
0117baf5  52  PUSH EDX
0117baf6  50  PUSH EAX
0117baf7  8b4508  MOV EAX,dword ptr [EBP + 0x8]
0117bafa  99  CDQ
0117bafb  290424  SUB dword ptr [ESP],EAX
0117bafe  19542404  SBB dword ptr [ESP + 0x4],EDX
0117bb02  58  POP EAX
0117bb03  5a  POP EDX
0117bb04  8945cc  MOV dword ptr [EBP + -0x34],EAX
0117bb07  8955d0  MOV dword ptr [EBP + -0x30],EDX
0117bb0a  df6dcc  FILD qword ptr [EBP + -0x34]
0117bb0d  dd5dc4  FSTP double ptr [EBP + -0x3c]
0117bb10  9b  WAIT
0117bb11  ff75c8  PUSH dword ptr [EBP + -0x38]
0117bb14  ff75c4  PUSH dword ptr [EBP + -0x3c]
0117bb17  e8685283ff  CALL 0x009b0d84
0117bb1c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb1f  dd5818  FSTP double ptr [EAX + 0x18]
0117bb22  9b  WAIT
0117bb23  e884eb0400  CALL 0x011ca6ac
0117bb28  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb2b  dd5820  FSTP double ptr [EAX + 0x20]
0117bb2e  9b  WAIT
0117bb2f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb32  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
0117bb35  89500c  MOV dword ptr [EAX + 0xc],EDX
0117bb38  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb3b  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
0117bb3e  895008  MOV dword ptr [EAX + 0x8],EDX
0117bb41  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb44  33d2  XOR EDX,EDX
0117bb46  895028  MOV dword ptr [EAX + 0x28],EDX
0117bb49  89502c  MOV dword ptr [EAX + 0x2c],EDX
0117bb4c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb4f  33d2  XOR EDX,EDX
0117bb51  895030  MOV dword ptr [EAX + 0x30],EDX
0117bb54  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb57  83c034  ADD EAX,0x34
0117bb5a  8b5510  MOV EDX,dword ptr [EBP + 0x10]
0117bb5d  e862f828ff  CALL 0x0040b3c4
0117bb62  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bb65  8b8040050000  MOV EAX,dword ptr [EAX + 0x540]
0117bb6b  e8a45463ff  CALL 0x007b1014
0117bb70  50  PUSH EAX
0117bb71  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb74  8b4834  MOV ECX,dword ptr [EAX + 0x34]
0117bb77  8d45c0  LEA EAX,[EBP + -0x40]
0117bb7a  bac0bc1701  MOV EDX,0x117bcc0
0117bb7f  e8080629ff  CALL 0x0040c18c
0117bb84  8b4dc0  MOV ECX,dword ptr [EBP + -0x40]
0117bb87  33d2  XOR EDX,EDX
0117bb89  58  POP EAX
0117bb8a  8b18  MOV EBX,dword ptr [EAX]
0117bb8c  ff5320  CALL dword ptr [EBX + 0x20]
0117bb8f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb92  66c740384300  MOV word ptr [EAX + 0x38],0x43
0117bb98  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bb9b  33d2  XOR EDX,EDX
0117bb9d  895058  MOV dword ptr [EAX + 0x58],EDX
0117bba0  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
0117bba3  33d2  XOR EDX,EDX
0117bba5  895060  MOV dword ptr [EAX + 0x60],EDX
0117bba8  895064  MOV dword ptr [EAX + 0x64],EDX
0117bbab  8b4510  MOV EAX,dword ptr [EBP + 0x10]
0117bbae  ba70bd1701  MOV EDX,0x117bd70
0117bbb3  e86c0729ff  CALL 0x0040c324
0117bbb8  7561  JNZ 0x0117bc1b
0117bbba  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bbbd  8b9024060000  MOV EDX,dword ptr [EAX + 0x624]
0117bbc3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bbc6  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117bbcc  e8b36a48ff  CALL 0x00602684
0117bbd1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bbd4  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117bbda  33d2  XOR EDX,EDX
0117bbdc  8b08  MOV ECX,dword ptr [EAX]
0117bbde  ff9198010000  CALL dword ptr [ECX + 0x198]
0117bbe4  a1aca92501  MOV EAX,[0x0125a9ac]
0117bbe9  8b80b4040000  MOV EAX,dword ptr [EAX + 0x4b4]
0117bbef  33d2  XOR EDX,EDX
0117bbf1  e832d558ff  CALL 0x00709128
0117bbf6  6a00  PUSH 0x0
0117bbf8  66c745cc3100  MOV word ptr [EBP + -0x34],0x31
0117bbfe  c645d009  MOV byte ptr [EBP + -0x30],0x9
0117bc02  8d55cc  LEA EDX,[EBP + -0x34]
0117bc05  33c9  XOR ECX,ECX
0117bc07  b8acbd1701  MOV EAX,0x117bdac
0117bc0c  e8671b83ff  CALL 0x009ad778
0117bc11  a14cfd2401  MOV EAX,[0x0124fd4c]
0117bc16  c60001  MOV byte ptr [EAX],0x1
0117bc19  eb66  JMP 0x0117bc81
0117bc1b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bc1e  8b904c050000  MOV EDX,dword ptr [EAX + 0x54c]
0117bc24  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bc27  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117bc2d  e8526a48ff  CALL 0x00602684
0117bc32  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bc35  8b8038050000  MOV EAX,dword ptr [EAX + 0x538]
0117bc3b  b201  MOV DL,0x1
0117bc3d  8b08  MOV ECX,dword ptr [EAX]
0117bc3f  ff9198010000  CALL dword ptr [ECX + 0x198]
0117bc45  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
0117bc48  8a90f9060000  MOV DL,byte ptr [EAX + 0x6f9]
0117bc4e  a1aca92501  MOV EAX,[0x0125a9ac]
0117bc53  8b80b4040000  MOV EAX,dword ptr [EAX + 0x4b4]
0117bc59  e8cad458ff  CALL 0x00709128
0117bc5e  6a00  PUSH 0x0
0117bc60  66c745cc3000  MOV word ptr [EBP + -0x34],0x30
0117bc66  c645d009  MOV byte ptr [EBP + -0x30],0x9
0117bc6a  8d55cc  LEA EDX,[EBP + -0x34]
0117bc6d  33c9  XOR ECX,ECX
0117bc6f  b8acbd1701  MOV EAX,0x117bdac
0117bc74  e8ff1a83ff  CALL 0x009ad778
0117bc79  a14cfd2401  MOV EAX,[0x0124fd4c]
0117bc7e  c60000  MOV byte ptr [EAX],0x0
0117bc81  33c0  XOR EAX,EAX
0117bc83  5a  POP EDX
0117bc84  59  POP ECX
0117bc85  59  POP ECX
0117bc86  648910  MOV dword ptr FS:[EAX],EDX
0117bc89  68adbc1701  PUSH 0x117bcad
0117bc8e  8d45c0  LEA EAX,[EBP + -0x40]
0117bc91  e83ef328ff  CALL 0x0040afd4
0117bc96  8d45d4  LEA EAX,[EBP + -0x2c]
0117bc99  ba04000000  MOV EDX,0x4
0117bc9e  e891f328ff  CALL 0x0040b034
0117bca3  58  POP EAX
0117bca4  ffe0  JMP EAX
