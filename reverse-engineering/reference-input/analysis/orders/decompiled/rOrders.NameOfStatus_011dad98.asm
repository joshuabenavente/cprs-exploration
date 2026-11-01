; Static instruction listing. Function bodies and indirect exception flow require review.
011dad98  55  PUSH EBP
011dad99  8bec  MOV EBP,ESP
011dad9b  83c4f8  ADD ESP,-0x8
011dad9e  8955f8  MOV dword ptr [EBP + -0x8],EDX
011dada1  8945fc  MOV dword ptr [EBP + -0x4],EAX
011dada4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011dada7  83f809  CMP EAX,0x9
011dadaa  7f3a  JG 0x011dade6
011dadac  0f8429010000  JZ 0x011daedb
011dadb2  83f808  CMP EAX,0x8
011dadb5  0f87b2010000  JA 0x011daf6d
011dadbb  ff2485c2ad1d01  JMP dword ptr [EAX*0x4 + 0x11dadc2]
011dade6  83f80e  CMP EAX,0xe
011dade9  7f29  JG 0x011dae14
011dadeb  0f8438010000  JZ 0x011daf29
011dadf1  83e80a  SUB EAX,0xa
011dadf4  0f84f3000000  JZ 0x011daeed
011dadfa  48  DEC EAX
011dadfb  0f84fb000000  JZ 0x011daefc
011dae01  48  DEC EAX
011dae02  0f8403010000  JZ 0x011daf0b
011dae08  48  DEC EAX
011dae09  0f840b010000  JZ 0x011daf1a
011dae0f  e959010000  JMP 0x011daf6d
011dae14  83e80f  SUB EAX,0xf
011dae17  0f841b010000  JZ 0x011daf38
011dae1d  83e852  SUB EAX,0x52
011dae20  0f8421010000  JZ 0x011daf47
011dae26  48  DEC EAX
011dae27  0f8424010000  JZ 0x011daf51
011dae2d  48  DEC EAX
011dae2e  0f842c010000  JZ 0x011daf60
011dae34  e934010000  JMP 0x011daf6d
011daedb  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daede  ba88b01d01  MOV EDX,0x11db088
011daee3  e8dc0423ff  CALL 0x0040b3c4
011daee8  e980000000  JMP 0x011daf6d
011daeed  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daef0  bab4b01d01  MOV EDX,0x11db0b4
011daef5  e8ca0423ff  CALL 0x0040b3c4
011daefa  eb71  JMP 0x011daf6d
011daefc  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daeff  bad0b01d01  MOV EDX,0x11db0d0
011daf04  e8bb0423ff  CALL 0x0040b3c4
011daf09  eb62  JMP 0x011daf6d
011daf0b  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf0e  baf4b01d01  MOV EDX,0x11db0f4
011daf13  e8ac0423ff  CALL 0x0040b3c4
011daf18  eb53  JMP 0x011daf6d
011daf1a  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf1d  ba10b11d01  MOV EDX,0x11db110
011daf22  e89d0423ff  CALL 0x0040b3c4
011daf27  eb44  JMP 0x011daf6d
011daf29  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf2c  ba30b11d01  MOV EDX,0x11db130
011daf31  e88e0423ff  CALL 0x0040b3c4
011daf36  eb35  JMP 0x011daf6d
011daf38  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf3b  ba4cb11d01  MOV EDX,0x11db14c
011daf40  e87f0423ff  CALL 0x0040b3c4
011daf45  eb26  JMP 0x011daf6d
011daf47  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf4a  e8850023ff  CALL 0x0040afd4
011daf4f  eb1c  JMP 0x011daf6d
011daf51  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf54  ba68b11d01  MOV EDX,0x11db168
011daf59  e8660423ff  CALL 0x0040b3c4
011daf5e  eb0d  JMP 0x011daf6d
011daf60  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011daf63  ba7cb11d01  MOV EDX,0x11db17c
011daf68  e8570423ff  CALL 0x0040b3c4
011daf6d  59  POP ECX
011daf6e  59  POP ECX
011daf6f  5d  POP EBP
011daf70  c3  RET
