; Static instruction listing. Function bodies and indirect exception flow require review.
011cec4c  55  PUSH EBP
011cec4d  8bec  MOV EBP,ESP
011cec4f  b90f000000  MOV ECX,0xf
011cec54  6a00  PUSH 0x0
011cec56  6a00  PUSH 0x0
011cec58  49  DEC ECX
011cec59  75f9  JNZ 0x011cec54
011cec5b  51  PUSH ECX
011cec5c  53  PUSH EBX
011cec5d  56  PUSH ESI
011cec5e  8bda  MOV EBX,EDX
011cec60  8bf0  MOV ESI,EAX
011cec62  33c0  XOR EAX,EAX
011cec64  55  PUSH EBP
011cec65  68cbf01c01  PUSH 0x11cf0cb
011cec6a  64ff30  PUSH dword ptr FS:[EAX]
011cec6d  648920  MOV dword ptr FS:[EAX],ESP
011cec70  8d45fc  LEA EAX,[EBP + -0x4]
011cec73  50  PUSH EAX
011cec74  6a00  PUSH 0x0
011cec76  6a00  PUSH 0x0
011cec78  8975f4  MOV dword ptr [EBP + -0xc],ESI
011cec7b  c645f811  MOV byte ptr [EBP + -0x8],0x11
011cec7f  8d55f4  LEA EDX,[EBP + -0xc]
011cec82  33c9  XOR ECX,ECX
011cec84  b8e4f01c01  MOV EAX,0x11cf0e4
011cec89  e896ec7dff  CALL 0x009ad924
011cec8e  a118e12401  MOV EAX,[0x0124e118]
011cec93  c60000  MOV byte ptr [EAX],0x0
011cec96  8d45f0  LEA EAX,[EBP + -0x10]
011cec99  50  PUSH EAX
011cec9a  b901000000  MOV ECX,0x1
011cec9f  66ba5e00  MOV DX,0x5e
011ceca3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ceca6  e841c05cff  CALL 0x0079acec
011cecab  8b55f0  MOV EDX,dword ptr [EBP + -0x10]
011cecae  8bc3  MOV EAX,EBX
011cecb0  e80fc723ff  CALL 0x0040b3c4
011cecb5  8d45ec  LEA EAX,[EBP + -0x14]
011cecb8  50  PUSH EAX
011cecb9  b90e000000  MOV ECX,0xe
011cecbe  66ba5e00  MOV DX,0x5e
011cecc2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cecc5  e822c05cff  CALL 0x0079acec
011cecca  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011ceccd  8d4304  LEA EAX,[EBX + 0x4]
011cecd0  e8efc623ff  CALL 0x0040b3c4
011cecd5  8d45e4  LEA EAX,[EBP + -0x1c]
011cecd8  50  PUSH EAX
011cecd9  b904000000  MOV ECX,0x4
011cecde  66ba5e00  MOV DX,0x5e
011cece2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cece5  e802c05cff  CALL 0x0079acec
011cecea  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
011ceced  8d55e8  LEA EDX,[EBP + -0x18]
011cecf0  e8fbb7ffff  CALL 0x011ca4f0
011cecf5  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
011cecf8  8d430c  LEA EAX,[EBX + 0xc]
011cecfb  e8c4c623ff  CALL 0x0040b3c4
011ced00  8d45e0  LEA EAX,[EBP + -0x20]
011ced03  50  PUSH EAX
011ced04  b903000000  MOV ECX,0x3
011ced09  66ba5e00  MOV DX,0x5e
011ced0d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ced10  e8d7bf5cff  CALL 0x0079acec
011ced15  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
011ced18  e8af2b7eff  CALL 0x009b18cc
011ced1d  dd5b10  FSTP double ptr [EBX + 0x10]
011ced20  9b  WAIT
011ced21  8d45dc  LEA EAX,[EBP + -0x24]
011ced24  50  PUSH EAX
011ced25  b90f000000  MOV ECX,0xf
011ced2a  66ba5e00  MOV DX,0x5e
011ced2e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ced31  e8b6bf5cff  CALL 0x0079acec
011ced36  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
011ced39  33d2  XOR EDX,EDX
011ced3b  e8f8e425ff  CALL 0x0042d238
011ced40  894318  MOV dword ptr [EBX + 0x18],EAX
011ced43  8d45d8  LEA EAX,[EBP + -0x28]
011ced46  50  PUSH EAX
011ced47  b912000000  MOV ECX,0x12
011ced4c  66ba5e00  MOV DX,0x5e
011ced50  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ced53  e894bf5cff  CALL 0x0079acec
011ced58  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
011ced5b  8d4368  LEA EAX,[EBX + 0x68]
011ced5e  e861c623ff  CALL 0x0040b3c4
011ced63  8d45d4  LEA EAX,[EBP + -0x2c]
011ced66  50  PUSH EAX
011ced67  b913000000  MOV ECX,0x13
011ced6c  66ba5e00  MOV DX,0x5e
011ced70  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ced73  e874bf5cff  CALL 0x0079acec
011ced78  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
011ced7b  8d436c  LEA EAX,[EBX + 0x6c]
011ced7e  e841c623ff  CALL 0x0040b3c4
011ced83  8d45d0  LEA EAX,[EBP + -0x30]
011ced86  50  PUSH EAX
011ced87  b902000000  MOV ECX,0x2
011ced8c  66ba5e00  MOV DX,0x5e
011ced90  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ced93  e854bf5cff  CALL 0x0079acec
011ced98  8b45d0  MOV EAX,dword ptr [EBP + -0x30]
011ced9b  85c0  TEST EAX,EAX
011ced9d  7403  JZ 0x011ceda2
011ced9f  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
011ceda2  85c0  TEST EAX,EAX
011ceda4  7e21  JLE 0x011cedc7
011ceda6  8d45cc  LEA EAX,[EBP + -0x34]
011ceda9  50  PUSH EAX
011cedaa  b902000000  MOV ECX,0x2
011cedaf  66ba5e00  MOV DX,0x5e
011cedb3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cedb6  e831bf5cff  CALL 0x0079acec
011cedbb  8b45cc  MOV EAX,dword ptr [EBP + -0x34]
011cedbe  0fb700  MOVZX EAX,word ptr [EAX]
011cedc1  6689431c  MOV word ptr [EBX + 0x1c],AX
011cedc5  eb06  JMP 0x011cedcd
011cedc7  66c7431c5500  MOV word ptr [EBX + 0x1c],0x55
011cedcd  8d45c8  LEA EAX,[EBP + -0x38]
011cedd0  50  PUSH EAX
011cedd1  b905000000  MOV ECX,0x5
011cedd6  66ba5e00  MOV DX,0x5e
011cedda  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ceddd  e80abf5cff  CALL 0x0079acec
011cede2  8b45c8  MOV EAX,dword ptr [EBP + -0x38]
011cede5  33d2  XOR EDX,EDX
011cede7  e84ce425ff  CALL 0x0042d238
011cedec  894320  MOV dword ptr [EBX + 0x20],EAX
011cedef  8d45c4  LEA EAX,[EBP + -0x3c]
011cedf2  50  PUSH EAX
011cedf3  b906000000  MOV ECX,0x6
011cedf8  66ba5e00  MOV DX,0x5e
011cedfc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cedff  e8e8be5cff  CALL 0x0079acec
011cee04  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
011cee07  8d4324  LEA EAX,[EBX + 0x24]
011cee0a  e8b5c523ff  CALL 0x0040b3c4
011cee0f  8d45c0  LEA EAX,[EBP + -0x40]
011cee12  50  PUSH EAX
011cee13  b907000000  MOV ECX,0x7
011cee18  66ba5e00  MOV DX,0x5e
011cee1c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cee1f  e8c8be5cff  CALL 0x0079acec
011cee24  8b55c0  MOV EDX,dword ptr [EBP + -0x40]
011cee27  8d432c  LEA EAX,[EBX + 0x2c]
011cee2a  e895c523ff  CALL 0x0040b3c4
011cee2f  8d45bc  LEA EAX,[EBP + -0x44]
011cee32  50  PUSH EAX
011cee33  b910000000  MOV ECX,0x10
011cee38  66ba5e00  MOV DX,0x5e
011cee3c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cee3f  e8a8be5cff  CALL 0x0079acec
011cee44  8b45bc  MOV EAX,dword ptr [EBP + -0x44]
011cee47  33d2  XOR EDX,EDX
011cee49  e8eae325ff  CALL 0x0042d238
011cee4e  894330  MOV dword ptr [EBX + 0x30],EAX
011cee51  8d45b8  LEA EAX,[EBP + -0x48]
011cee54  50  PUSH EAX
011cee55  b911000000  MOV ECX,0x11
011cee5a  66ba5e00  MOV DX,0x5e
011cee5e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cee61  e886be5cff  CALL 0x0079acec
011cee66  8b55b8  MOV EDX,dword ptr [EBP + -0x48]
011cee69  8d4334  LEA EAX,[EBX + 0x34]
011cee6c  e853c523ff  CALL 0x0040b3c4
011cee71  8d45b4  LEA EAX,[EBP + -0x4c]
011cee74  50  PUSH EAX
011cee75  b908000000  MOV ECX,0x8
011cee7a  66ba5e00  MOV DX,0x5e
011cee7e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cee81  e866be5cff  CALL 0x0079acec
011cee86  8b55b4  MOV EDX,dword ptr [EBP + -0x4c]
011cee89  8d4338  LEA EAX,[EBX + 0x38]
011cee8c  e833c523ff  CALL 0x0040b3c4
011cee91  8d45b0  LEA EAX,[EBP + -0x50]
011cee94  50  PUSH EAX
011cee95  b909000000  MOV ECX,0x9
011cee9a  66ba5e00  MOV DX,0x5e
011cee9e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ceea1  e846be5cff  CALL 0x0079acec
011ceea6  8b45b0  MOV EAX,dword ptr [EBP + -0x50]
011ceea9  ba0cf11c01  MOV EDX,0x11cf10c
011ceeae  e871d423ff  CALL 0x0040c324
011ceeb3  0f94c0  SETZ AL
011ceeb6  88433c  MOV byte ptr [EBX + 0x3c],AL
011ceeb9  8d45ac  LEA EAX,[EBP + -0x54]
011ceebc  50  PUSH EAX
011ceebd  b90a000000  MOV ECX,0xa
011ceec2  66ba5e00  MOV DX,0x5e
011ceec6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ceec9  e81ebe5cff  CALL 0x0079acec
011ceece  8b45ac  MOV EAX,dword ptr [EBP + -0x54]
011ceed1  e8f6297eff  CALL 0x009b18cc
011ceed6  dd5b40  FSTP double ptr [EBX + 0x40]
011ceed9  9b  WAIT
011ceeda  8d45a8  LEA EAX,[EBP + -0x58]
011ceedd  50  PUSH EAX
011ceede  b90c000000  MOV ECX,0xc
011ceee3  66ba5e00  MOV DX,0x5e
011ceee7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011ceeea  e8fdbd5cff  CALL 0x0079acec
011ceeef  8b45a8  MOV EAX,dword ptr [EBP + -0x58]
011ceef2  ba0cf11c01  MOV EDX,0x11cf10c
011ceef7  e828d423ff  CALL 0x0040c324
011ceefc  0f94c0  SETZ AL
011ceeff  884348  MOV byte ptr [EBX + 0x48],AL
011cef02  8d45a4  LEA EAX,[EBP + -0x5c]
011cef05  50  PUSH EAX
011cef06  b90d000000  MOV ECX,0xd
011cef0b  66ba5e00  MOV DX,0x5e
011cef0f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cef12  e8d5bd5cff  CALL 0x0079acec
011cef17  8b45a4  MOV EAX,dword ptr [EBP + -0x5c]
011cef1a  33d2  XOR EDX,EDX
011cef1c  e817e325ff  CALL 0x0042d238
011cef21  89434c  MOV dword ptr [EBX + 0x4c],EAX
011cef24  8d45fc  LEA EAX,[EBP + -0x4]
011cef27  50  PUSH EAX
011cef28  6a00  PUSH 0x0
011cef2a  6a00  PUSH 0x0
011cef2c  8975f4  MOV dword ptr [EBP + -0xc],ESI
011cef2f  c645f811  MOV byte ptr [EBP + -0x8],0x11
011cef33  8d55f4  LEA EDX,[EBP + -0xc]
011cef36  33c9  XOR ECX,ECX
011cef38  b81cf11c01  MOV EAX,0x11cf11c
011cef3d  e8e2e97dff  CALL 0x009ad924
011cef42  8d45a0  LEA EAX,[EBP + -0x60]
011cef45  50  PUSH EAX
011cef46  b901000000  MOV ECX,0x1
011cef4b  66ba5e00  MOV DX,0x5e
011cef4f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cef52  e895bd5cff  CALL 0x0079acec
011cef57  8b55a0  MOV EDX,dword ptr [EBP + -0x60]
011cef5a  8d4350  LEA EAX,[EBX + 0x50]
011cef5d  e862c423ff  CALL 0x0040b3c4
011cef62  8d459c  LEA EAX,[EBP + -0x64]
011cef65  50  PUSH EAX
011cef66  b902000000  MOV ECX,0x2
011cef6b  66ba5e00  MOV DX,0x5e
011cef6f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cef72  e875bd5cff  CALL 0x0079acec
011cef77  8b559c  MOV EDX,dword ptr [EBP + -0x64]
011cef7a  8d4354  LEA EAX,[EBX + 0x54]
011cef7d  e842c423ff  CALL 0x0040b3c4
011cef82  8d4598  LEA EAX,[EBP + -0x68]
011cef85  50  PUSH EAX
011cef86  b904000000  MOV ECX,0x4
011cef8b  66ba5e00  MOV DX,0x5e
011cef8f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cef92  e855bd5cff  CALL 0x0079acec
011cef97  8b5598  MOV EDX,dword ptr [EBP + -0x68]
011cef9a  8d4360  LEA EAX,[EBX + 0x60]
011cef9d  e822c423ff  CALL 0x0040b3c4
011cefa2  8d4594  LEA EAX,[EBP + -0x6c]
011cefa5  50  PUSH EAX
011cefa6  b905000000  MOV ECX,0x5
011cefab  66ba5e00  MOV DX,0x5e
011cefaf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cefb2  e835bd5cff  CALL 0x0079acec
011cefb7  8b5594  MOV EDX,dword ptr [EBP + -0x6c]
011cefba  8d4358  LEA EAX,[EBX + 0x58]
011cefbd  e802c423ff  CALL 0x0040b3c4
011cefc2  8b4324  MOV EAX,dword ptr [EBX + 0x24]
011cefc5  85c0  TEST EAX,EAX
011cefc7  7403  JZ 0x011cefcc
011cefc9  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
011cefcc  85c0  TEST EAX,EAX
011cefce  7e7e  JLE 0x011cf04e
011cefd0  8d4590  LEA EAX,[EBP + -0x70]
011cefd3  50  PUSH EAX
011cefd4  b903000000  MOV ECX,0x3
011cefd9  66ba5e00  MOV DX,0x5e
011cefdd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cefe0  e807bd5cff  CALL 0x0079acec
011cefe5  8b5590  MOV EDX,dword ptr [EBP + -0x70]
011cefe8  8d435c  LEA EAX,[EBX + 0x5c]
011cefeb  e8d4c323ff  CALL 0x0040b3c4
011ceff0  8d458c  LEA EAX,[EBP + -0x74]
011ceff3  50  PUSH EAX
011ceff4  b906000000  MOV ECX,0x6
011ceff9  66ba5e00  MOV DX,0x5e
011ceffd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cf000  e8e7bc5cff  CALL 0x0079acec
011cf005  8b558c  MOV EDX,dword ptr [EBP + -0x74]
011cf008  8d4364  LEA EAX,[EBX + 0x64]
011cf00b  e8b4c323ff  CALL 0x0040b3c4
011cf010  8d45fc  LEA EAX,[EBP + -0x4]
011cf013  50  PUSH EAX
011cf014  6a00  PUSH 0x0
011cf016  6a00  PUSH 0x0
011cf018  8975f4  MOV dword ptr [EBP + -0xc],ESI
011cf01b  c645f811  MOV byte ptr [EBP + -0x8],0x11
011cf01f  8d55f4  LEA EDX,[EBP + -0xc]
011cf022  33c9  XOR ECX,ECX
011cf024  b844f11c01  MOV EAX,0x11cf144
011cf029  e8f6e87dff  CALL 0x009ad924
011cf02e  8d4588  LEA EAX,[EBP + -0x78]
011cf031  50  PUSH EAX
011cf032  b903000000  MOV ECX,0x3
011cf037  66ba5e00  MOV DX,0x5e
011cf03b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011cf03e  e8a9bc5cff  CALL 0x0079acec
011cf043  8b5588  MOV EDX,dword ptr [EBP + -0x78]
011cf046  8d4328  LEA EAX,[EBX + 0x28]
011cf049  e876c323ff  CALL 0x0040b3c4
011cf04e  8d4308  LEA EAX,[EBX + 0x8]
011cf051  50  PUSH EAX
011cf052  6a00  PUSH 0x0
011cf054  6a00  PUSH 0x0
011cf056  8975f4  MOV dword ptr [EBP + -0xc],ESI
011cf059  c645f811  MOV byte ptr [EBP + -0x8],0x11
011cf05d  8d55f4  LEA EDX,[EBP + -0xc]
011cf060  33c9  XOR ECX,ECX
011cf062  b86cf11c01  MOV EAX,0x11cf16c
011cf067  e8b8e87dff  CALL 0x009ad924
011cf06c  84c0  TEST AL,AL
011cf06e  742e  JZ 0x011cf09e
011cf070  8d4584  LEA EAX,[EBP + -0x7c]
011cf073  50  PUSH EAX
011cf074  8b4308  MOV EAX,dword ptr [EBX + 0x8]
011cf077  b901000000  MOV ECX,0x1
011cf07c  66ba5e00  MOV DX,0x5e
011cf080  e867bc5cff  CALL 0x0079acec
011cf085  8b4584  MOV EAX,dword ptr [EBP + -0x7c]
011cf088  baa0f11c01  MOV EDX,0x11cf1a0
011cf08d  e892d223ff  CALL 0x0040c324
011cf092  7512  JNZ 0x011cf0a6
011cf094  8d4308  LEA EAX,[EBX + 0x8]
011cf097  e838bf23ff  CALL 0x0040afd4
011cf09c  eb08  JMP 0x011cf0a6
011cf09e  8d4308  LEA EAX,[EBX + 0x8]
011cf0a1  e82ebf23ff  CALL 0x0040afd4
011cf0a6  33c0  XOR EAX,EAX
011cf0a8  5a  POP EDX
011cf0a9  59  POP ECX
011cf0aa  59  POP ECX
011cf0ab  648910  MOV dword ptr FS:[EAX],EDX
011cf0ae  68d2f01c01  PUSH 0x11cf0d2
011cf0b3  8d4584  LEA EAX,[EBP + -0x7c]
011cf0b6  ba1c000000  MOV EDX,0x1c
011cf0bb  e874bf23ff  CALL 0x0040b034
011cf0c0  8d45fc  LEA EAX,[EBP + -0x4]
011cf0c3  e80cbf23ff  CALL 0x0040afd4
011cf0c8  58  POP EAX
011cf0c9  ffe0  JMP EAX
