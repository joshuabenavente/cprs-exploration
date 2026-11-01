; Static instruction listing. Function bodies and indirect exception flow require review.
009af1ec  55  PUSH EBP
009af1ed  8bec  MOV EBP,ESP
009af1ef  51  PUSH ECX
009af1f0  53  PUSH EBX
009af1f1  56  PUSH ESI
009af1f2  8bda  MOV EBX,EDX
009af1f4  8bf0  MOV ESI,EAX
009af1f6  e825dbffff  CALL 0x009acd20
009af1fb  33c0  XOR EAX,EAX
009af1fd  55  PUSH EBP
009af1fe  6834f29a00  PUSH 0x9af234
009af203  64ff30  PUSH dword ptr FS:[EAX]
009af206  648920  MOV dword ptr FS:[EAX],ESP
009af209  a1b8632301  MOV EAX,[0x012363b8]
009af20e  e85defffff  CALL 0x009ae170
009af213  8bd3  MOV EDX,EBX
009af215  8bc6  MOV EAX,ESI
009af217  e8f8f0ffff  CALL 0x009ae314
009af21c  8845ff  MOV byte ptr [EBP + -0x1],AL
009af21f  33c0  XOR EAX,EAX
009af221  5a  POP EDX
009af222  59  POP ECX
009af223  59  POP ECX
009af224  648910  MOV dword ptr FS:[EAX],EDX
009af227  683bf29a00  PUSH 0x9af23b
009af22c  e8fbdaffff  CALL 0x009acd2c
009af231  58  POP EAX
009af232  ffe0  JMP EAX
