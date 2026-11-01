; Static instruction listing. Function bodies and indirect exception flow require review.
00bef608  55  PUSH EBP
00bef609  8bec  MOV EBP,ESP
00bef60b  b905000000  MOV ECX,0x5
00bef610  6a00  PUSH 0x0
00bef612  6a00  PUSH 0x0
00bef614  49  DEC ECX
00bef615  75f9  JNZ 0x00bef610
00bef617  53  PUSH EBX
00bef618  56  PUSH ESI
00bef619  57  PUSH EDI
00bef61a  33c0  XOR EAX,EAX
00bef61c  55  PUSH EBP
00bef61d  6869fabe00  PUSH 0xbefa69
00bef622  64ff30  PUSH dword ptr FS:[EAX]
00bef625  648920  MOV dword ptr FS:[EAX],ESP
00bef628  b201  MOV DL,0x1
00bef62a  a100734a00  MOV EAX,[0x004a7300]
00bef62f  e8c08b8eff  CALL 0x004d81f4
00bef634  8945f4  MOV dword ptr [EBP + -0xc],EAX
00bef637  8d45e4  LEA EAX,[EBP + -0x1c]
00bef63a  e8c90a0000  CALL 0x00bf0108
00bef63f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00bef642  8d55e8  LEA EDX,[EBP + -0x18]
00bef645  8b08  MOV ECX,dword ptr [EAX]
00bef647  ff5118  CALL dword ptr [ECX + 0x18]
00bef64a  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00bef64d  8b10  MOV EDX,dword ptr [EAX]
00bef64f  ff521c  CALL dword ptr [EDX + 0x1c]
00bef652  33d2  XOR EDX,EDX
00bef654  55  PUSH EBP
00bef655  681afabe00  PUSH 0xbefa1a
00bef65a  64ff32  PUSH dword ptr FS:[EDX]
00bef65d  648922  MOV dword ptr FS:[EDX],ESP
00bef660  33d2  XOR EDX,EDX
00bef662  55  PUSH EBP
00bef663  68d1f9be00  PUSH 0xbef9d1
00bef668  64ff32  PUSH dword ptr FS:[EDX]
00bef66b  648922  MOV dword ptr FS:[EDX],ESP
00bef66e  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
00bef671  50  PUSH EAX
00bef672  6a00  PUSH 0x0
00bef674  8d55e4  LEA EDX,[EBP + -0x1c]
00bef677  83c9ff  OR ECX,0xffffffff
00bef67a  b884fabe00  MOV EAX,0xbefa84
00bef67f  e8fce3dbff  CALL 0x009ada80
00bef684  33c0  XOR EAX,EAX
00bef686  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bef689  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
00bef68c  b201  MOV DL,0x1
00bef68e  a190594a00  MOV EAX,[0x004a5990]
00bef693  e8c85d8eff  CALL 0x004d5460
00bef698  8945f0  MOV dword ptr [EBP + -0x10],EAX
00bef69b  33c0  XOR EAX,EAX
00bef69d  55  PUSH EBP
00bef69e  68c0f9be00  PUSH 0xbef9c0
00bef6a3  64ff30  PUSH dword ptr FS:[EAX]
00bef6a6  648920  MOV dword ptr FS:[EAX],ESP
00bef6a9  e9d8020000  JMP 0x00bef986
00bef6ae  ff4604  INC dword ptr [ESI + 0x4]
00bef6b1  8d55fc  LEA EDX,[EBP + -0x4]
00bef6b4  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bef6b7  e8e85d8eff  CALL 0x004d54a4
00bef6bc  b901000000  MOV ECX,0x1
00bef6c1  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00bef6c4  b8c0fabe00  MOV EAX,0xbefac0
00bef6c9  e8e2cd81ff  CALL 0x0040c4b0
00bef6ce  8945ec  MOV dword ptr [EBP + -0x14],EAX
00bef6d1  8d45e0  LEA EAX,[EBP + -0x20]
00bef6d4  50  PUSH EAX
00bef6d5  8b4dec  MOV ECX,dword ptr [EBP + -0x14]
00bef6d8  49  DEC ECX
00bef6d9  ba01000000  MOV EDX,0x1
00bef6de  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00bef6e1  e876cc81ff  CALL 0x0040c35c
00bef6e6  8b45e0  MOV EAX,dword ptr [EBP + -0x20]
00bef6e9  33d2  XOR EDX,EDX
00bef6eb  e848db83ff  CALL 0x0042d238
00bef6f0  83f846  CMP EAX,0x46
00bef6f3  7f40  JG 0x00bef735
00bef6f5  0f846f010000  JZ 0x00bef86a
00bef6fb  83f828  CMP EAX,0x28
00bef6fe  7f1e  JG 0x00bef71e
00bef700  0f84e6000000  JZ 0x00bef7ec
00bef706  83e80a  SUB EAX,0xa
00bef709  7463  JZ 0x00bef76e
00bef70b  83e80a  SUB EAX,0xa
00bef70e  0f84ae000000  JZ 0x00bef7c2
00bef714  83e80a  SUB EAX,0xa
00bef717  747f  JZ 0x00bef798
00bef719  e93c020000  JMP 0x00bef95a
00bef71e  83e832  SUB EAX,0x32
00bef721  0f84ef000000  JZ 0x00bef816
00bef727  83e80a  SUB EAX,0xa
00bef72a  0f8410010000  JZ 0x00bef840
00bef730  e925020000  JMP 0x00bef95a
00bef735  83f863  CMP EAX,0x63
00bef738  7f1d  JG 0x00bef757
00bef73a  0f84a5010000  JZ 0x00bef8e5
00bef740  83e850  SUB EAX,0x50
00bef743  0f844b010000  JZ 0x00bef894
00bef749  83e80a  SUB EAX,0xa
00bef74c  0f846c010000  JZ 0x00bef8be
00bef752  e903020000  JMP 0x00bef95a
00bef757  2de8030000  SUB EAX,0x3e8
00bef75c  0f84aa010000  JZ 0x00bef90c
00bef762  48  DEC EAX
00bef763  0f84ca010000  JZ 0x00bef933
00bef769  e9ec010000  JMP 0x00bef95a
00bef76e  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef771  b201  MOV DL,0x1
00bef773  a1c4a9bd00  MOV EAX,[0x00bda9c4]
00bef778  e8db5ffeff  CALL 0x00bd5758
00bef77d  50  PUSH EAX
00bef77e  8d45f8  LEA EAX,[EBP + -0x8]
00bef781  e8b20f82ff  CALL 0x00410738
00bef786  8bc8  MOV ECX,EAX
00bef788  bac4fabe00  MOV EDX,0xbefac4
00bef78d  58  POP EAX
00bef78e  e8559a81ff  CALL 0x004091e8
00bef793  e9ca010000  JMP 0x00bef962
00bef798  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef79b  b201  MOV DL,0x1
00bef79d  a1ec9fbd00  MOV EAX,[0x00bd9fec]
00bef7a2  e8b15ffeff  CALL 0x00bd5758
00bef7a7  50  PUSH EAX
00bef7a8  8d45f8  LEA EAX,[EBP + -0x8]
00bef7ab  e8880f82ff  CALL 0x00410738
00bef7b0  8bc8  MOV ECX,EAX
00bef7b2  bac4fabe00  MOV EDX,0xbefac4
00bef7b7  58  POP EAX
00bef7b8  e82b9a81ff  CALL 0x004091e8
00bef7bd  e9a0010000  JMP 0x00bef962
00bef7c2  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef7c5  b201  MOV DL,0x1
00bef7c7  a1fc73bd00  MOV EAX,[0x00bd73fc]
00bef7cc  e8875ffeff  CALL 0x00bd5758
00bef7d1  50  PUSH EAX
00bef7d2  8d45f8  LEA EAX,[EBP + -0x8]
00bef7d5  e85e0f82ff  CALL 0x00410738
00bef7da  8bc8  MOV ECX,EAX
00bef7dc  bac4fabe00  MOV EDX,0xbefac4
00bef7e1  58  POP EAX
00bef7e2  e8019a81ff  CALL 0x004091e8
00bef7e7  e976010000  JMP 0x00bef962
00bef7ec  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef7ef  b201  MOV DL,0x1
00bef7f1  a1c462bd00  MOV EAX,[0x00bd62c4]
00bef7f6  e85d5ffeff  CALL 0x00bd5758
00bef7fb  50  PUSH EAX
00bef7fc  8d45f8  LEA EAX,[EBP + -0x8]
00bef7ff  e8340f82ff  CALL 0x00410738
00bef804  8bc8  MOV ECX,EAX
00bef806  bac4fabe00  MOV EDX,0xbefac4
00bef80b  58  POP EAX
00bef80c  e8d79981ff  CALL 0x004091e8
00bef811  e94c010000  JMP 0x00bef962
00bef816  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef819  b201  MOV DL,0x1
00bef81b  a1701abe00  MOV EAX,[0x00be1a70]
00bef820  e8335ffeff  CALL 0x00bd5758
00bef825  50  PUSH EAX
00bef826  8d45f8  LEA EAX,[EBP + -0x8]
00bef829  e80a0f82ff  CALL 0x00410738
00bef82e  8bc8  MOV ECX,EAX
00bef830  bac4fabe00  MOV EDX,0xbefac4
00bef835  58  POP EAX
00bef836  e8ad9981ff  CALL 0x004091e8
00bef83b  e922010000  JMP 0x00bef962
00bef840  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef843  b201  MOV DL,0x1
00bef845  a18895bd00  MOV EAX,[0x00bd9588]
00bef84a  e8095ffeff  CALL 0x00bd5758
00bef84f  50  PUSH EAX
00bef850  8d45f8  LEA EAX,[EBP + -0x8]
00bef853  e8e00e82ff  CALL 0x00410738
00bef858  8bc8  MOV ECX,EAX
00bef85a  bac4fabe00  MOV EDX,0xbefac4
00bef85f  58  POP EAX
00bef860  e8839981ff  CALL 0x004091e8
00bef865  e9f8000000  JMP 0x00bef962
00bef86a  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef86d  b201  MOV DL,0x1
00bef86f  a17c2bbe00  MOV EAX,[0x00be2b7c]
00bef874  e8df5efeff  CALL 0x00bd5758
00bef879  50  PUSH EAX
00bef87a  8d45f8  LEA EAX,[EBP + -0x8]
00bef87d  e8b60e82ff  CALL 0x00410738
00bef882  8bc8  MOV ECX,EAX
00bef884  bac4fabe00  MOV EDX,0xbefac4
00bef889  58  POP EAX
00bef88a  e8599981ff  CALL 0x004091e8
00bef88f  e9ce000000  JMP 0x00bef962
00bef894  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef897  b201  MOV DL,0x1
00bef899  a12c7ebd00  MOV EAX,[0x00bd7e2c]
00bef89e  e8b55efeff  CALL 0x00bd5758
00bef8a3  50  PUSH EAX
00bef8a4  8d45f8  LEA EAX,[EBP + -0x8]
00bef8a7  e88c0e82ff  CALL 0x00410738
00bef8ac  8bc8  MOV ECX,EAX
00bef8ae  bac4fabe00  MOV EDX,0xbefac4
00bef8b3  58  POP EAX
00bef8b4  e82f9981ff  CALL 0x004091e8
00bef8b9  e9a4000000  JMP 0x00bef962
00bef8be  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef8c1  b201  MOV DL,0x1
00bef8c3  a1208bbd00  MOV EAX,[0x00bd8b20]
00bef8c8  e88b5efeff  CALL 0x00bd5758
00bef8cd  50  PUSH EAX
00bef8ce  8d45f8  LEA EAX,[EBP + -0x8]
00bef8d1  e8620e82ff  CALL 0x00410738
00bef8d6  8bc8  MOV ECX,EAX
00bef8d8  bac4fabe00  MOV EDX,0xbefac4
00bef8dd  58  POP EAX
00bef8de  e8059981ff  CALL 0x004091e8
00bef8e3  eb7d  JMP 0x00bef962
00bef8e5  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef8e8  b201  MOV DL,0x1
00bef8ea  a178b7be00  MOV EAX,[0x00beb778]
00bef8ef  e8645efeff  CALL 0x00bd5758
00bef8f4  50  PUSH EAX
00bef8f5  8d45f8  LEA EAX,[EBP + -0x8]
00bef8f8  e83b0e82ff  CALL 0x00410738
00bef8fd  8bc8  MOV ECX,EAX
00bef8ff  bac4fabe00  MOV EDX,0xbefac4
00bef904  58  POP EAX
00bef905  e8de9881ff  CALL 0x004091e8
00bef90a  eb56  JMP 0x00bef962
00bef90c  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef90f  b201  MOV DL,0x1
00bef911  a180c2be00  MOV EAX,[0x00bec280]
00bef916  e879caffff  CALL 0x00bec394
00bef91b  50  PUSH EAX
00bef91c  8d45f8  LEA EAX,[EBP + -0x8]
00bef91f  e8140e82ff  CALL 0x00410738
00bef924  8bc8  MOV ECX,EAX
00bef926  bac4fabe00  MOV EDX,0xbefac4
00bef92b  58  POP EAX
00bef92c  e8b79881ff  CALL 0x004091e8
00bef931  eb2f  JMP 0x00bef962
00bef933  8b4dfc  MOV ECX,dword ptr [EBP + -0x4]
00bef936  b201  MOV DL,0x1
00bef938  a10ccfbe00  MOV EAX,[0x00becf0c]
00bef93d  e812d7ffff  CALL 0x00bed054
00bef942  50  PUSH EAX
00bef943  8d45f8  LEA EAX,[EBP + -0x8]
00bef946  e8ed0d82ff  CALL 0x00410738
00bef94b  8bc8  MOV ECX,EAX
00bef94d  bac4fabe00  MOV EDX,0xbefac4
00bef952  58  POP EAX
00bef953  e8909881ff  CALL 0x004091e8
00bef958  eb08  JMP 0x00bef962
00bef95a  8d45f8  LEA EAX,[EBP + -0x8]
00bef95d  e8d60d82ff  CALL 0x00410738
00bef962  837df800  CMP dword ptr [EBP + -0x8],0x0
00bef966  741e  JZ 0x00bef986
00bef968  8d45d8  LEA EAX,[EBP + -0x28]
00bef96b  e898070000  CALL 0x00bf0108
00bef970  8b45d8  MOV EAX,dword ptr [EBP + -0x28]
00bef973  8d55dc  LEA EDX,[EBP + -0x24]
00bef976  8b08  MOV ECX,dword ptr [EAX]
00bef978  ff5118  CALL dword ptr [ECX + 0x18]
00bef97b  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00bef97e  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
00bef981  8b08  MOV ECX,dword ptr [EAX]
00bef983  ff5118  CALL dword ptr [ECX + 0x18]
00bef986  8b75f0  MOV ESI,dword ptr [EBP + -0x10]
00bef989  8b4608  MOV EAX,dword ptr [ESI + 0x8]
00bef98c  8b10  MOV EDX,dword ptr [EAX]
00bef98e  ff5214  CALL dword ptr [EDX + 0x14]
00bef991  48  DEC EAX
00bef992  3b4604  CMP EAX,dword ptr [ESI + 0x4]
00bef995  0f9fc3  SETG BL
00bef998  84db  TEST BL,BL
00bef99a  0f850efdffff  JNZ 0x00bef6ae
00bef9a0  33c0  XOR EAX,EAX
00bef9a2  5a  POP EDX
00bef9a3  59  POP ECX
00bef9a4  59  POP ECX
00bef9a5  648910  MOV dword ptr FS:[EAX],EDX
00bef9a8  68c7f9be00  PUSH 0xbef9c7
00bef9ad  837df000  CMP dword ptr [EBP + -0x10],0x0
00bef9b1  740a  JZ 0x00bef9bd
00bef9b3  b201  MOV DL,0x1
00bef9b5  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
00bef9b8  8b08  MOV ECX,dword ptr [EAX]
00bef9ba  ff51fc  CALL dword ptr [ECX + -0x4]
00bef9bd  58  POP EAX
00bef9be  ffe0  JMP EAX
