; Static instruction listing. Function bodies and indirect exception flow require review.
011dccc0  55  PUSH EBP
011dccc1  8bec  MOV EBP,ESP
011dccc3  51  PUSH ECX
011dccc4  b918000000  MOV ECX,0x18
011dccc9  6a00  PUSH 0x0
011dcccb  6a00  PUSH 0x0
011dcccd  49  DEC ECX
011dccce  75f9  JNZ 0x011dccc9
011dccd0  874dfc  XCHG dword ptr [EBP + -0x4],ECX
011dccd3  53  PUSH EBX
011dccd4  894df4  MOV dword ptr [EBP + -0xc],ECX
011dccd7  8955f8  MOV dword ptr [EBP + -0x8],EDX
011dccda  8945fc  MOV dword ptr [EBP + -0x4],EAX
011dccdd  8b4508  MOV EAX,dword ptr [EBP + 0x8]
011dcce0  e8e3e322ff  CALL 0x0040b0c8
011dcce5  33c0  XOR EAX,EAX
011dcce7  55  PUSH EBP
011dcce8  6886d11d01  PUSH 0x11dd186
011dcced  64ff30  PUSH dword ptr FS:[EAX]
011dccf0  648920  MOV dword ptr FS:[EAX],ESP
011dccf3  c645e700  MOV byte ptr [EBP + -0x19],0x0
011dccf7  833dccaa250100  CMP dword ptr [0x0125aacc],0x0
011dccfe  7505  JNZ 0x011dcd05
011dcd00  e823e0ffff  CALL 0x011dad28
011dcd05  8d55c8  LEA EDX,[EBP + -0x38]
011dcd08  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcd0b  8b400c  MOV EAX,dword ptr [EAX + 0xc]
011dcd0e  e8c90225ff  CALL 0x0042cfdc
011dcd13  ff75c8  PUSH dword ptr [EBP + -0x38]
011dcd16  68a0d11d01  PUSH 0x11dd1a0
011dcd1b  8d55c4  LEA EDX,[EBP + -0x3c]
011dcd1e  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcd21  8b4058  MOV EAX,dword ptr [EAX + 0x58]
011dcd24  e8b30225ff  CALL 0x0042cfdc
011dcd29  ff75c4  PUSH dword ptr [EBP + -0x3c]
011dcd2c  8d45e8  LEA EAX,[EBP + -0x18]
011dcd2f  ba03000000  MOV EDX,0x3
011dcd34  e8dbf422ff  CALL 0x0040c214
011dcd39  b201  MOV DL,0x1
011dcd3b  a100734a00  MOV EAX,[0x004a7300]
011dcd40  e8afb42fff  CALL 0x004d81f4
011dcd45  8945e0  MOV dword ptr [EBP + -0x20],EAX
011dcd48  33c0  XOR EAX,EAX
011dcd4a  55  PUSH EBP
011dcd4b  6842d11d01  PUSH 0x11dd142
011dcd50  64ff30  PUSH dword ptr FS:[EAX]
011dcd53  648920  MOV dword ptr FS:[EAX],ESP
011dcd56  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcd59  50  PUSH EAX
011dcd5a  6a00  PUSH 0x0
011dcd5c  a1e0f22401  MOV EAX,[0x0124f2e0]
011dcd61  8b00  MOV EAX,dword ptr [EAX]
011dcd63  8b4004  MOV EAX,dword ptr [EAX + 0x4]
011dcd66  894594  MOV dword ptr [EBP + -0x6c],EAX
011dcd69  c6459811  MOV byte ptr [EBP + -0x68],0x11
011dcd6d  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
011dcd70  89459c  MOV dword ptr [EBP + -0x64],EAX
011dcd73  c645a011  MOV byte ptr [EBP + -0x60],0x11
011dcd77  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcd7a  8b4008  MOV EAX,dword ptr [EAX + 0x8]
011dcd7d  8945a4  MOV dword ptr [EBP + -0x5c],EAX
011dcd80  c645a800  MOV byte ptr [EBP + -0x58],0x0
011dcd84  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcd87  dd4018  FLD double ptr [EAX + 0x18]
011dcd8a  db7d88  FSTP extended double ptr [EBP + -0x78]
011dcd8d  9b  WAIT
011dcd8e  8d4588  LEA EAX,[EBP + -0x78]
011dcd91  8945ac  MOV dword ptr [EBP + -0x54],EAX
011dcd94  c645b003  MOV byte ptr [EBP + -0x50],0x3
011dcd98  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcd9b  dd4020  FLD double ptr [EAX + 0x20]
011dcd9e  dbbd7cffffff  FSTP extended double ptr [EBP + 0xffffff7c]
011dcda4  9b  WAIT
011dcda5  8d857cffffff  LEA EAX,[EBP + 0xffffff7c]
011dcdab  8945b4  MOV dword ptr [EBP + -0x4c],EAX
011dcdae  c645b803  MOV byte ptr [EBP + -0x48],0x3
011dcdb2  8b4508  MOV EAX,dword ptr [EBP + 0x8]
011dcdb5  8945bc  MOV dword ptr [EBP + -0x44],EAX
011dcdb8  c645c011  MOV byte ptr [EBP + -0x40],0x11
011dcdbc  8d5594  LEA EDX,[EBP + -0x6c]
011dcdbf  b905000000  MOV ECX,0x5
011dcdc4  b8b0d11d01  MOV EAX,0x11dd1b0
011dcdc9  e8b20c7dff  CALL 0x009ada80
011dcdce  33c0  XOR EAX,EAX
011dcdd0  8945dc  MOV dword ptr [EBP + -0x24],EAX
011dcdd3  33c0  XOR EAX,EAX
011dcdd5  8945d8  MOV dword ptr [EBP + -0x28],EAX
011dcdd8  33c0  XOR EAX,EAX
011dcdda  55  PUSH EBP
011dcddb  6823d11d01  PUSH 0x11dd123
011dcde0  64ff30  PUSH dword ptr FS:[EAX]
011dcde3  648920  MOV dword ptr FS:[EAX],ESP
011dcde6  b201  MOV DL,0x1
011dcde8  a140344a00  MOV EAX,[0x004a3440]
011dcded  e89ac222ff  CALL 0x0040908c
011dcdf2  8945dc  MOV dword ptr [EBP + -0x24],EAX
011dcdf5  b201  MOV DL,0x1
011dcdf7  a140344a00  MOV EAX,[0x004a3440]
011dcdfc  e88bc222ff  CALL 0x0040908c
011dce01  8945d8  MOV dword ptr [EBP + -0x28],EAX
011dce04  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dce07  8b10  MOV EDX,dword ptr [EAX]
011dce09  ff5214  CALL dword ptr [EDX + 0x14]
011dce0c  48  DEC EAX
011dce0d  7c22  JL 0x011dce31
011dce0f  8d8d78ffffff  LEA ECX,[EBP + 0xffffff78]
011dce15  33d2  XOR EDX,EDX
011dce17  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dce1a  8b18  MOV EBX,dword ptr [EAX]
011dce1c  ff530c  CALL dword ptr [EBX + 0xc]
011dce1f  8b8578ffffff  MOV EAX,dword ptr [EBP + 0xffffff78]
011dce25  bad4d11d01  MOV EDX,0x11dd1d4
011dce2a  e8f5f422ff  CALL 0x0040c324
011dce2f  7564  JNZ 0x011dce95
011dce31  b201  MOV DL,0x1
011dce33  a148791d01  MOV EAX,[0x011d7948]
011dce38  e84fc222ff  CALL 0x0040908c
011dce3d  8945ec  MOV dword ptr [EBP + -0x14],EAX
011dce40  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce43  83c00c  ADD EAX,0xc
011dce46  bad4d11d01  MOV EDX,0x11dd1d4
011dce4b  e874e522ff  CALL 0x0040b3c4
011dce50  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce53  33d2  XOR EDX,EDX
011dce55  895010  MOV dword ptr [EAX + 0x10],EDX
011dce58  e84fd8feff  CALL 0x011ca6ac
011dce5d  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce60  dd5818  FSTP double ptr [EAX + 0x18]
011dce63  9b  WAIT
011dce64  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce67  c7402861000000  MOV dword ptr [EAX + 0x28],0x61
011dce6e  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce71  83c05c  ADD EAX,0x5c
011dce74  bae4d11d01  MOV EDX,0x11dd1e4
011dce79  e846e522ff  CALL 0x0040b3c4
011dce7e  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dce81  c6406901  MOV byte ptr [EAX + 0x69],0x1
011dce85  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011dce88  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011dce8b  e8805f2fff  CALL 0x004d2e10
011dce90  e942020000  JMP 0x011dd0d7
011dce95  8d8574ffffff  LEA EAX,[EBP + 0xffffff74]
011dce9b  50  PUSH EAX
011dce9c  8d8d70ffffff  LEA ECX,[EBP + 0xffffff70]
011dcea2  33d2  XOR EDX,EDX
011dcea4  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcea7  8b18  MOV EBX,dword ptr [EAX]
011dcea9  ff530c  CALL dword ptr [EBX + 0xc]
011dceac  8b8570ffffff  MOV EAX,dword ptr [EBP + 0xffffff70]
011dceb2  b902000000  MOV ECX,0x2
011dceb7  66ba5e00  MOV DX,0x5e
011dcebb  e82cde5bff  CALL 0x0079acec
011dcec0  8b8574ffffff  MOV EAX,dword ptr [EBP + 0xffffff74]
011dcec6  33d2  XOR EDX,EDX
011dcec8  e86b0325ff  CALL 0x0042d238
011dcecd  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
011dced0  894230  MOV dword ptr [EDX + 0x30],EAX
011dced3  8d856cffffff  LEA EAX,[EBP + 0xffffff6c]
011dced9  50  PUSH EAX
011dceda  8d8d68ffffff  LEA ECX,[EBP + 0xffffff68]
011dcee0  33d2  XOR EDX,EDX
011dcee2  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcee5  8b18  MOV EBX,dword ptr [EAX]
011dcee7  ff530c  CALL dword ptr [EBX + 0xc]
011dceea  8b8568ffffff  MOV EAX,dword ptr [EBP + 0xffffff68]
011dcef0  b903000000  MOV ECX,0x3
011dcef5  66ba5e00  MOV DX,0x5e
011dcef9  e8eedd5bff  CALL 0x0079acec
011dcefe  8b856cffffff  MOV EAX,dword ptr [EBP + 0xffffff6c]
011dcf04  e8c3497dff  CALL 0x009b18cc
011dcf09  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcf0c  dd5828  FSTP double ptr [EAX + 0x28]
011dcf0f  9b  WAIT
011dcf10  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcf13  8b10  MOV EDX,dword ptr [EAX]
011dcf15  ff5214  CALL dword ptr [EDX + 0x14]
011dcf18  48  DEC EAX
011dcf19  85c0  TEST EAX,EAX
011dcf1b  0f8eb6010000  JLE 0x011dd0d7
011dcf21  8945d4  MOV dword ptr [EBP + -0x2c],EAX
011dcf24  c745f001000000  MOV dword ptr [EBP + -0x10],0x1
011dcf2b  8d8d64ffffff  LEA ECX,[EBP + 0xffffff64]
011dcf31  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dcf34  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcf37  8b18  MOV EBX,dword ptr [EAX]
011dcf39  ff530c  CALL dword ptr [EBX + 0xc]
011dcf3c  8b9564ffffff  MOV EDX,dword ptr [EBP + 0xffffff64]
011dcf42  b814d21d01  MOV EAX,0x11dd214
011dcf47  e8dcf524ff  CALL 0x0042c528
011dcf4c  85c0  TEST EAX,EAX
011dcf4e  7509  JNZ 0x011dcf59
011dcf50  c645e701  MOV byte ptr [EBP + -0x19],0x1
011dcf54  e972010000  JMP 0x011dd0cb
011dcf59  b201  MOV DL,0x1
011dcf5b  a148791d01  MOV EAX,[0x011d7948]
011dcf60  e827c122ff  CALL 0x0040908c
011dcf65  8945ec  MOV dword ptr [EBP + -0x14],EAX
011dcf68  8d8560ffffff  LEA EAX,[EBP + 0xffffff60]
011dcf6e  50  PUSH EAX
011dcf6f  8d8d5cffffff  LEA ECX,[EBP + 0xffffff5c]
011dcf75  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dcf78  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcf7b  8b18  MOV EBX,dword ptr [EAX]
011dcf7d  ff530c  CALL dword ptr [EBX + 0xc]
011dcf80  8b855cffffff  MOV EAX,dword ptr [EBP + 0xffffff5c]
011dcf86  b901000000  MOV ECX,0x1
011dcf8b  66ba5e00  MOV DX,0x5e
011dcf8f  e858dd5bff  CALL 0x0079acec
011dcf94  8b9560ffffff  MOV EDX,dword ptr [EBP + 0xffffff60]
011dcf9a  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dcf9d  83c00c  ADD EAX,0xc
011dcfa0  e81fe422ff  CALL 0x0040b3c4
011dcfa5  8d8558ffffff  LEA EAX,[EBP + 0xffffff58]
011dcfab  50  PUSH EAX
011dcfac  8d8d54ffffff  LEA ECX,[EBP + 0xffffff54]
011dcfb2  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dcfb5  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcfb8  8b18  MOV EBX,dword ptr [EAX]
011dcfba  ff530c  CALL dword ptr [EBX + 0xc]
011dcfbd  8b8554ffffff  MOV EAX,dword ptr [EBP + 0xffffff54]
011dcfc3  b902000000  MOV ECX,0x2
011dcfc8  66ba5e00  MOV DX,0x5e
011dcfcc  e81bdd5bff  CALL 0x0079acec
011dcfd1  8b8558ffffff  MOV EAX,dword ptr [EBP + 0xffffff58]
011dcfd7  33d2  XOR EDX,EDX
011dcfd9  e85a0225ff  CALL 0x0042d238
011dcfde  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011dcfe1  894210  MOV dword ptr [EDX + 0x10],EAX
011dcfe4  8d8550ffffff  LEA EAX,[EBP + 0xffffff50]
011dcfea  50  PUSH EAX
011dcfeb  8d8d4cffffff  LEA ECX,[EBP + 0xffffff4c]
011dcff1  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dcff4  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dcff7  8b18  MOV EBX,dword ptr [EAX]
011dcff9  ff530c  CALL dword ptr [EBX + 0xc]
011dcffc  8b854cffffff  MOV EAX,dword ptr [EBP + 0xffffff4c]
011dd002  b903000000  MOV ECX,0x3
011dd007  66ba5e00  MOV DX,0x5e
011dd00b  e8dcdc5bff  CALL 0x0079acec
011dd010  8b8550ffffff  MOV EAX,dword ptr [EBP + 0xffffff50]
011dd016  e8b1487dff  CALL 0x009b18cc
011dd01b  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dd01e  dd5818  FSTP double ptr [EAX + 0x18]
011dd021  9b  WAIT
011dd022  8d8548ffffff  LEA EAX,[EBP + 0xffffff48]
011dd028  50  PUSH EAX
011dd029  8d8d44ffffff  LEA ECX,[EBP + 0xffffff44]
011dd02f  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dd032  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dd035  8b18  MOV EBX,dword ptr [EAX]
011dd037  ff530c  CALL dword ptr [EBX + 0xc]
011dd03a  8b8544ffffff  MOV EAX,dword ptr [EBP + 0xffffff44]
011dd040  b904000000  MOV ECX,0x4
011dd045  66ba5e00  MOV DX,0x5e
011dd049  e89edc5bff  CALL 0x0079acec
011dd04e  8b9548ffffff  MOV EDX,dword ptr [EBP + 0xffffff48]
011dd054  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dd057  83c074  ADD EAX,0x74
011dd05a  e865e322ff  CALL 0x0040b3c4
011dd05f  8d8540ffffff  LEA EAX,[EBP + 0xffffff40]
011dd065  50  PUSH EAX
011dd066  8d8d3cffffff  LEA ECX,[EBP + 0xffffff3c]
011dd06c  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011dd06f  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011dd072  8b18  MOV EBX,dword ptr [EAX]
011dd074  ff530c  CALL dword ptr [EBX + 0xc]
011dd077  8b853cffffff  MOV EAX,dword ptr [EBP + 0xffffff3c]
011dd07d  b905000000  MOV ECX,0x5
011dd082  66ba5e00  MOV DX,0x5e
011dd086  e861dc5bff  CALL 0x0079acec
011dd08b  8b9540ffffff  MOV EDX,dword ptr [EBP + 0xffffff40]
011dd091  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dd094  83c078  ADD EAX,0x78
011dd097  e828e322ff  CALL 0x0040b3c4
011dd09c  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dd09f  8b4010  MOV EAX,dword ptr [EAX + 0x10]
011dd0a2  e8a9e4ffff  CALL 0x011db550
011dd0a7  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011dd0aa  894260  MOV dword ptr [EDX + 0x60],EAX
011dd0ad  807de700  CMP byte ptr [EBP + -0x19],0x0
011dd0b1  740d  JZ 0x011dd0c0
011dd0b3  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011dd0b6  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011dd0b9  e8525d2fff  CALL 0x004d2e10
011dd0be  eb0b  JMP 0x011dd0cb
011dd0c0  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011dd0c3  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dd0c6  e8455d2fff  CALL 0x004d2e10
011dd0cb  ff45f0  INC dword ptr [EBP + -0x10]
011dd0ce  ff4dd4  DEC dword ptr [EBP + -0x2c]
011dd0d1  0f8554feffff  JNZ 0x011dcf2b
011dd0d7  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011dd0da  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011dd0dd  e876f1ffff  CALL 0x011dc258
011dd0e2  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011dd0e5  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dd0e8  e86bf1ffff  CALL 0x011dc258
011dd0ed  33c0  XOR EAX,EAX
011dd0ef  5a  POP EDX
011dd0f0  59  POP ECX
011dd0f1  59  POP ECX
011dd0f2  648910  MOV dword ptr FS:[EAX],EDX
011dd0f5  682ad11d01  PUSH 0x11dd12a
011dd0fa  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
011dd0fd  8945d0  MOV dword ptr [EBP + -0x30],EAX
011dd100  33c0  XOR EAX,EAX
011dd102  8945d8  MOV dword ptr [EBP + -0x28],EAX
011dd105  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
011dd108  e8afbf22ff  CALL 0x004090bc
011dd10d  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011dd110  8945cc  MOV dword ptr [EBP + -0x34],EAX
011dd113  33c0  XOR EAX,EAX
011dd115  8945dc  MOV dword ptr [EBP + -0x24],EAX
011dd118  8b45cc  MOV EAX,dword ptr [EBP + -0x34]
011dd11b  e89cbf22ff  CALL 0x004090bc
011dd120  58  POP EAX
011dd121  ffe0  JMP EAX
