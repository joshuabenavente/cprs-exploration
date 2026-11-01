; Static instruction listing. Function bodies and indirect exception flow require review.
00ea4440  55  PUSH EBP
00ea4441  8bec  MOV EBP,ESP
00ea4443  53  PUSH EBX
00ea4444  8bd8  MOV EBX,EAX
00ea4446  8bc3  MOV EAX,EBX
00ea4448  e883f03500  CALL 0x012034d0
00ea444d  83bbf405000000  CMP dword ptr [EBX + 0x5f4],0x0
00ea4454  7411  JZ 0x00ea4467
00ea4456  b824a32501  MOV EAX,0x125a324
00ea445b  e8746b56ff  CALL 0x0040afd4
00ea4460  8bc3  MOV EAX,EBX
00ea4462  e8cdfd0000  CALL 0x00eb4234
00ea4467  8b83e4040000  MOV EAX,dword ptr [EBX + 0x4e4]
00ea446d  33d2  XOR EDX,EDX
00ea446f  e8984181ff  CALL 0x006b860c
00ea4474  8b83f0040000  MOV EAX,dword ptr [EBX + 0x4f0]
00ea447a  8b8030030000  MOV EAX,dword ptr [EAX + 0x330]
00ea4480  8b10  MOV EDX,dword ptr [EAX]
00ea4482  ff5248  CALL dword ptr [EDX + 0x48]
00ea4485  a1a4a22501  MOV EAX,[0x0125a2a4]
00ea448a  8b10  MOV EDX,dword ptr [EAX]
00ea448c  ff5248  CALL dword ptr [EDX + 0x48]
00ea448f  a1a8a22501  MOV EAX,[0x0125a2a8]
00ea4494  8b10  MOV EDX,dword ptr [EAX]
00ea4496  ff5248  CALL dword ptr [EDX + 0x48]
00ea4499  a1aca22501  MOV EAX,[0x0125a2ac]
00ea449e  8b10  MOV EDX,dword ptr [EAX]
00ea44a0  ff5248  CALL dword ptr [EDX + 0x48]
00ea44a3  8b83d4050000  MOV EAX,dword ptr [EBX + 0x5d4]
00ea44a9  e8a24c7cff  CALL 0x00669150
00ea44ae  8b10  MOV EDX,dword ptr [EAX]
00ea44b0  ff5248  CALL dword ptr [EDX + 0x48]
00ea44b3  8bc3  MOV EAX,EBX
00ea44b5  e8c6940100  CALL 0x00ebd980
00ea44ba  a1a0a22501  MOV EAX,[0x0125a2a0]
00ea44bf  8b10  MOV EDX,dword ptr [EAX]
00ea44c1  ff5248  CALL dword ptr [EDX + 0x48]
00ea44c4  8b83bc050000  MOV EAX,dword ptr [EBX + 0x5bc]
00ea44ca  8b1530a32501  MOV EDX,dword ptr [0x0125a330]
00ea44d0  e867e17dff  CALL 0x0068263c
00ea44d5  8b9b50050000  MOV EBX,dword ptr [EBX + 0x550]
00ea44db  ba01000000  MOV EDX,0x1
00ea44e0  8bc3  MOV EAX,EBX
00ea44e2  e88d4f8cff  CALL 0x00769474
00ea44e7  ba01000000  MOV EDX,0x1
00ea44ec  8bc3  MOV EAX,EBX
00ea44ee  e8b94a8cff  CALL 0x00768fac
00ea44f3  6a00  PUSH 0x0
00ea44f5  33c9  XOR ECX,ECX
00ea44f7  33d2  XOR EDX,EDX
00ea44f9  8bc3  MOV EAX,EBX
00ea44fb  e8a08e8cff  CALL 0x0076d3a0
00ea4500  5b  POP EBX
00ea4501  5d  POP EBP
00ea4502  c3  RET
