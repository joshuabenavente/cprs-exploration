; Static instruction listing. Function bodies and indirect exception flow require review.
011dcb68  55  PUSH EBP
011dcb69  8bec  MOV EBP,ESP
011dcb6b  83c4e0  ADD ESP,-0x20
011dcb6e  894de8  MOV dword ptr [EBP + -0x18],ECX
011dcb71  8955f8  MOV dword ptr [EBP + -0x8],EDX
011dcb74  8945fc  MOV dword ptr [EBP + -0x4],EAX
011dcb77  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
011dcb7a  e849e522ff  CALL 0x0040b0c8
011dcb7f  8b4508  MOV EAX,dword ptr [EBP + 0x8]
011dcb82  e841e522ff  CALL 0x0040b0c8
011dcb87  33c0  XOR EAX,EAX
011dcb89  55  PUSH EBP
011dcb8a  687ecc1d01  PUSH 0x11dcc7e
011dcb8f  64ff30  PUSH dword ptr FS:[EAX]
011dcb92  648920  MOV dword ptr FS:[EAX],ESP
011dcb95  833dccaa250100  CMP dword ptr [0x0125aacc],0x0
011dcb9c  7505  JNZ 0x011dcba3
011dcb9e  e885e1ffff  CALL 0x011dad28
011dcba3  b201  MOV DL,0x1
011dcba5  a100734a00  MOV EAX,[0x004a7300]
011dcbaa  e845b62fff  CALL 0x004d81f4
011dcbaf  8945f4  MOV dword ptr [EBP + -0xc],EAX
011dcbb2  33c0  XOR EAX,EAX
011dcbb4  55  PUSH EBP
011dcbb5  6857cc1d01  PUSH 0x11dcc57
011dcbba  64ff30  PUSH dword ptr FS:[EAX]
011dcbbd  648920  MOV dword ptr FS:[EAX],ESP
011dcbc0  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011dcbc3  50  PUSH EAX
011dcbc4  6a00  PUSH 0x0
011dcbc6  8b4508  MOV EAX,dword ptr [EBP + 0x8]
011dcbc9  8945e0  MOV dword ptr [EBP + -0x20],EAX
011dcbcc  c645e411  MOV byte ptr [EBP + -0x1c],0x11
011dcbd0  8d55e0  LEA EDX,[EBP + -0x20]
011dcbd3  33c9  XOR ECX,ECX
011dcbd5  b898cc1d01  MOV EAX,0x11dcc98
011dcbda  e8a10e7dff  CALL 0x009ada80
011dcbdf  b201  MOV DL,0x1
011dcbe1  a140344a00  MOV EAX,[0x004a3440]
011dcbe6  e8a1c422ff  CALL 0x0040908c
011dcbeb  8945f0  MOV dword ptr [EBP + -0x10],EAX
011dcbee  33c0  XOR EAX,EAX
011dcbf0  55  PUSH EBP
011dcbf1  6838cc1d01  PUSH 0x11dcc38
011dcbf6  64ff30  PUSH dword ptr FS:[EAX]
011dcbf9  648920  MOV dword ptr FS:[EAX],ESP
011dcbfc  8b4df4  MOV ECX,dword ptr [EBP + -0xc]
011dcbff  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011dcc02  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011dcc05  e832f3ffff  CALL 0x011dbf3c
011dcc0a  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011dcc0d  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011dcc10  e843f6ffff  CALL 0x011dc258
011dcc15  33c0  XOR EAX,EAX
011dcc17  5a  POP EDX
011dcc18  59  POP ECX
011dcc19  59  POP ECX
011dcc1a  648910  MOV dword ptr FS:[EAX],EDX
011dcc1d  683fcc1d01  PUSH 0x11dcc3f
011dcc22  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011dcc25  8945ec  MOV dword ptr [EBP + -0x14],EAX
011dcc28  33c0  XOR EAX,EAX
011dcc2a  8945f0  MOV dword ptr [EBP + -0x10],EAX
011dcc2d  8b45ec  MOV EAX,dword ptr [EBP + -0x14]
011dcc30  e887c422ff  CALL 0x004090bc
011dcc35  58  POP EAX
011dcc36  ffe0  JMP EAX
