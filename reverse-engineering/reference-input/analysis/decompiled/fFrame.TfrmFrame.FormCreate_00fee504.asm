; Static instruction listing. Function bodies and indirect exception flow require review.
00fee504  55  PUSH EBP
00fee505  8bec  MOV EBP,ESP
00fee507  b908000000  MOV ECX,0x8
00fee50c  6a00  PUSH 0x0
00fee50e  6a00  PUSH 0x0
00fee510  49  DEC ECX
00fee511  75f9  JNZ 0x00fee50c
00fee513  51  PUSH ECX
00fee514  53  PUSH EBX
00fee515  56  PUSH ESI
00fee516  57  PUSH EDI
00fee517  8955e4  MOV dword ptr [EBP + -0x1c],EDX
00fee51a  8945fc  MOV dword ptr [EBP + -0x4],EAX
00fee51d  33c0  XOR EAX,EAX
00fee51f  55  PUSH EBP
00fee520  6830f1fe00  PUSH 0xfef130
00fee525  64ff30  PUSH dword ptr FS:[EAX]
00fee528  648920  MOV dword ptr FS:[EAX],ESP
00fee52b  c605eca6250101  MOV byte ptr [0x0125a6ec],0x1
00fee532  33c0  XOR EAX,EAX
00fee534  55  PUSH EBP
00fee535  68eaf0fe00  PUSH 0xfef0ea
00fee53a  64ff30  PUSH dword ptr FS:[EAX]
00fee53d  648920  MOV dword ptr FS:[EAX],ESP
00fee540  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee543  c6806107000001  MOV byte ptr [EAX + 0x761],0x1
00fee54a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee54d  c680d106000000  MOV byte ptr [EAX + 0x6d1],0x0
00fee554  b201  MOV DL,0x1
00fee556  a19cdc1801  MOV EAX,[0x0118dc9c]
00fee55b  e8cc1b1a00  CALL 0x0119012c
00fee560  8b15b8f02401  MOV EDX,dword ptr [0x0124f0b8]
00fee566  8902  MOV dword ptr [EDX],EAX
00fee568  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee56b  8b1508fe2401  MOV EDX,dword ptr [0x0124fe08]
00fee571  8b12  MOV EDX,dword ptr [EDX]
00fee573  8b8ab0000000  MOV ECX,dword ptr [EDX + 0xb0]
00fee579  898820070000  MOV dword ptr [EAX + 0x720],ECX
00fee57f  8b8ab4000000  MOV ECX,dword ptr [EDX + 0xb4]
00fee585  898824070000  MOV dword ptr [EAX + 0x724],ECX
00fee58b  a108fe2401  MOV EAX,[0x0124fe08]
00fee590  8b00  MOV EAX,dword ptr [EAX]
00fee592  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00fee595  8990b4000000  MOV dword ptr [EAX + 0xb4],EDX
00fee59b  c780b000000028380001  MOV dword ptr [EAX + 0xb0],0x1003828
00fee5a5  ba40f1fe00  MOV EDX,0xfef140
00fee5aa  b101  MOV CL,0x1
00fee5ac  b86cf1fe00  MOV EAX,0xfef16c
00fee5b1  e8cea344ff  CALL 0x00438984
00fee5b6  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00fee5b9  8882e0060000  MOV byte ptr [EDX + 0x6e0],AL
00fee5bf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee5c2  80b8e006000000  CMP byte ptr [EAX + 0x6e0],0x0
00fee5c9  0f84d5000000  JZ 0x00fee6a4
00fee5cf  8d55e0  LEA EDX,[EBP + -0x20]
00fee5d2  b888f1fe00  MOV EAX,0xfef188
00fee5d7  e8d49c9cff  CALL 0x009b82b0
00fee5dc  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00fee5df  baa0f1fe00  MOV EDX,0xfef1a0
00fee5e4  e83bdd41ff  CALL 0x0040c324
00fee5e9  7473  JZ 0x00fee65e
00fee5eb  33c0  XOR EAX,EAX
00fee5ed  55  PUSH EBP
00fee5ee  680ee6fe00  PUSH 0xfee60e
00fee5f3  64ff30  PUSH dword ptr FS:[EAX]
00fee5f6  648920  MOV dword ptr FS:[EAX],ESP
00fee5f9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee5fc  e893110000  CALL 0x00fef794
00fee601  33c0  XOR EAX,EAX
00fee603  5a  POP EDX
00fee604  59  POP ECX
00fee605  59  POP ECX
00fee606  648910  MOV dword ptr FS:[EAX],EDX
00fee609  e917010000  JMP 0x00fee725
00fee65e  c605c596230100  MOV byte ptr [0x012396c5],0x0
00fee665  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee668  c680d206000000  MOV byte ptr [EAX + 0x6d2],0x0
00fee66f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee672  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
00fee678  33d2  XOR EDX,EDX
00fee67a  e8313f61ff  CALL 0x006025b0
00fee67f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee682  8b80bc050000  MOV EAX,dword ptr [EAX + 0x5bc]
00fee688  33d2  XOR EDX,EDX
00fee68a  e8b5ab71ff  CALL 0x00709244
00fee68f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee692  8b80c8050000  MOV EAX,dword ptr [EAX + 0x5c8]
00fee698  33d2  XOR EDX,EDX
00fee69a  e8a5ab71ff  CALL 0x00709244
00fee69f  e981000000  JMP 0x00fee725
00fee6a4  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00fee6a7  b201  MOV DL,0x1
00fee6a9  a1f8b9fe00  MOV EAX,[0x00feb9f8]
00fee6ae  e82d710100  CALL 0x010057e0
00fee6b3  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00fee6b6  8982dc060000  MOV dword ptr [EDX + 0x6dc],EAX
00fee6bc  8d55dc  LEA EDX,[EBP + -0x24]
00fee6bf  b888f1fe00  MOV EAX,0xfef188
00fee6c4  e8e79b9cff  CALL 0x009b82b0
00fee6c9  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00fee6cc  baa0f1fe00  MOV EDX,0xfef1a0
00fee6d1  e84edc41ff  CALL 0x0040c324
00fee6d6  7410  JZ 0x00fee6e8
00fee6d8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee6db  8b80dc060000  MOV EAX,dword ptr [EAX + 0x6dc]
00fee6e1  e8fa810100  CALL 0x010068e0
00fee6e6  eb3d  JMP 0x00fee725
00fee6e8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee6eb  8b80dc060000  MOV EAX,dword ptr [EAX + 0x6dc]
00fee6f1  c6400a01  MOV byte ptr [EAX + 0xa],0x1
00fee6f5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee6f8  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
00fee6fe  33d2  XOR EDX,EDX
00fee700  e8ab3e61ff  CALL 0x006025b0
00fee705  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee708  8b80bc050000  MOV EAX,dword ptr [EAX + 0x5bc]
00fee70e  33d2  XOR EDX,EDX
00fee710  e82fab71ff  CALL 0x00709244
00fee715  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee718  8b80c8050000  MOV EAX,dword ptr [EAX + 0x5c8]
00fee71e  33d2  XOR EDX,EDX
00fee720  e81fab71ff  CALL 0x00709244
00fee725  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee728  e863f9ffff  CALL 0x00fee090
00fee72d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee730  c6800807000000  MOV byte ptr [EAX + 0x708],0x0
00fee737  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee73a  c780e806000014000000  MOV dword ptr [EAX + 0x6e8],0x14
00fee744  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee747  50  PUSH EAX
00fee748  68c8befe00  PUSH 0xfebec8
00fee74d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee750  50  PUSH EAX
00fee751  68ecc0fe00  PUSH 0xfec0ec
00fee756  e8f5baafff  CALL 0x00aea250
00fee75b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee75e  c780e80600001e000000  MOV dword ptr [EAX + 0x6e8],0x1e
00fee768  e8ffe69bff  CALL 0x009ace6c
00fee76d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee770  80b8e006000000  CMP byte ptr [EAX + 0x6e0],0x0
00fee777  7462  JZ 0x00fee7db
00fee779  833dbca6250100  CMP dword ptr [0x0125a6bc],0x0
00fee780  7448  JZ 0x00fee7ca
00fee782  8d55d8  LEA EDX,[EBP + -0x28]
00fee785  b888f1fe00  MOV EAX,0xfef188
00fee78a  e8219b9cff  CALL 0x009b82b0
00fee78f  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
00fee792  babcf1fe00  MOV EDX,0xfef1bc
00fee797  e888db41ff  CALL 0x0040c324
00fee79c  7514  JNZ 0x00fee7b2
00fee79e  a140eb2401  MOV EAX,[0x0124eb40]
00fee7a3  8b00  MOV EAX,dword ptr [EAX]
00fee7a5  33d2  XOR EDX,EDX
00fee7a7  8990bc000000  MOV dword ptr [EAX + 0xbc],EDX
00fee7ad  e998000000  JMP 0x00fee84a
00fee7b2  a140eb2401  MOV EAX,[0x0124eb40]
00fee7b7  8b00  MOV EAX,dword ptr [EAX]
00fee7b9  8b15bca62501  MOV EDX,dword ptr [0x0125a6bc]
00fee7bf  8990bc000000  MOV dword ptr [EAX + 0xbc],EDX
00fee7c5  e980000000  JMP 0x00fee84a
00fee7ca  a140eb2401  MOV EAX,[0x0124eb40]
00fee7cf  8b00  MOV EAX,dword ptr [EAX]
00fee7d1  33d2  XOR EDX,EDX
00fee7d3  8990bc000000  MOV dword ptr [EAX + 0xbc],EDX
00fee7d9  eb6f  JMP 0x00fee84a
00fee7db  e820cce8ff  CALL 0x00e7b400
00fee7e0  80781400  CMP byte ptr [EAX + 0x14],0x0
00fee7e4  7455  JZ 0x00fee83b
00fee7e6  e815cce8ff  CALL 0x00e7b400
00fee7eb  e838d4e8ff  CALL 0x00e7bc28
00fee7f0  85c0  TEST EAX,EAX
00fee7f2  7447  JZ 0x00fee83b
00fee7f4  8d55d4  LEA EDX,[EBP + -0x2c]
00fee7f7  b888f1fe00  MOV EAX,0xfef188
00fee7fc  e8af9a9cff  CALL 0x009b82b0
00fee801  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
00fee804  babcf1fe00  MOV EDX,0xfef1bc
00fee809  e816db41ff  CALL 0x0040c324
00fee80e  7511  JNZ 0x00fee821
00fee810  a140eb2401  MOV EAX,[0x0124eb40]
00fee815  8b00  MOV EAX,dword ptr [EAX]
00fee817  33d2  XOR EDX,EDX
00fee819  8990bc000000  MOV dword ptr [EAX + 0xbc],EDX
00fee81f  eb29  JMP 0x00fee84a
00fee821  e8dacbe8ff  CALL 0x00e7b400
00fee826  e8fdd3e8ff  CALL 0x00e7bc28
00fee82b  8b1540eb2401  MOV EDX,dword ptr [0x0124eb40]
00fee831  8b12  MOV EDX,dword ptr [EDX]
00fee833  8982bc000000  MOV dword ptr [EDX + 0xbc],EAX
00fee839  eb0f  JMP 0x00fee84a
00fee83b  a140eb2401  MOV EAX,[0x0124eb40]
00fee840  8b00  MOV EAX,dword ptr [EAX]
00fee842  33d2  XOR EDX,EDX
00fee844  8990bc000000  MOV dword ptr [EAX + 0xbc],EDX
00fee84a  33c0  XOR EAX,EAX
00fee84c  55  PUSH EBP
00fee84d  6872e8fe00  PUSH 0xfee872
00fee852  64ff30  PUSH dword ptr FS:[EAX]
00fee855  648920  MOV dword ptr FS:[EAX],ESP
00fee858  b8e0f1fe00  MOV EAX,0xfef1e0
00fee85d  e8620a9cff  CALL 0x009af2c4
00fee862  8845f3  MOV byte ptr [EBP + -0xd],AL
00fee865  33c0  XOR EAX,EAX
00fee867  5a  POP EDX
00fee868  59  POP ECX
00fee869  59  POP ECX
00fee86a  648910  MOV dword ptr FS:[EAX],EDX
00fee86d  e9ad000000  JMP 0x00fee91f
00fee91f  807df300  CMP byte ptr [EBP + -0xd],0x0
00fee923  7512  JNZ 0x00fee937
00fee925  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee928  e8fb8773ff  CALL 0x00727128
00fee92d  e802be41ff  CALL 0x0040a734
00fee932  e9ba070000  JMP 0x00fef0f1
00fee937  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee93a  80b8e006000000  CMP byte ptr [EAX + 0x6e0],0x0
00fee941  7456  JZ 0x00fee999
00fee943  833dbca6250100  CMP dword ptr [0x0125a6bc],0x0
00fee94a  744d  JZ 0x00fee999
00fee94c  8d55d0  LEA EDX,[EBP + -0x30]
00fee94f  b888f1fe00  MOV EAX,0xfef188
00fee954  e857999cff  CALL 0x009b82b0
00fee959  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
00fee95c  babcf1fe00  MOV EDX,0xfef1bc
00fee961  e8bed941ff  CALL 0x0040c324
00fee966  7431  JZ 0x00fee999
00fee968  8d4dcc  LEA ECX,[EBP + -0x34]
00fee96b  ba0a000000  MOV EDX,0xa
00fee970  a1bca62501  MOV EAX,[0x0125a6bc]
00fee975  e80ed378ff  CALL 0x0077bc88
00fee97a  8d45cc  LEA EAX,[EBP + -0x34]
00fee97d  ba40f3fe00  MOV EDX,0xfef340
00fee982  e8c1d141ff  CALL 0x0040bb48
00fee987  8b4dcc  MOV ECX,dword ptr [EBP + -0x34]
00fee98a  ba0a000000  MOV EDX,0xa
00fee98f  a1bca62501  MOV EAX,[0x0125a6bc]
00fee994  e887e078ff  CALL 0x0077ca20
00fee999  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee99c  e8d31b0000  CALL 0x00ff0574
00fee9a1  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00fee9a4  888228070000  MOV byte ptr [EDX + 0x728],AL
00fee9aa  b201  MOV DL,0x1
00fee9ac  a19403c000  MOV EAX,[0x00c00394]
00fee9b1  e8b61cc1ff  CALL 0x00c0066c
00fee9b6  8b158cea2401  MOV EDX,dword ptr [0x0124ea8c]
00fee9bc  8902  MOV dword ptr [EDX],EAX
00fee9be  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee9c1  8a8028070000  MOV AL,byte ptr [EAX + 0x728]
00fee9c7  8b158cea2401  MOV EDX,dword ptr [0x0124ea8c]
00fee9cd  8b12  MOV EDX,dword ptr [EDX]
00fee9cf  88421c  MOV byte ptr [EDX + 0x1c],AL
00fee9d2  a140eb2401  MOV EAX,[0x0124eb40]
00fee9d7  8b00  MOV EAX,dword ptr [EAX]
00fee9d9  bae0f1fe00  MOV EDX,0xfef1e0
00fee9de  8b08  MOV ECX,dword ptr [EAX]
00fee9e0  ff5178  CALL dword ptr [ECX + 0x78]
00fee9e3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fee9e6  8b1560f42401  MOV EDX,dword ptr [0x0124f460]
00fee9ec  8b12  MOV EDX,dword ptr [EDX]
00fee9ee  8b8a58010000  MOV ECX,dword ptr [EDX + 0x158]
00fee9f4  898818070000  MOV dword ptr [EAX + 0x718],ECX
00fee9fa  8b8a5c010000  MOV ECX,dword ptr [EDX + 0x15c]
00feea00  89881c070000  MOV dword ptr [EAX + 0x71c],ECX
00feea06  a160f42401  MOV EAX,[0x0124f460]
00feea0b  8b00  MOV EAX,dword ptr [EAX]
00feea0d  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00feea10  89905c010000  MOV dword ptr [EAX + 0x15c],EDX
00feea16  c78058010000d0c7ff00  MOV dword ptr [EAX + 0x158],0xffc7d0
00feea20  a160f42401  MOV EAX,[0x0124f460]
00feea25  8b00  MOV EAX,dword ptr [EAX]
00feea27  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00feea2a  899054010000  MOV dword ptr [EAX + 0x154],EDX
00feea30  c7805001000050c8ff00  MOV dword ptr [EAX + 0x150],0xffc850
00feea3a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feea3d  c780e806000032000000  MOV dword ptr [EAX + 0x6e8],0x32
00feea47  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feea4a  c780e806000028000000  MOV dword ptr [EAX + 0x6e8],0x28
00feea54  33d2  XOR EDX,EDX
00feea56  b8e0f1fe00  MOV EAX,0xfef1e0
00feea5b  e8786cffff  CALL 0x00fe56d8
00feea60  84c0  TEST AL,AL
00feea62  7512  JNZ 0x00feea76
00feea64  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feea67  e8bc8673ff  CALL 0x00727128
00feea6c  e8c3bc41ff  CALL 0x0040a734
00feea71  e97b060000  JMP 0x00fef0f1
00feea76  b201  MOV DL,0x1
00feea78  a1acfd1c01  MOV EAX,[0x011cfdac]
00feea7d  e8ba561e00  CALL 0x011d413c
00feea82  8b15dcf92401  MOV EDX,dword ptr [0x0124f9dc]
00feea88  8902  MOV dword ptr [EDX],EAX
00feea8a  a1cc011d01  MOV EAX,[0x011d01cc]
00feea8f  50  PUSH EAX
00feea90  8b0ddcf92401  MOV ECX,dword ptr [0x0124f9dc]
00feea96  a16ce72401  MOV EAX,[0x0124e76c]
00feea9b  8b00  MOV EAX,dword ptr [EAX]
00feea9d  ba58f3fe00  MOV EDX,0xfef358
00feeaa2  e88161a7ff  CALL 0x00a64c28
00feeaa7  55  PUSH EBP
00feeaa8  e85ff6ffff  CALL 0x00fee10c
00feeaad  59  POP ECX
00feeaae  e8dd8c1e00  CALL 0x011d7790
00feeab3  b101  MOV CL,0x1
00feeab5  ba70f3fe00  MOV EDX,0xfef370
00feeaba  e8ed42a1ff  CALL 0x00a02dac
00feeabf  8b1584eb2401  MOV EDX,dword ptr [0x0124eb84]
00feeac5  8802  MOV byte ptr [EDX],AL
00feeac7  e8c48c1e00  CALL 0x011d7790
00feeacc  b9f4010000  MOV ECX,0x1f4
00feead1  ba98f3fe00  MOV EDX,0xfef398
00feead6  e8d9870100  CALL 0x010072b4
00feeadb  e8cc0b9cff  CALL 0x009af6ac
00feeae0  8d45f8  LEA EAX,[EBP + -0x8]
00feeae3  50  PUSH EAX
00feeae4  6a00  PUSH 0x0
00feeae6  6a00  PUSH 0x0
00feeae8  8d55cc  LEA EDX,[EBP + -0x34]
00feeaeb  83c9ff  OR ECX,0xffffffff
00feeaee  b8c4f3fe00  MOV EAX,0xfef3c4
00feeaf3  e82cee9bff  CALL 0x009ad924
00feeaf8  837df800  CMP dword ptr [EBP + -0x8],0x0
00feeafc  7512  JNZ 0x00feeb10
00feeafe  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeb01  8b805c060000  MOV EAX,dword ptr [EAX + 0x65c]
00feeb07  b201  MOV DL,0x1
00feeb09  e836a771ff  CALL 0x00709244
00feeb0e  eb10  JMP 0x00feeb20
00feeb10  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeb13  8b805c060000  MOV EAX,dword ptr [EAX + 0x65c]
00feeb19  33d2  XOR EDX,EDX
00feeb1b  e824a771ff  CALL 0x00709244
00feeb20  a1dcf92401  MOV EAX,[0x0124f9dc]
00feeb25  8b00  MOV EAX,dword ptr [EAX]
00feeb27  80785400  CMP byte ptr [EAX + 0x54],0x0
00feeb2b  7530  JNZ 0x00feeb5d
00feeb2d  a1dcf92401  MOV EAX,[0x0124f9dc]
00feeb32  8b00  MOV EAX,dword ptr [EAX]
00feeb34  80785500  CMP byte ptr [EAX + 0x55],0x0
00feeb38  7523  JNZ 0x00feeb5d
00feeb3a  33c9  XOR ECX,ECX
00feeb3c  baf0f3fe00  MOV EDX,0xfef3f0
00feeb41  b824f4fe00  MOV EAX,0xfef424
00feeb46  e85d599cff  CALL 0x009b44a8
00feeb4b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeb4e  e8d58573ff  CALL 0x00727128
00feeb53  e8dcbb41ff  CALL 0x0040a734
00feeb58  e994050000  JMP 0x00fef0f1
00feeb5d  e82e8c1e00  CALL 0x011d7790
00feeb62  ba60f4fe00  MOV EDX,0xfef460
00feeb67  e8b841a1ff  CALL 0x00a02d24
00feeb6c  84c0  TEST AL,AL
00feeb6e  7528  JNZ 0x00feeb98
00feeb70  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeb73  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feeb79  33d2  XOR EDX,EDX
00feeb7b  8b08  MOV ECX,dword ptr [EAX]
00feeb7d  ff919c000000  CALL dword ptr [ECX + 0x9c]
00feeb83  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeb86  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feeb8c  33d2  XOR EDX,EDX
00feeb8e  e81d3a61ff  CALL 0x006025b0
00feeb93  e9d7000000  JMP 0x00feec6f
00feeb98  e8f38b1e00  CALL 0x011d7790
00feeb9d  baacf4fe00  MOV EDX,0xfef4ac
00feeba2  e87d41a1ff  CALL 0x00a02d24
00feeba7  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00feebaa  888248070000  MOV byte ptr [EDX + 0x748],AL
00feebb0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feebb3  80b84807000000  CMP byte ptr [EAX + 0x748],0x0
00feebba  7425  JZ 0x00feebe1
00feebbc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feebbf  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feebc5  33d2  XOR EDX,EDX
00feebc7  8b08  MOV ECX,dword ptr [EAX]
00feebc9  ff914c010000  CALL dword ptr [ECX + 0x14c]
00feebcf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feebd2  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feebd8  33d2  XOR EDX,EDX
00feebda  e8fd3c61ff  CALL 0x006028dc
00feebdf  eb61  JMP 0x00feec42
00feebe1  b8ffff0000  MOV EAX,0xffff
00feebe6  e8517e9cff  CALL 0x009b6a3c
00feebeb  8bd0  MOV EDX,EAX
00feebed  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feebf0  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feebf6  e88d3c61ff  CALL 0x00602888
00feebfb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feebfe  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feec04  b201  MOV DL,0x1
00feec06  8b08  MOV ECX,dword ptr [EAX]
00feec08  ff914c010000  CALL dword ptr [ECX + 0x14c]
00feec0e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feec11  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feec17  b201  MOV DL,0x1
00feec19  e8be3c61ff  CALL 0x006028dc
00feec1e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feec21  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feec27  ba0f0000ff  MOV EDX,0xff00000f
00feec2c  e8573c61ff  CALL 0x00602888
00feec31  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feec34  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feec3a  8b10  MOV EDX,dword ptr [EAX]
00feec3c  ff92dc000000  CALL dword ptr [EDX + 0xdc]
00feec42  e8498b1e00  CALL 0x011d7790
00feec47  baf8f4fe00  MOV EDX,0xfef4f8
00feec4c  e8d340a1ff  CALL 0x00a02d24
00feec51  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00feec54  888250070000  MOV byte ptr [EDX + 0x750],AL
00feec5a  e83d759eff  CALL 0x009d619c
00feec5f  8bd0  MOV EDX,EAX
00feec61  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feec64  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00feec6a  e87de161ff  CALL 0x0060cdec
00feec6f  b848f5fe00  MOV EAX,0xfef548
00feec74  e843f91900  CALL 0x0118e5bc
00feec79  8b15f4f02401  MOV EDX,dword ptr [0x0124f0f4]
00feec7f  8802  MOV byte ptr [EDX],AL
00feec81  e8e6f91900  CALL 0x0118e66c
00feec86  8b1590f72401  MOV EDX,dword ptr [0x0124f790]
00feec8c  8802  MOV byte ptr [EDX],AL
00feec8e  b201  MOV DL,0x1
00feec90  a1e8061d01  MOV EAX,[0x011d06e8]
00feec95  e8a2561e00  CALL 0x011d433c
00feec9a  8b15e0f22401  MOV EDX,dword ptr [0x0124f2e0]
00feeca0  8902  MOV dword ptr [EDX],EAX
00feeca2  a1d00b1d01  MOV EAX,[0x011d0bd0]
00feeca7  50  PUSH EAX
00feeca8  8b0de0f22401  MOV ECX,dword ptr [0x0124f2e0]
00feecae  a16ce72401  MOV EAX,[0x0124e76c]
00feecb3  8b00  MOV EAX,dword ptr [EAX]
00feecb5  ba6cf5fe00  MOV EDX,0xfef56c
00feecba  e8695fa7ff  CALL 0x00a64c28
00feecbf  b201  MOV DL,0x1
00feecc1  a1d0101d01  MOV EAX,[0x011d10d0]
00feecc6  e8c15e1e00  CALL 0x011d4b8c
00feeccb  8b15a0e22401  MOV EDX,dword ptr [0x0124e2a0]
00feecd1  8902  MOV dword ptr [EDX],EAX
00feecd3  a184141d01  MOV EAX,[0x011d1484]
00feecd8  50  PUSH EAX
00feecd9  8b0da0e22401  MOV ECX,dword ptr [0x0124e2a0]
00feecdf  a16ce72401  MOV EAX,[0x0124e76c]
00feece4  8b00  MOV EAX,dword ptr [EAX]
00feece6  ba88f5fe00  MOV EDX,0xfef588
00feeceb  e8385fa7ff  CALL 0x00a64c28
00feecf0  b201  MOV DL,0x1
00feecf2  a1f01a1d01  MOV EAX,[0x011d1af0]
00feecf7  e8a4691e00  CALL 0x011d56a0
00feecfc  8b15dcf82401  MOV EDX,dword ptr [0x0124f8dc]
00feed02  8902  MOV dword ptr [EDX],EAX
00feed04  b201  MOV DL,0x1
00feed06  a120241d01  MOV EAX,[0x011d2420]
00feed0b  e81c7b1e00  CALL 0x011d682c
00feed10  8b1590f42401  MOV EDX,dword ptr [0x0124f490]
00feed16  8902  MOV dword ptr [EDX],EAX
00feed18  b201  MOV DL,0x1
00feed1a  a1dc2d1d01  MOV EAX,[0x011d2ddc]
00feed1f  e890851e00  CALL 0x011d72b4
00feed24  8b1594f22401  MOV EDX,dword ptr [0x0124f294]
00feed2a  8902  MOV dword ptr [EDX],EAX
00feed2c  b201  MOV DL,0x1
00feed2e  a148321d01  MOV EAX,[0x011d3248]
00feed33  e8ec831e00  CALL 0x011d7124
00feed38  8b1584fc2401  MOV EDX,dword ptr [0x0124fc84]
00feed3e  8902  MOV dword ptr [EDX],EAX
00feed40  b201  MOV DL,0x1
00feed42  a100734a00  MOV EAX,[0x004a7300]
00feed47  e8a8944eff  CALL 0x004d81f4
00feed4c  a3a4a62501  MOV [0x0125a6a4],EAX
00feed51  b201  MOV DL,0x1
00feed53  a100734a00  MOV EAX,[0x004a7300]
00feed58  e897944eff  CALL 0x004d81f4
00feed5d  a3b8a62501  MOV [0x0125a6b8],EAX
00feed62  a1c8f92401  MOV EAX,[0x0124f9c8]
00feed67  c60000  MOV byte ptr [EAX],0x0
00feed6a  b201  MOV DL,0x1
00feed6c  a100734a00  MOV EAX,[0x004a7300]
00feed71  e87e944eff  CALL 0x004d81f4
00feed76  8b1554f92401  MOV EDX,dword ptr [0x0124f954]
00feed7c  8902  MOV dword ptr [EDX],EAX
00feed7e  b201  MOV DL,0x1
00feed80  a100734a00  MOV EAX,[0x004a7300]
00feed85  e86a944eff  CALL 0x004d81f4
00feed8a  a3e8a62501  MOV [0x0125a6e8],EAX
00feed8f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feed92  e8915b0100  CALL 0x01004928
00feed97  e850d40e00  CALL 0x010dc1ec
00feed9c  68a8f5fe00  PUSH 0xfef5a8
00feeda1  8d4dc4  LEA ECX,[EBP + -0x3c]
00feeda4  a1dcf92401  MOV EAX,[0x0124f9dc]
00feeda9  8b00  MOV EAX,dword ptr [EAX]
00feedab  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00feedae  33d2  XOR EDX,EDX
00feedb0  e8b33c9cff  CALL 0x009b2a68
00feedb5  ff75c4  PUSH dword ptr [EBP + -0x3c]
00feedb8  68e4f5fe00  PUSH 0xfef5e4
00feedbd  a140eb2401  MOV EAX,[0x0124eb40]
00feedc2  8b00  MOV EAX,dword ptr [EAX]
00feedc4  ff7070  PUSH dword ptr [EAX + 0x70]
00feedc7  68f8f5fe00  PUSH 0xfef5f8
00feedcc  8d45c8  LEA EAX,[EBP + -0x38]
00feedcf  ba05000000  MOV EDX,0x5
00feedd4  e83bd441ff  CALL 0x0040c214
00feedd9  8b55c8  MOV EDX,dword ptr [EBP + -0x38]
00feeddc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeddf  e8183961ff  CALL 0x006026fc
00feede4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feede7  e8e81b0000  CALL 0x00ff09d4
00feedec  e85f1fddff  CALL 0x00dc0d50
00feedf1  84c0  TEST AL,AL
00feedf3  740e  JZ 0x00feee03
00feedf5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feedf8  50  PUSH EAX
00feedf9  68c89cff00  PUSH 0xff9cc8
00feedfe  e865d4dcff  CALL 0x00dbc268
00feee03  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee06  c780e80600003c000000  MOV dword ptr [EAX + 0x6e8],0x3c
00feee10  b908f6fe00  MOV ECX,0xfef608
00feee15  ba02000000  MOV EDX,0x2
00feee1a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee1d  e8b6ea0000  CALL 0x00ffd8d8
00feee22  b928f6fe00  MOV ECX,0xfef628
00feee27  ba03000000  MOV EDX,0x3
00feee2c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee2f  e8a4ea0000  CALL 0x00ffd8d8
00feee34  b940f6fe00  MOV ECX,0xfef640
00feee39  ba04000000  MOV EDX,0x4
00feee3e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee41  e892ea0000  CALL 0x00ffd8d8
00feee46  b95cf6fe00  MOV ECX,0xfef65c
00feee4b  ba06000000  MOV EDX,0x6
00feee50  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee53  e880ea0000  CALL 0x00ffd8d8
00feee58  b974f6fe00  MOV ECX,0xfef674
00feee5d  ba07000000  MOV EDX,0x7
00feee62  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee65  e86eea0000  CALL 0x00ffd8d8
00feee6a  e8d543d0ff  CALL 0x00cf3244
00feee6f  84c0  TEST AL,AL
00feee71  7412  JZ 0x00feee85
00feee73  b994f6fe00  MOV ECX,0xfef694
00feee78  ba0b000000  MOV EDX,0xb
00feee7d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee80  e853ea0000  CALL 0x00ffd8d8
00feee85  b9b0f6fe00  MOV ECX,0xfef6b0
00feee8a  ba08000000  MOV EDX,0x8
00feee8f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feee92  e841ea0000  CALL 0x00ffd8d8
00feee97  b9d0f6fe00  MOV ECX,0xfef6d0
00feee9c  ba09000000  MOV EDX,0x9
00feeea1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeea4  e82fea0000  CALL 0x00ffd8d8
00feeea9  b9e8f6fe00  MOV ECX,0xfef6e8
00feeeae  ba0a000000  MOV EDX,0xa
00feeeb3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeeb6  e81dea0000  CALL 0x00ffd8d8
00feeebb  b904f7fe00  MOV ECX,0xfef704
00feeec0  ba01000000  MOV EDX,0x1
00feeec5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeec8  e80bea0000  CALL 0x00ffd8d8
00feeecd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeed0  8b9020050000  MOV EDX,dword ptr [EAX + 0x520]
00feeed6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeed9  e8faed0000  CALL 0x00ffdcd8
00feeede  b201  MOV DL,0x1
00feeee0  a1f8985c00  MOV EAX,[0x005c98f8]
00feeee5  e8866b5eff  CALL 0x005d5a70
00feeeea  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00feeeed  898200070000  MOV dword ptr [EDX + 0x700],EAX
00feeef3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feeef6  8b8000070000  MOV EAX,dword ptr [EAX + 0x700]
00feeefc  b928f7fe00  MOV ECX,0xfef728
00feef01  8b153c362501  MOV EDX,dword ptr [0x0125363c]
00feef07  e8207d5eff  CALL 0x005d6c2c
00feef0c  a1dcf92401  MOV EAX,[0x0124f9dc]
00feef11  8b00  MOV EAX,dword ptr [EAX]
00feef13  694024e8030000  IMUL EAX,dword ptr [EAX + 0x24],0x3e8
00feef1a  e8d9b3afff  CALL 0x00aea2f8
00feef1f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef22  e87dda61ff  CALL 0x0060c9a4
00feef27  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef2a  c780e806000046000000  MOV dword ptr [EAX + 0x6e8],0x46
00feef34  33d2  XOR EDX,EDX
00feef36  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef39  8b08  MOV ECX,dword ptr [EAX]
00feef3b  ff919c000000  CALL dword ptr [ECX + 0x9c]
00feef41  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef44  c6803107000001  MOV byte ptr [EAX + 0x731],0x1
00feef4b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef4e  c780e806000063000000  MOV dword ptr [EAX + 0x6e8],0x63
00feef58  e8f31dddff  CALL 0x00dc0d50
00feef5d  8bd0  MOV EDX,EAX
00feef5f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef62  8b807c050000  MOV EAX,dword ptr [EAX + 0x57c]
00feef68  e8433661ff  CALL 0x006025b0
00feef6d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef70  c6803807000000  MOV byte ptr [EAX + 0x738],0x0
00feef77  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feef7a  053c070000  ADD EAX,0x73c
00feef7f  e850c041ff  CALL 0x0040afd4
00feef84  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00feef87  b201  MOV DL,0x1
00feef89  a1d4d3c700  MOV EAX,[0x00c7d3d4]
00feef8e  e805701d00  CALL 0x011c5f98
00feef93  8b1578f22401  MOV EDX,dword ptr [0x0124f278]
00feef99  8902  MOV dword ptr [EDX],EAX
00feef9b  e8fceec8ff  CALL 0x00c7de9c
00feefa0  b8aca62501  MOV EAX,0x125a6ac
00feefa5  e82ac041ff  CALL 0x0040afd4
00feefaa  b8a8a62501  MOV EAX,0x125a6a8
00feefaf  e820c041ff  CALL 0x0040afd4
00feefb4  b8b0a62501  MOV EAX,0x125a6b0
00feefb9  e816c041ff  CALL 0x0040afd4
00feefbe  b8b4a62501  MOV EAX,0x125a6b4
00feefc3  e80cc041ff  CALL 0x0040afd4
00feefc8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feefcb  0534070000  ADD EAX,0x734
00feefd0  e8ffbf41ff  CALL 0x0040afd4
00feefd5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feefd8  e80f0f0000  CALL 0x00fefeec
00feefdd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feefe0  33d2  XOR EDX,EDX
00feefe2  899064070000  MOV dword ptr [EAX + 0x764],EDX
00feefe8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00feefeb  0570070000  ADD EAX,0x770
00feeff0  e8dfbf41ff  CALL 0x0040afd4
00feeff5  a1dcf92401  MOV EAX,[0x0124f9dc]
00feeffa  8b00  MOV EAX,dword ptr [EAX]
00feeffc  80785600  CMP byte ptr [EAX + 0x56],0x0
00fef000  7408  JZ 0x00fef00a
00fef002  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef005  e88aed0000  CALL 0x00ffdd94
00fef00a  e84dc1adff  CALL 0x00acb15c
00fef00f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef012  83b89c06000000  CMP dword ptr [EAX + 0x69c],0x0
00fef019  742c  JZ 0x00fef047
00fef01b  8b1550e22401  MOV EDX,dword ptr [0x0124e250]
00fef021  8a12  MOV DL,byte ptr [EDX]
00fef023  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef026  8b809c060000  MOV EAX,dword ptr [EAX + 0x69c]
00fef02c  e813a271ff  CALL 0x00709244
00fef031  8b1550e22401  MOV EDX,dword ptr [0x0124e250]
00fef037  8a12  MOV DL,byte ptr [EDX]
00fef039  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef03c  8b8080060000  MOV EAX,dword ptr [EAX + 0x680]
00fef042  e8fda171ff  CALL 0x00709244
00fef047  6a00  PUSH 0x0
00fef049  6a00  PUSH 0x0
00fef04b  681e280000  PUSH 0x281e
00fef050  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef053  e800da61ff  CALL 0x0060ca58
00fef058  50  PUSH EAX
00fef059  e822cf42ff  CALL 0x0041bf80
00fef05e  b001  MOV AL,0x1
00fef060  e84f4fcaff  CALL 0x00c93fb4
00fef065  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef068  8b806c060000  MOV EAX,dword ptr [EAX + 0x66c]
00fef06e  e84189adff  CALL 0x00ac79b4
00fef073  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00fef076  8b806c060000  MOV EAX,dword ptr [EAX + 0x66c]
00fef07c  e8ef79adff  CALL 0x00ac6a70
00fef081  8d55bc  LEA EDX,[EBP + -0x44]
00fef084  b850f7fe00  MOV EAX,0xfef750
00fef089  e82ec21d00  CALL 0x011cb2bc
00fef08e  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
00fef091  8d55c0  LEA EDX,[EBP + -0x40]
00fef094  e80fd143ff  CALL 0x0042c1a8
00fef099  8b45c0  MOV EAX,dword ptr [EBP + -0x40]
00fef09c  ba90f7fe00  MOV EDX,0xfef790
00fef0a1  e87ed241ff  CALL 0x0040c324
00fef0a6  0f94c0  SETZ AL
00fef0a9  8b15a0f72401  MOV EDX,dword ptr [0x0124f7a0]
00fef0af  8802  MOV byte ptr [EDX],AL
00fef0b1  8d45f4  LEA EAX,[EBP + -0xc]
00fef0b4  e81bbf41ff  CALL 0x0040afd4
00fef0b9  e822f2b1ff  CALL 0x00b0e2e0
00fef0be  837df400  CMP dword ptr [EBP + -0xc],0x0
00fef0c2  740f  JZ 0x00fef0d3
00fef0c4  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00fef0c7  e824c07aff  CALL 0x0079b0f0
00fef0cc  e863b641ff  CALL 0x0040a734
00fef0d1  eb1e  JMP 0x00fef0f1
00fef0d3  33c0  XOR EAX,EAX
00fef0d5  5a  POP EDX
00fef0d6  59  POP ECX
00fef0d7  59  POP ECX
00fef0d8  648910  MOV dword ptr FS:[EAX],EDX
00fef0db  68f1f0fe00  PUSH 0xfef0f1
00fef0e0  c605eca6250100  MOV byte ptr [0x0125a6ec],0x0
00fef0e7  58  POP EAX
00fef0e8  ffe0  JMP EAX
00fef0f1  33c0  XOR EAX,EAX
00fef0f3  5a  POP EDX
00fef0f4  59  POP ECX
00fef0f5  59  POP ECX
00fef0f6  648910  MOV dword ptr FS:[EAX],EDX
00fef0f9  6837f1fe00  PUSH 0xfef137
00fef0fe  8d45bc  LEA EAX,[EBP + -0x44]
00fef101  ba04000000  MOV EDX,0x4
00fef106  e829bf41ff  CALL 0x0040b034
00fef10b  8d45cc  LEA EAX,[EBP + -0x34]
00fef10e  e809bf41ff  CALL 0x0040b01c
00fef113  8d45d0  LEA EAX,[EBP + -0x30]
00fef116  ba05000000  MOV EDX,0x5
00fef11b  e814bf41ff  CALL 0x0040b034
00fef120  8d45f4  LEA EAX,[EBP + -0xc]
00fef123  ba02000000  MOV EDX,0x2
00fef128  e807bf41ff  CALL 0x0040b034
00fef12d  58  POP EAX
00fef12e  ffe0  JMP EAX
