; Static instruction listing. Function bodies and indirect exception flow require review.
00e1fc84  55  PUSH EBP
00e1fc85  8bec  MOV EBP,ESP
00e1fc87  83c4f8  ADD ESP,-0x8
00e1fc8a  53  PUSH EBX
00e1fc8b  56  PUSH ESI
00e1fc8c  57  PUSH EDI
00e1fc8d  33c9  XOR ECX,ECX
00e1fc8f  894df8  MOV dword ptr [EBP + -0x8],ECX
00e1fc92  8bf0  MOV ESI,EAX
00e1fc94  33c0  XOR EAX,EAX
00e1fc96  55  PUSH EBP
00e1fc97  688efde100  PUSH 0xe1fd8e
00e1fc9c  64ff30  PUSH dword ptr FS:[EAX]
00e1fc9f  648920  MOV dword ptr FS:[EAX],ESP
00e1fca2  e9cf000000  JMP 0x00e1fd76
00e1fd76  33c0  XOR EAX,EAX
00e1fd78  5a  POP EDX
00e1fd79  59  POP ECX
00e1fd7a  59  POP ECX
00e1fd7b  648910  MOV dword ptr FS:[EAX],EDX
00e1fd7e  6895fde100  PUSH 0xe1fd95
00e1fd83  8d45f8  LEA EAX,[EBP + -0x8]
00e1fd86  e849b25eff  CALL 0x0040afd4
00e1fd8b  58  POP EAX
00e1fd8c  ffe0  JMP EAX
