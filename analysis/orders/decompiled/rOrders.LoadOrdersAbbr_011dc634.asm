; Static instruction listing. Function bodies and indirect exception flow require review.
011dc634  55  PUSH EBP
011dc635  8bec  MOV EBP,ESP
011dc637  81c438ffffff  ADD ESP,0xffffff38
011dc63d  53  PUSH EBX
011dc63e  33db  XOR EBX,EBX
011dc640  899d38ffffff  MOV dword ptr [EBP + 0xffffff38],EBX
011dc646  899d70ffffff  MOV dword ptr [EBP + 0xffffff70],EBX
011dc64c  899d6cffffff  MOV dword ptr [EBP + 0xffffff6c],EBX
011dc652  899d78ffffff  MOV dword ptr [EBP + 0xffffff78],EBX
011dc658  899d74ffffff  MOV dword ptr [EBP + 0xffffff74],EBX
011dc65e  895dd0  MOV dword ptr [EBP + -0x30],EBX
011dc661  895dcc  MOV dword ptr [EBP + -0x34],EBX
011dc664  895de0  MOV dword ptr [EBP + -0x20],EBX
011dc667  894df4  MOV dword ptr [EBP + -0xc],ECX
011dc66a  8955f8  MOV dword ptr [EBP + -0x8],EDX
011dc66d  8945fc  MOV dword ptr [EBP + -0x4],EAX
011dc670  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dc673  e850ea22ff  CALL 0x0040b0c8
011dc678  33c0  XOR EAX,EAX
011dc67a  55  PUSH EBP
011dc67b  68f1c91d01  PUSH 0x11dc9f1
011dc680  64ff30  PUSH dword ptr FS:[EAX]
011dc683  648920  MOV dword ptr FS:[EAX],ESP
011dc686  833dccaa250100  CMP dword ptr [0x0125aacc],0x0
011dc68d  7505  JNZ 0x011dc694
011dc68f  e894e6ffff  CALL 0x011dad28
011dc694  8d55d0  LEA EDX,[EBP + -0x30]
011dc697  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc69a  8b400c  MOV EAX,dword ptr [EAX + 0xc]
011dc69d  e83a0925ff  CALL 0x0042cfdc
011dc6a2  ff75d0  PUSH dword ptr [EBP + -0x30]
011dc6a5  680cca1d01  PUSH 0x11dca0c
011dc6aa  8d55cc  LEA EDX,[EBP + -0x34]
011dc6ad  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc6b0  8b4058  MOV EAX,dword ptr [EAX + 0x58]
011dc6b3  e8240925ff  CALL 0x0042cfdc
011dc6b8  ff75cc  PUSH dword ptr [EBP + -0x34]
011dc6bb  8d45e0  LEA EAX,[EBP + -0x20]
011dc6be  ba03000000  MOV EDX,0x3
011dc6c3  e84cfb22ff  CALL 0x0040c214
011dc6c8  a190f42401  MOV EAX,[0x0124f490]
011dc6cd  8b00  MOV EAX,dword ptr [EAX]
011dc6cf  80780400  CMP byte ptr [EAX + 0x4],0x0
011dc6d3  7409  JZ 0x011dc6de
011dc6d5  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc6d8  83780c0c  CMP dword ptr [EAX + 0xc],0xc
011dc6dc  7404  JZ 0x011dc6e2
011dc6de  33c0  XOR EAX,EAX
011dc6e0  eb02  JMP 0x011dc6e4
011dc6e2  b001  MOV AL,0x1
011dc6e4  8845df  MOV byte ptr [EBP + -0x21],AL
011dc6e7  b201  MOV DL,0x1
011dc6e9  a100734a00  MOV EAX,[0x004a7300]
011dc6ee  e801bb2fff  CALL 0x004d81f4
011dc6f3  8945e4  MOV dword ptr [EBP + -0x1c],EAX
011dc6f6  33c0  XOR EAX,EAX
011dc6f8  55  PUSH EBP
011dc6f9  68a2c91d01  PUSH 0x11dc9a2
011dc6fe  64ff30  PUSH dword ptr FS:[EAX]
011dc701  648920  MOV dword ptr FS:[EAX],ESP
011dc704  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc707  50  PUSH EAX
011dc708  6a00  PUSH 0x0
011dc70a  a1e0f22401  MOV EAX,[0x0124f2e0]
011dc70f  8b00  MOV EAX,dword ptr [EAX]
011dc711  8b4004  MOV EAX,dword ptr [EAX + 0x4]
011dc714  894594  MOV dword ptr [EBP + -0x6c],EAX
011dc717  c6459811  MOV byte ptr [EBP + -0x68],0x11
011dc71b  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dc71e  89459c  MOV dword ptr [EBP + -0x64],EAX
011dc721  c645a011  MOV byte ptr [EBP + -0x60],0x11
011dc725  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc728  8b4008  MOV EAX,dword ptr [EAX + 0x8]
011dc72b  8945a4  MOV dword ptr [EBP + -0x5c],EAX
011dc72e  c645a800  MOV byte ptr [EBP + -0x58],0x0
011dc732  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc735  dd4018  FLD double ptr [EAX + 0x18]
011dc738  db7d88  FSTP extended double ptr [EBP + -0x78]
011dc73b  9b  WAIT
011dc73c  8d4588  LEA EAX,[EBP + -0x78]
011dc73f  8945ac  MOV dword ptr [EBP + -0x54],EAX
011dc742  c645b003  MOV byte ptr [EBP + -0x50],0x3
011dc746  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc749  dd4020  FLD double ptr [EAX + 0x20]
011dc74c  dbbd7cffffff  FSTP extended double ptr [EBP + 0xffffff7c]
011dc752  9b  WAIT
011dc753  8d857cffffff  LEA EAX,[EBP + 0xffffff7c]
011dc759  8945b4  MOV dword ptr [EBP + -0x4c],EAX
011dc75c  c645b803  MOV byte ptr [EBP + -0x48],0x3
011dc760  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dc763  8945bc  MOV dword ptr [EBP + -0x44],EAX
011dc766  c645c011  MOV byte ptr [EBP + -0x40],0x11
011dc76a  8a45df  MOV AL,byte ptr [EBP + -0x21]
011dc76d  8845c4  MOV byte ptr [EBP + -0x3c],AL
011dc770  c645c801  MOV byte ptr [EBP + -0x38],0x1
011dc774  8d5594  LEA EDX,[EBP + -0x6c]
011dc777  b906000000  MOV ECX,0x6
011dc77c  b81cca1d01  MOV EAX,0x11dca1c
011dc781  e8fa127dff  CALL 0x009ada80
011dc786  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc789  8b10  MOV EDX,dword ptr [EAX]
011dc78b  ff5214  CALL dword ptr [EDX + 0x14]
011dc78e  85c0  TEST EAX,EAX
011dc790  7f0d  JG 0x011dc79f
011dc792  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011dc795  e826f0ffff  CALL 0x011db7c0
011dc79a  e9eb010000  JMP 0x011dc98a
011dc79f  8d8578ffffff  LEA EAX,[EBP + 0xffffff78]
011dc7a5  50  PUSH EAX
011dc7a6  8d8d74ffffff  LEA ECX,[EBP + 0xffffff74]
011dc7ac  33d2  XOR EDX,EDX
011dc7ae  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc7b1  8b18  MOV EBX,dword ptr [EAX]
011dc7b3  ff530c  CALL dword ptr [EBX + 0xc]
011dc7b6  8b8574ffffff  MOV EAX,dword ptr [EBP + 0xffffff74]
011dc7bc  b901000000  MOV ECX,0x1
011dc7c1  66ba5e00  MOV DX,0x5e
011dc7c5  e822e55bff  CALL 0x0079acec
011dc7ca  8b8578ffffff  MOV EAX,dword ptr [EBP + 0xffffff78]
011dc7d0  ba40ca1d01  MOV EDX,0x11dca40
011dc7d5  e84afb22ff  CALL 0x0040c324
011dc7da  7438  JZ 0x011dc814
011dc7dc  8d8570ffffff  LEA EAX,[EBP + 0xffffff70]
011dc7e2  50  PUSH EAX
011dc7e3  8d8d6cffffff  LEA ECX,[EBP + 0xffffff6c]
011dc7e9  33d2  XOR EDX,EDX
011dc7eb  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc7ee  8b18  MOV EBX,dword ptr [EAX]
011dc7f0  ff530c  CALL dword ptr [EBX + 0xc]
011dc7f3  8b856cffffff  MOV EAX,dword ptr [EBP + 0xffffff6c]
011dc7f9  b901000000  MOV ECX,0x1
011dc7fe  66ba5e00  MOV DX,0x5e
011dc802  e8e5e45bff  CALL 0x0079acec
011dc807  83bd70ffffff00  CMP dword ptr [EBP + 0xffffff70],0x0
011dc80e  0f8516010000  JNZ 0x011dc92a
011dc814  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc817  83780c05  CMP dword ptr [EAX + 0xc],0x5
011dc81b  0f8509010000  JNZ 0x011dc92a
011dc821  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc824  8b10  MOV EDX,dword ptr [EAX]
011dc826  ff5248  CALL dword ptr [EDX + 0x48]
011dc829  e8fee9ffff  CALL 0x011db22c
011dc82e  dd5de8  FSTP double ptr [EBP + -0x18]
011dc831  9b  WAIT
011dc832  d9ee  FLDZ
011dc834  dd45e8  FLD double ptr [EBP + -0x18]
011dc837  dae9  FUCOMPP
011dc839  9bdfe0  FSTSW AX
011dc83c  f6c405  TEST AH,0x5
011dc83f  7a0f  JP 0x011dc850
011dc841  b850ca1d01  MOV EAX,0x11dca50
011dc846  e8a5e85bff  CALL 0x0079b0f0
011dc84b  e9a9000000  JMP 0x011dc8f9
011dc850  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc853  50  PUSH EAX
011dc854  6a00  PUSH 0x0
011dc856  a1e0f22401  MOV EAX,[0x0124f2e0]
011dc85b  8b00  MOV EAX,dword ptr [EAX]
011dc85d  8b4004  MOV EAX,dword ptr [EAX + 0x4]
011dc860  89853cffffff  MOV dword ptr [EBP + 0xffffff3c],EAX
011dc866  c68540ffffff11  MOV byte ptr [EBP + 0xffffff40],0x11
011dc86d  b8e4ca1d01  MOV EAX,0x11dcae4
011dc872  898544ffffff  MOV dword ptr [EBP + 0xffffff44],EAX
011dc878  c68548ffffff11  MOV byte ptr [EBP + 0xffffff48],0x11
011dc87f  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc882  8b4008  MOV EAX,dword ptr [EAX + 0x8]
011dc885  89854cffffff  MOV dword ptr [EBP + 0xffffff4c],EAX
011dc88b  c68550ffffff00  MOV byte ptr [EBP + 0xffffff50],0x0
011dc892  dd45e8  FLD double ptr [EBP + -0x18]
011dc895  db7d88  FSTP extended double ptr [EBP + -0x78]
011dc898  9b  WAIT
011dc899  8d4588  LEA EAX,[EBP + -0x78]
011dc89c  898554ffffff  MOV dword ptr [EBP + 0xffffff54],EAX
011dc8a2  c68558ffffff03  MOV byte ptr [EBP + 0xffffff58],0x3
011dc8a9  e8feddfeff  CALL 0x011ca6ac
011dc8ae  dbbd7cffffff  FSTP extended double ptr [EBP + 0xffffff7c]
011dc8b4  9b  WAIT
011dc8b5  8d857cffffff  LEA EAX,[EBP + 0xffffff7c]
011dc8bb  89855cffffff  MOV dword ptr [EBP + 0xffffff5c],EAX
011dc8c1  c68560ffffff03  MOV byte ptr [EBP + 0xffffff60],0x3
011dc8c8  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dc8cb  898564ffffff  MOV dword ptr [EBP + 0xffffff64],EAX
011dc8d1  c68568ffffff11  MOV byte ptr [EBP + 0xffffff68],0x11
011dc8d8  8d953cffffff  LEA EDX,[EBP + 0xffffff3c]
011dc8de  b905000000  MOV ECX,0x5
011dc8e3  b81cca1d01  MOV EAX,0x11dca1c
011dc8e8  e893117dff  CALL 0x009ada80
011dc8ed  84c0  TEST AL,AL
011dc8ef  7508  JNZ 0x011dc8f9
011dc8f1  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc8f4  8b10  MOV EDX,dword ptr [EAX]
011dc8f6  ff5248  CALL dword ptr [EDX + 0x48]
011dc8f9  8d8538ffffff  LEA EAX,[EBP + 0xffffff38]
011dc8ff  50  PUSH EAX
011dc900  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc903  8b4034  MOV EAX,dword ptr [EAX + 0x34]
011dc906  b902000000  MOV ECX,0x2
011dc90b  66ba2d00  MOV DX,0x2d
011dc90f  e8d8e35bff  CALL 0x0079acec
011dc914  8b8d38ffffff  MOV ECX,dword ptr [EBP + 0xffffff38]
011dc91a  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011dc91d  83c034  ADD EAX,0x34
011dc920  bafcca1d01  MOV EDX,0x11dcafc
011dc925  e862f822ff  CALL 0x0040c18c
011dc92a  b201  MOV DL,0x1
011dc92c  a140344a00  MOV EAX,[0x004a3440]
011dc931  e856c722ff  CALL 0x0040908c
011dc936  8945d8  MOV dword ptr [EBP + -0x28],EAX
011dc939  33c0  XOR EAX,EAX
011dc93b  55  PUSH EBP
011dc93c  6883c91d01  PUSH 0x11dc983
011dc941  64ff30  PUSH dword ptr FS:[EAX]
011dc944  648920  MOV dword ptr FS:[EAX],ESP
011dc947  8b4de4  MOV ECX,dword ptr [EBP + -0x1c]
011dc94a  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011dc94d  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dc950  e8e7f5ffff  CALL 0x011dbf3c
011dc955  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011dc958  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dc95b  e8f8f8ffff  CALL 0x011dc258
011dc960  33c0  XOR EAX,EAX
011dc962  5a  POP EDX
011dc963  59  POP ECX
011dc964  59  POP ECX
011dc965  648910  MOV dword ptr FS:[EAX],EDX
011dc968  688ac91d01  PUSH 0x11dc98a
011dc96d  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dc970  8945d4  MOV dword ptr [EBP + -0x2c],EAX
011dc973  33c0  XOR EAX,EAX
011dc975  8945d8  MOV dword ptr [EBP + -0x28],EAX
011dc978  8b45d4  MOV EAX,dword ptr [EBP + -0x2c]
011dc97b  e83cc722ff  CALL 0x004090bc
011dc980  58  POP EAX
011dc981  ffe0  JMP EAX
011dc98a  33c0  XOR EAX,EAX
011dc98c  5a  POP EDX
011dc98d  59  POP ECX
011dc98e  59  POP ECX
011dc98f  648910  MOV dword ptr FS:[EAX],EDX
011dc992  68a9c91d01  PUSH 0x11dc9a9
011dc997  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011dc99a  e81dc722ff  CALL 0x004090bc
011dc99f  58  POP EAX
011dc9a0  ffe0  JMP EAX
