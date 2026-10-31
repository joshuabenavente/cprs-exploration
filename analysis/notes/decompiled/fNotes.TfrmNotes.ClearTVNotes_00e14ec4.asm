; Static instruction listing. Function bodies and indirect exception flow require review.
00e14ec4  55  PUSH EBP
00e14ec5  8bec  MOV EBP,ESP
00e14ec7  51  PUSH ECX
00e14ec8  8945fc  MOV dword ptr [EBP + -0x4],EAX
00e14ecb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00e14ece  8b80cc040000  MOV EAX,dword ptr [EAX + 0x4cc]
00e14ed4  33d2  XOR EDX,EDX
00e14ed6  899098030000  MOV dword ptr [EAX + 0x398],EDX
00e14edc  89909c030000  MOV dword ptr [EAX + 0x39c],EDX
00e14ee2  33d2  XOR EDX,EDX
00e14ee4  55  PUSH EBP
00e14ee5  68354fe100  PUSH 0xe14f35
00e14eea  64ff32  PUSH dword ptr FS:[EDX]
00e14eed  648922  MOV dword ptr FS:[EDX],ESP
00e14ef0  e81bd2bfff  CALL 0x00a12110
00e14ef5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00e14ef8  8b80cc040000  MOV EAX,dword ptr [EAX + 0x4cc]
00e14efe  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00e14f04  e8eba785ff  CALL 0x0066f6f4
00e14f09  33c0  XOR EAX,EAX
00e14f0b  5a  POP EDX
00e14f0c  59  POP ECX
00e14f0d  59  POP ECX
00e14f0e  648910  MOV dword ptr FS:[EAX],EDX
00e14f11  683c4fe100  PUSH 0xe14f3c
00e14f16  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00e14f19  8b80cc040000  MOV EAX,dword ptr [EAX + 0x4cc]
00e14f1f  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00e14f22  89909c030000  MOV dword ptr [EAX + 0x39c],EDX
00e14f28  c7809803000070e8e100  MOV dword ptr [EAX + 0x398],0xe1e870
00e14f32  58  POP EAX
00e14f33  ffe0  JMP EAX
