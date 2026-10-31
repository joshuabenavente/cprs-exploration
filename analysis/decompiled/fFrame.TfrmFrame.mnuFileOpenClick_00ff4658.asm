; Static instruction listing. Function bodies and indirect exception flow require review.
00ff4658  55  PUSH EBP
00ff4659  8bec  MOV EBP,ESP
00ff465b  83c4d8  ADD ESP,-0x28
00ff465e  33c9  XOR ECX,ECX
00ff4660  894df4  MOV dword ptr [EBP + -0xc],ECX
00ff4663  894df0  MOV dword ptr [EBP + -0x10],ECX
00ff4666  8955f8  MOV dword ptr [EBP + -0x8],EDX
00ff4669  8945fc  MOV dword ptr [EBP + -0x4],EAX
00ff466c  33c0  XOR EAX,EAX
00ff466e  55  PUSH EBP
00ff466f  683355ff00  PUSH 0xff5533
00ff4674  64ff30  PUSH dword ptr FS:[EAX]
00ff4677  648920  MOV dword ptr FS:[EAX],ESP
00ff467a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff467d  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff4683  33d2  XOR EDX,EDX
00ff4685  8b08  MOV ECX,dword ptr [EAX]
00ff4687  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff468d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4690  8b80bc040000  MOV EAX,dword ptr [EAX + 0x4bc]
00ff4696  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
00ff4699  740c  JZ 0x00ff46a7
00ff469b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff469e  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff46a5  7409  JZ 0x00ff46b0
00ff46a7  c605c096230101  MOV byte ptr [0x012396c0],0x1
00ff46ae  eb07  JMP 0x00ff46b7
00ff46b0  c605c096230100  MOV byte ptr [0x012396c0],0x0
00ff46b7  c645ed00  MOV byte ptr [EBP + -0x13],0x0
00ff46bb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff46be  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff46c5  7510  JNZ 0x00ff46d7
00ff46c7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff46ca  8b80b4040000  MOV EAX,dword ptr [EAX + 0x4b4]
00ff46d0  33d2  XOR EDX,EDX
00ff46d2  89500c  MOV dword ptr [EAX + 0xc],EDX
00ff46d5  eb10  JMP 0x00ff46e7
00ff46d7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff46da  8b80b4040000  MOV EAX,dword ptr [EAX + 0x4b4]
00ff46e0  c7400c01000000  MOV dword ptr [EAX + 0xc],0x1
00ff46e7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff46ea  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00ff46f0  33d2  XOR EDX,EDX
00ff46f2  e805e060ff  CALL 0x006026fc
00ff46f7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff46fa  8b80ac060000  MOV EAX,dword ptr [EAX + 0x6ac]
00ff4700  8b10  MOV EDX,dword ptr [EAX]
00ff4702  ff92dc000000  CALL dword ptr [EDX + 0xdc]
00ff4708  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff470b  e8900f0000  CALL 0x00ff56a0
00ff4710  b201  MOV DL,0x1
00ff4712  a1f01a1d01  MOV EAX,[0x011d1af0]
00ff4717  e8840f1e00  CALL 0x011d56a0
00ff471c  8945e4  MOV dword ptr [EBP + -0x1c],EAX
00ff471f  33c0  XOR EAX,EAX
00ff4721  55  PUSH EBP
00ff4722  68274eff00  PUSH 0xff4e27
00ff4727  64ff30  PUSH dword ptr FS:[EAX]
00ff472a  648920  MOV dword ptr FS:[EAX],ESP
00ff472d  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4732  8b00  MOV EAX,dword ptr [EAX]
00ff4734  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4737  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff473a  48  DEC EAX
00ff473b  85c0  TEST EAX,EAX
00ff473d  0f8c19010000  JL 0x00ff485c
00ff4743  40  INC EAX
00ff4744  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff4747  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff474e  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4753  8b00  MOV EAX,dword ptr [EAX]
00ff4755  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4758  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff475b  e890e84dff  CALL 0x004d2ff0
00ff4760  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4763  50  PUSH EAX
00ff4764  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4769  8b00  MOV EAX,dword ptr [EAX]
00ff476b  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff476e  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4771  e87ae84dff  CALL 0x004d2ff0
00ff4776  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff4779  50  PUSH EAX
00ff477a  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff477f  8b00  MOV EAX,dword ptr [EAX]
00ff4781  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4784  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4787  e864e84dff  CALL 0x004d2ff0
00ff478c  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff478f  50  PUSH EAX
00ff4790  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4795  8b00  MOV EAX,dword ptr [EAX]
00ff4797  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff479a  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff479d  e84ee84dff  CALL 0x004d2ff0
00ff47a2  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff47a5  50  PUSH EAX
00ff47a6  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff47ab  8b00  MOV EAX,dword ptr [EAX]
00ff47ad  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff47b0  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff47b3  e838e84dff  CALL 0x004d2ff0
00ff47b8  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff47bb  50  PUSH EAX
00ff47bc  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff47c1  8b00  MOV EAX,dword ptr [EAX]
00ff47c3  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff47c6  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff47c9  e822e84dff  CALL 0x004d2ff0
00ff47ce  ff7024  PUSH dword ptr [EAX + 0x24]
00ff47d1  ff7020  PUSH dword ptr [EAX + 0x20]
00ff47d4  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff47d9  8b00  MOV EAX,dword ptr [EAX]
00ff47db  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff47de  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff47e1  e80ae84dff  CALL 0x004d2ff0
00ff47e6  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff47e9  50  PUSH EAX
00ff47ea  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff47ef  8b00  MOV EAX,dword ptr [EAX]
00ff47f1  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff47f4  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff47f7  e8f4e74dff  CALL 0x004d2ff0
00ff47fc  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff47ff  50  PUSH EAX
00ff4800  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4805  8b00  MOV EAX,dword ptr [EAX]
00ff4807  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff480a  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff480d  e8dee74dff  CALL 0x004d2ff0
00ff4812  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4815  50  PUSH EAX
00ff4816  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff481b  8b00  MOV EAX,dword ptr [EAX]
00ff481d  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4820  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4823  e8c8e74dff  CALL 0x004d2ff0
00ff4828  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff482b  50  PUSH EAX
00ff482c  6a00  PUSH 0x0
00ff482e  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4833  8b00  MOV EAX,dword ptr [EAX]
00ff4835  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4838  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff483b  e8b0e74dff  CALL 0x004d2ff0
00ff4840  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4843  ba0a000000  MOV EDX,0xa
00ff4848  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff484b  e8680f1e00  CALL 0x011d57b8
00ff4850  ff45e0  INC dword ptr [EBP + -0x20]
00ff4853  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4856  0f85f2feffff  JNZ 0x00ff474e
00ff485c  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4861  8b00  MOV EAX,dword ptr [EAX]
00ff4863  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4866  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4869  48  DEC EAX
00ff486a  85c0  TEST EAX,EAX
00ff486c  0f8c19010000  JL 0x00ff498b
00ff4872  40  INC EAX
00ff4873  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff4876  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff487d  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4882  8b00  MOV EAX,dword ptr [EAX]
00ff4884  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4887  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff488a  e861e74dff  CALL 0x004d2ff0
00ff488f  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4892  50  PUSH EAX
00ff4893  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4898  8b00  MOV EAX,dword ptr [EAX]
00ff489a  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff489d  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff48a0  e84be74dff  CALL 0x004d2ff0
00ff48a5  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff48a8  50  PUSH EAX
00ff48a9  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff48ae  8b00  MOV EAX,dword ptr [EAX]
00ff48b0  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff48b3  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff48b6  e835e74dff  CALL 0x004d2ff0
00ff48bb  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff48be  50  PUSH EAX
00ff48bf  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff48c4  8b00  MOV EAX,dword ptr [EAX]
00ff48c6  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff48c9  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff48cc  e81fe74dff  CALL 0x004d2ff0
00ff48d1  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff48d4  50  PUSH EAX
00ff48d5  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff48da  8b00  MOV EAX,dword ptr [EAX]
00ff48dc  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff48df  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff48e2  e809e74dff  CALL 0x004d2ff0
00ff48e7  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff48ea  50  PUSH EAX
00ff48eb  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff48f0  8b00  MOV EAX,dword ptr [EAX]
00ff48f2  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff48f5  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff48f8  e8f3e64dff  CALL 0x004d2ff0
00ff48fd  ff7024  PUSH dword ptr [EAX + 0x24]
00ff4900  ff7020  PUSH dword ptr [EAX + 0x20]
00ff4903  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4908  8b00  MOV EAX,dword ptr [EAX]
00ff490a  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff490d  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4910  e8dbe64dff  CALL 0x004d2ff0
00ff4915  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff4918  50  PUSH EAX
00ff4919  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff491e  8b00  MOV EAX,dword ptr [EAX]
00ff4920  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4923  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4926  e8c5e64dff  CALL 0x004d2ff0
00ff492b  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff492e  50  PUSH EAX
00ff492f  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4934  8b00  MOV EAX,dword ptr [EAX]
00ff4936  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4939  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff493c  e8afe64dff  CALL 0x004d2ff0
00ff4941  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4944  50  PUSH EAX
00ff4945  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff494a  8b00  MOV EAX,dword ptr [EAX]
00ff494c  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff494f  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4952  e899e64dff  CALL 0x004d2ff0
00ff4957  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff495a  50  PUSH EAX
00ff495b  6a00  PUSH 0x0
00ff495d  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4962  8b00  MOV EAX,dword ptr [EAX]
00ff4964  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4967  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff496a  e881e64dff  CALL 0x004d2ff0
00ff496f  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4972  ba14000000  MOV EDX,0x14
00ff4977  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff497a  e8390e1e00  CALL 0x011d57b8
00ff497f  ff45e0  INC dword ptr [EBP + -0x20]
00ff4982  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4985  0f85f2feffff  JNZ 0x00ff487d
00ff498b  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4990  8b00  MOV EAX,dword ptr [EAX]
00ff4992  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4995  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4998  48  DEC EAX
00ff4999  85c0  TEST EAX,EAX
00ff499b  0f8c19010000  JL 0x00ff4aba
00ff49a1  40  INC EAX
00ff49a2  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff49a5  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff49ac  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff49b1  8b00  MOV EAX,dword ptr [EAX]
00ff49b3  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff49b6  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff49b9  e832e64dff  CALL 0x004d2ff0
00ff49be  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff49c1  50  PUSH EAX
00ff49c2  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff49c7  8b00  MOV EAX,dword ptr [EAX]
00ff49c9  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff49cc  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff49cf  e81ce64dff  CALL 0x004d2ff0
00ff49d4  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff49d7  50  PUSH EAX
00ff49d8  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff49dd  8b00  MOV EAX,dword ptr [EAX]
00ff49df  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff49e2  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff49e5  e806e64dff  CALL 0x004d2ff0
00ff49ea  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff49ed  50  PUSH EAX
00ff49ee  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff49f3  8b00  MOV EAX,dword ptr [EAX]
00ff49f5  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff49f8  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff49fb  e8f0e54dff  CALL 0x004d2ff0
00ff4a00  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff4a03  50  PUSH EAX
00ff4a04  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a09  8b00  MOV EAX,dword ptr [EAX]
00ff4a0b  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a0e  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a11  e8dae54dff  CALL 0x004d2ff0
00ff4a16  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff4a19  50  PUSH EAX
00ff4a1a  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a1f  8b00  MOV EAX,dword ptr [EAX]
00ff4a21  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a24  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a27  e8c4e54dff  CALL 0x004d2ff0
00ff4a2c  ff7024  PUSH dword ptr [EAX + 0x24]
00ff4a2f  ff7020  PUSH dword ptr [EAX + 0x20]
00ff4a32  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a37  8b00  MOV EAX,dword ptr [EAX]
00ff4a39  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a3c  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a3f  e8ace54dff  CALL 0x004d2ff0
00ff4a44  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff4a47  50  PUSH EAX
00ff4a48  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a4d  8b00  MOV EAX,dword ptr [EAX]
00ff4a4f  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a52  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a55  e896e54dff  CALL 0x004d2ff0
00ff4a5a  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff4a5d  50  PUSH EAX
00ff4a5e  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a63  8b00  MOV EAX,dword ptr [EAX]
00ff4a65  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a68  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a6b  e880e54dff  CALL 0x004d2ff0
00ff4a70  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4a73  50  PUSH EAX
00ff4a74  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a79  8b00  MOV EAX,dword ptr [EAX]
00ff4a7b  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a7e  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a81  e86ae54dff  CALL 0x004d2ff0
00ff4a86  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff4a89  50  PUSH EAX
00ff4a8a  6a00  PUSH 0x0
00ff4a8c  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4a91  8b00  MOV EAX,dword ptr [EAX]
00ff4a93  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4a96  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4a99  e852e54dff  CALL 0x004d2ff0
00ff4a9e  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4aa1  ba1e000000  MOV EDX,0x1e
00ff4aa6  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4aa9  e80a0d1e00  CALL 0x011d57b8
00ff4aae  ff45e0  INC dword ptr [EBP + -0x20]
00ff4ab1  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4ab4  0f85f2feffff  JNZ 0x00ff49ac
00ff4aba  8d55f0  LEA EDX,[EBP + -0x10]
00ff4abd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4ac0  e88781ffff  CALL 0x00fecc4c
00ff4ac5  84c0  TEST AL,AL
00ff4ac7  0f853a030000  JNZ 0x00ff4e07
00ff4acd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4ad0  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff4ad6  b201  MOV DL,0x1
00ff4ad8  8b08  MOV ECX,dword ptr [EAX]
00ff4ada  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff4ae0  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4ae5  8b00  MOV EAX,dword ptr [EAX]
00ff4ae7  e8dc0f1e00  CALL 0x011d5ac8
00ff4aec  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4aef  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4af2  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4af5  48  DEC EAX
00ff4af6  85c0  TEST EAX,EAX
00ff4af8  0f8cf1000000  JL 0x00ff4bef
00ff4afe  40  INC EAX
00ff4aff  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff4b02  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff4b09  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b0c  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b0f  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b12  e8d9e44dff  CALL 0x004d2ff0
00ff4b17  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4b1a  50  PUSH EAX
00ff4b1b  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b1e  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b21  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b24  e8c7e44dff  CALL 0x004d2ff0
00ff4b29  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff4b2c  50  PUSH EAX
00ff4b2d  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b30  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b33  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b36  e8b5e44dff  CALL 0x004d2ff0
00ff4b3b  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4b3e  50  PUSH EAX
00ff4b3f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b42  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b45  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b48  e8a3e44dff  CALL 0x004d2ff0
00ff4b4d  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff4b50  50  PUSH EAX
00ff4b51  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b54  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b57  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b5a  e891e44dff  CALL 0x004d2ff0
00ff4b5f  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff4b62  50  PUSH EAX
00ff4b63  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b66  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b69  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b6c  e87fe44dff  CALL 0x004d2ff0
00ff4b71  ff7024  PUSH dword ptr [EAX + 0x24]
00ff4b74  ff7020  PUSH dword ptr [EAX + 0x20]
00ff4b77  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b7a  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b7d  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b80  e86be44dff  CALL 0x004d2ff0
00ff4b85  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff4b88  50  PUSH EAX
00ff4b89  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b8c  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4b8f  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4b92  e859e44dff  CALL 0x004d2ff0
00ff4b97  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff4b9a  50  PUSH EAX
00ff4b9b  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4b9e  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4ba1  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4ba4  e847e44dff  CALL 0x004d2ff0
00ff4ba9  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4bac  50  PUSH EAX
00ff4bad  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4bb0  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4bb3  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4bb6  e835e44dff  CALL 0x004d2ff0
00ff4bbb  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff4bbe  50  PUSH EAX
00ff4bbf  6a00  PUSH 0x0
00ff4bc1  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4bc4  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4bc7  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4bca  e821e44dff  CALL 0x004d2ff0
00ff4bcf  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4bd2  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4bd7  8b00  MOV EAX,dword ptr [EAX]
00ff4bd9  ba0a000000  MOV EDX,0xa
00ff4bde  e8d50b1e00  CALL 0x011d57b8
00ff4be3  ff45e0  INC dword ptr [EBP + -0x20]
00ff4be6  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4be9  0f851affffff  JNZ 0x00ff4b09
00ff4bef  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4bf2  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4bf5  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4bf8  48  DEC EAX
00ff4bf9  85c0  TEST EAX,EAX
00ff4bfb  0f8cf1000000  JL 0x00ff4cf2
00ff4c01  40  INC EAX
00ff4c02  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff4c05  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff4c0c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c0f  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c12  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c15  e8d6e34dff  CALL 0x004d2ff0
00ff4c1a  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c1d  50  PUSH EAX
00ff4c1e  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c21  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c24  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c27  e8c4e34dff  CALL 0x004d2ff0
00ff4c2c  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff4c2f  50  PUSH EAX
00ff4c30  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c33  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c36  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c39  e8b2e34dff  CALL 0x004d2ff0
00ff4c3e  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4c41  50  PUSH EAX
00ff4c42  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c45  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c48  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c4b  e8a0e34dff  CALL 0x004d2ff0
00ff4c50  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff4c53  50  PUSH EAX
00ff4c54  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c57  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c5a  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c5d  e88ee34dff  CALL 0x004d2ff0
00ff4c62  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff4c65  50  PUSH EAX
00ff4c66  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c69  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c6c  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c6f  e87ce34dff  CALL 0x004d2ff0
00ff4c74  ff7024  PUSH dword ptr [EAX + 0x24]
00ff4c77  ff7020  PUSH dword ptr [EAX + 0x20]
00ff4c7a  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c7d  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c80  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c83  e868e34dff  CALL 0x004d2ff0
00ff4c88  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff4c8b  50  PUSH EAX
00ff4c8c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4c8f  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4c92  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4c95  e856e34dff  CALL 0x004d2ff0
00ff4c9a  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff4c9d  50  PUSH EAX
00ff4c9e  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4ca1  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4ca4  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4ca7  e844e34dff  CALL 0x004d2ff0
00ff4cac  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4caf  50  PUSH EAX
00ff4cb0  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4cb3  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4cb6  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4cb9  e832e34dff  CALL 0x004d2ff0
00ff4cbe  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff4cc1  50  PUSH EAX
00ff4cc2  6a00  PUSH 0x0
00ff4cc4  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4cc7  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4cca  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4ccd  e81ee34dff  CALL 0x004d2ff0
00ff4cd2  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4cd5  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4cda  8b00  MOV EAX,dword ptr [EAX]
00ff4cdc  ba14000000  MOV EDX,0x14
00ff4ce1  e8d20a1e00  CALL 0x011d57b8
00ff4ce6  ff45e0  INC dword ptr [EBP + -0x20]
00ff4ce9  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4cec  0f851affffff  JNZ 0x00ff4c0c
00ff4cf2  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4cf5  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4cf8  8b4008  MOV EAX,dword ptr [EAX + 0x8]
00ff4cfb  48  DEC EAX
00ff4cfc  85c0  TEST EAX,EAX
00ff4cfe  0f8cf1000000  JL 0x00ff4df5
00ff4d04  40  INC EAX
00ff4d05  8945d8  MOV dword ptr [EBP + -0x28],EAX
00ff4d08  c745e000000000  MOV dword ptr [EBP + -0x20],0x0
00ff4d0f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d12  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d15  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d18  e8d3e24dff  CALL 0x004d2ff0
00ff4d1d  8b400c  MOV EAX,dword ptr [EAX + 0xc]
00ff4d20  50  PUSH EAX
00ff4d21  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d24  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d27  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d2a  e8c1e24dff  CALL 0x004d2ff0
00ff4d2f  8b4010  MOV EAX,dword ptr [EAX + 0x10]
00ff4d32  50  PUSH EAX
00ff4d33  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d36  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d39  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d3c  e8afe24dff  CALL 0x004d2ff0
00ff4d41  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d44  50  PUSH EAX
00ff4d45  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d48  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d4b  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d4e  e89de24dff  CALL 0x004d2ff0
00ff4d53  8a4032  MOV AL,byte ptr [EAX + 0x32]
00ff4d56  50  PUSH EAX
00ff4d57  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d5a  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d5d  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d60  e88be24dff  CALL 0x004d2ff0
00ff4d65  8b4018  MOV EAX,dword ptr [EAX + 0x18]
00ff4d68  50  PUSH EAX
00ff4d69  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d6c  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d6f  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d72  e879e24dff  CALL 0x004d2ff0
00ff4d77  ff7024  PUSH dword ptr [EAX + 0x24]
00ff4d7a  ff7020  PUSH dword ptr [EAX + 0x20]
00ff4d7d  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d80  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d83  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d86  e865e24dff  CALL 0x004d2ff0
00ff4d8b  8b402c  MOV EAX,dword ptr [EAX + 0x2c]
00ff4d8e  50  PUSH EAX
00ff4d8f  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4d92  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4d95  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4d98  e853e24dff  CALL 0x004d2ff0
00ff4d9d  8b4028  MOV EAX,dword ptr [EAX + 0x28]
00ff4da0  50  PUSH EAX
00ff4da1  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4da4  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4da7  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4daa  e841e24dff  CALL 0x004d2ff0
00ff4daf  8a4030  MOV AL,byte ptr [EAX + 0x30]
00ff4db2  50  PUSH EAX
00ff4db3  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4db6  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4db9  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4dbc  e82fe24dff  CALL 0x004d2ff0
00ff4dc1  8a4031  MOV AL,byte ptr [EAX + 0x31]
00ff4dc4  50  PUSH EAX
00ff4dc5  6a00  PUSH 0x0
00ff4dc7  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4dca  8b4014  MOV EAX,dword ptr [EAX + 0x14]
00ff4dcd  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
00ff4dd0  e81be24dff  CALL 0x004d2ff0
00ff4dd5  8b4808  MOV ECX,dword ptr [EAX + 0x8]
00ff4dd8  a1dcf82401  MOV EAX,[0x0124f8dc]
00ff4ddd  8b00  MOV EAX,dword ptr [EAX]
00ff4ddf  ba1e000000  MOV EDX,0x1e
00ff4de4  e8cf091e00  CALL 0x011d57b8
00ff4de9  ff45e0  INC dword ptr [EBP + -0x20]
00ff4dec  ff4dd8  DEC dword ptr [EBP + -0x28]
00ff4def  0f851affffff  JNZ 0x00ff4d0f
00ff4df5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4df8  e863bcffff  CALL 0x00ff0a60
00ff4dfd  e8325941ff  CALL 0x0040a734
00ff4e02  e90f070000  JMP 0x00ff5516
00ff4e07  33c0  XOR EAX,EAX
00ff4e09  5a  POP EDX
00ff4e0a  59  POP ECX
00ff4e0b  59  POP ECX
00ff4e0c  648910  MOV dword ptr FS:[EAX],EDX
00ff4e0f  682e4eff00  PUSH 0xff4e2e
00ff4e14  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4e17  e8ac0c1e00  CALL 0x011d5ac8
00ff4e1c  8b45e4  MOV EAX,dword ptr [EBP + -0x1c]
00ff4e1f  e8984241ff  CALL 0x004090bc
00ff4e24  58  POP EAX
00ff4e25  ffe0  JMP EAX
00ff4e2e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4e31  8b8084040000  MOV EAX,dword ptr [EAX + 0x484]
00ff4e37  8b80c8020000  MOV EAX,dword ptr [EAX + 0x2c8]
00ff4e3d  ba01000000  MOV EDX,0x1
00ff4e42  e8455d67ff  CALL 0x0066ab8c
00ff4e47  33d2  XOR EDX,EDX
00ff4e49  e89a5c67ff  CALL 0x0066aae8
00ff4e4e  a1dcf92401  MOV EAX,[0x0124f9dc]
00ff4e53  8b00  MOV EAX,dword ptr [EAX]
00ff4e55  80785600  CMP byte ptr [EAX + 0x56],0x0
00ff4e59  757a  JNZ 0x00ff4ed5
00ff4e5b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4e5e  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff4e65  756e  JNZ 0x00ff4ed5
00ff4e67  a190f42401  MOV EAX,[0x0124f490]
00ff4e6c  8b00  MOV EAX,dword ptr [EAX]
00ff4e6e  e87d1e1e00  CALL 0x011d6cf0
00ff4e73  a190f42401  MOV EAX,[0x0124f490]
00ff4e78  8b00  MOV EAX,dword ptr [EAX]
00ff4e7a  80780400  CMP byte ptr [EAX + 0x4],0x0
00ff4e7e  743c  JZ 0x00ff4ebc
00ff4e80  66b90400  MOV CX,0x4
00ff4e84  ba4c55ff00  MOV EDX,0xff554c
00ff4e89  b8a055ff00  MOV EAX,0xff55a0
00ff4e8e  e815f69bff  CALL 0x009b44a8
00ff4e93  83f807  CMP EAX,0x7
00ff4e96  7524  JNZ 0x00ff4ebc
00ff4e98  a190f42401  MOV EAX,[0x0124f490]
00ff4e9d  8b00  MOV EAX,dword ptr [EAX]
00ff4e9f  e8981e1e00  CALL 0x011d6d3c
00ff4ea4  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4ea7  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff4ead  b201  MOV DL,0x1
00ff4eaf  8b08  MOV ECX,dword ptr [EAX]
00ff4eb1  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff4eb7  e95a060000  JMP 0x00ff5516
00ff4ebc  a190f42401  MOV EAX,[0x0124f490]
00ff4ec1  8b00  MOV EAX,dword ptr [EAX]
00ff4ec3  80780400  CMP byte ptr [EAX + 0x4],0x0
00ff4ec7  740c  JZ 0x00ff4ed5
00ff4ec9  a190f42401  MOV EAX,[0x0124f490]
00ff4ece  8b00  MOV EAX,dword ptr [EAX]
00ff4ed0  e8671e1e00  CALL 0x011d6d3c
00ff4ed5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4ed8  80b8e106000000  CMP byte ptr [EAX + 0x6e1],0x0
00ff4edf  740a  JZ 0x00ff4eeb
00ff4ee1  8d45f4  LEA EAX,[EBP + -0xc]
00ff4ee4  e8eb6041ff  CALL 0x0040afd4
00ff4ee9  eb13  JMP 0x00ff4efe
00ff4eeb  8d45f4  LEA EAX,[EBP + -0xc]
00ff4eee  8b15e0f22401  MOV EDX,dword ptr [0x0124f2e0]
00ff4ef4  8b12  MOV EDX,dword ptr [EDX]
00ff4ef6  8b5204  MOV EDX,dword ptr [EDX + 0x4]
00ff4ef9  e80e6541ff  CALL 0x0040b40c
00ff4efe  a11ce82401  MOV EAX,[0x0124e81c]
00ff4f03  8a00  MOV AL,byte ptr [EAX]
00ff4f05  8845ee  MOV byte ptr [EBP + -0x12],AL
00ff4f08  a11ce82401  MOV EAX,[0x0124e81c]
00ff4f0d  c60000  MOV byte ptr [EAX],0x0
00ff4f10  33c0  XOR EAX,EAX
00ff4f12  55  PUSH EBP
00ff4f13  68b254ff00  PUSH 0xff54b2
00ff4f18  64ff30  PUSH dword ptr FS:[EAX]
00ff4f1b  648920  MOV dword ptr FS:[EAX],ESP
00ff4f1e  a12433a700  MOV EAX,[0x00a73324]
00ff4f23  e8441ba8ff  CALL 0x00a76a6c
00ff4f28  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f2b  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff4f32  7411  JZ 0x00ff4f45
00ff4f34  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f37  e86c900000  CALL 0x00ffdfa8
00ff4f3c  c645ef01  MOV byte ptr [EBP + -0x11],0x1
00ff4f40  e9c1020000  JMP 0x00ff5206
00ff4f45  c645ef00  MOV byte ptr [EBP + -0x11],0x0
00ff4f49  a1dcf92401  MOV EAX,[0x0124f9dc]
00ff4f4e  8b00  MOV EAX,dword ptr [EAX]
00ff4f50  80785600  CMP byte ptr [EAX + 0x56],0x0
00ff4f54  0f8552020000  JNZ 0x00ff51ac
00ff4f5a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f5d  80b8e006000000  CMP byte ptr [EAX + 0x6e0],0x0
00ff4f64  0f84e7000000  JZ 0x00ff5051
00ff4f6a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f6d  80b8d206000000  CMP byte ptr [EAX + 0x6d2],0x0
00ff4f74  0f8483000000  JZ 0x00ff4ffd
00ff4f7a  ba04000000  MOV EDX,0x4
00ff4f7f  a1bca62501  MOV EAX,[0x0125a6bc]
00ff4f84  e89b6978ff  CALL 0x0077b924
00ff4f89  83f802  CMP EAX,0x2
00ff4f8c  756f  JNZ 0x00ff4ffd
00ff4f8e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f91  e846be0000  CALL 0x01000ddc
00ff4f96  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4f99  80b8da06000000  CMP byte ptr [EAX + 0x6da],0x0
00ff4fa0  0f85e4000000  JNZ 0x00ff508a
00ff4fa6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4fa9  05d4060000  ADD EAX,0x6d4
00ff4fae  baec55ff00  MOV EDX,0xff55ec
00ff4fb3  e80c6441ff  CALL 0x0040b3c4
00ff4fb8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4fbb  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
00ff4fc1  0590000000  ADD EAX,0x90
00ff4fc6  ba1856ff00  MOV EDX,0xff5618
00ff4fcb  e8f46341ff  CALL 0x0040b3c4
00ff4fd0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff4fd3  8b80d0050000  MOV EAX,dword ptr [EAX + 0x5d0]
00ff4fd9  8b80e0010000  MOV EAX,dword ptr [EAX + 0x1e0]
00ff4fdf  e8dcd55dff  CALL 0x005d25c0
00ff4fe4  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff4fe7  8b8ad4060000  MOV ECX,dword ptr [EDX + 0x6d4]
00ff4fed  8b153c362501  MOV EDX,dword ptr [0x0125363c]
00ff4ff3  e8341c5eff  CALL 0x005d6c2c
00ff4ff8  e98d000000  JMP 0x00ff508a
00ff4ffd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5000  05d4060000  ADD EAX,0x6d4
00ff5005  ba4856ff00  MOV EDX,0xff5648
00ff500a  e8b56341ff  CALL 0x0040b3c4
00ff500f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5012  8b80cc050000  MOV EAX,dword ptr [EAX + 0x5cc]
00ff5018  0590000000  ADD EAX,0x90
00ff501d  ba7456ff00  MOV EDX,0xff5674
00ff5022  e89d6341ff  CALL 0x0040b3c4
00ff5027  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff502a  8b80d0050000  MOV EAX,dword ptr [EAX + 0x5d0]
00ff5030  8b80e0010000  MOV EAX,dword ptr [EAX + 0x1e0]
00ff5036  e885d55dff  CALL 0x005d25c0
00ff503b  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff503e  8b8ad4060000  MOV ECX,dword ptr [EDX + 0x6d4]
00ff5044  8b153c362501  MOV EDX,dword ptr [0x0125363c]
00ff504a  e8dd1b5eff  CALL 0x005d6c2c
00ff504f  eb39  JMP 0x00ff508a
00ff5051  e8aa63e8ff  CALL 0x00e7b400
00ff5056  80781400  CMP byte ptr [EAX + 0x14],0x0
00ff505a  741e  JZ 0x00ff507a
00ff505c  e89f63e8ff  CALL 0x00e7b400
00ff5061  e8e26ee8ff  CALL 0x00e7bf48
00ff5066  84c0  TEST AL,AL
00ff5068  7410  JZ 0x00ff507a
00ff506a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff506d  8b80dc060000  MOV EAX,dword ptr [EAX + 0x6dc]
00ff5073  e8601b0100  CALL 0x01006bd8
00ff5078  eb10  JMP 0x00ff508a
00ff507a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff507d  8b80dc060000  MOV EAX,dword ptr [EAX + 0x6dc]
00ff5083  b202  MOV DL,0x2
00ff5085  e83e1e0100  CALL 0x01006ec8
00ff508a  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff508f  8b00  MOV EAX,dword ptr [EAX]
00ff5091  83780400  CMP dword ptr [EAX + 0x4],0x0
00ff5095  742a  JZ 0x00ff50c1
00ff5097  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff509a  8b80bc040000  MOV EAX,dword ptr [EAX + 0x4bc]
00ff50a0  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
00ff50a3  741c  JZ 0x00ff50c1
00ff50a5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff50a8  8b8064050000  MOV EAX,dword ptr [EAX + 0x564]
00ff50ae  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
00ff50b1  740e  JZ 0x00ff50c1
00ff50b3  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff50b6  8b8050050000  MOV EAX,dword ptr [EAX + 0x550]
00ff50bc  3b45f8  CMP EAX,dword ptr [EBP + -0x8]
00ff50bf  7517  JNZ 0x00ff50d8
00ff50c1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff50c4  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff50c7  e8a88c5dff  CALL 0x005cdd74
00ff50cc  8bd0  MOV EDX,EAX
00ff50ce  8d4ded  LEA ECX,[EBP + -0x13]
00ff50d1  b001  MOV AL,0x1
00ff50d3  e860bfe8ff  CALL 0x00e81038
00ff50d8  807ded00  CMP byte ptr [EBP + -0x13],0x0
00ff50dc  741d  JZ 0x00ff50fb
00ff50de  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff50e1  8b8098040000  MOV EAX,dword ptr [EAX + 0x498]
00ff50e7  b201  MOV DL,0x1
00ff50e9  8b08  MOV ECX,dword ptr [EAX]
00ff50eb  ff919c000000  CALL dword ptr [ECX + 0x9c]
00ff50f1  e83e5641ff  CALL 0x0040a734
00ff50f6  e91b040000  JMP 0x00ff5516
00ff50fb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff50fe  e80dd40000  CALL 0x01002510
00ff5103  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5106  e8118dffff  CALL 0x00fede1c
00ff510b  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff5110  8b00  MOV EAX,dword ptr [EAX]
00ff5112  8a4035  MOV AL,byte ptr [EAX + 0x35]
00ff5115  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff5118  888230070000  MOV byte ptr [EDX + 0x730],AL
00ff511e  a190f42401  MOV EAX,[0x0124f490]
00ff5123  8b00  MOV EAX,dword ptr [EAX]
00ff5125  80780400  CMP byte ptr [EAX + 0x4],0x0
00ff5129  7438  JZ 0x00ff5163
00ff512b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff512e  e865f50000  CALL 0x01004698
00ff5133  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5136  c680fc06000001  MOV byte ptr [EAX + 0x6fc],0x1
00ff513d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5140  8b8064050000  MOV EAX,dword ptr [EAX + 0x564]
00ff5146  b201  MOV DL,0x1
00ff5148  e8db3f71ff  CALL 0x00709128
00ff514d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5150  8b90bc040000  MOV EDX,dword ptr [EAX + 0x4bc]
00ff5156  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5159  e832e1ffff  CALL 0x00ff3290
00ff515e  e9a3000000  JMP 0x00ff5206
00ff5163  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5166  c680fc06000000  MOV byte ptr [EAX + 0x6fc],0x0
00ff516d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5170  8b8004070000  MOV EAX,dword ptr [EAX + 0x704]
00ff5176  e8413f41ff  CALL 0x004090bc
00ff517b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff517e  33d2  XOR EDX,EDX
00ff5180  899004070000  MOV dword ptr [EAX + 0x704],EDX
00ff5186  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5189  8b8064050000  MOV EAX,dword ptr [EAX + 0x564]
00ff518f  33d2  XOR EDX,EDX
00ff5191  e8923f71ff  CALL 0x00709128
00ff5196  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5199  8b80a8050000  MOV EAX,dword ptr [EAX + 0x5a8]
00ff519f  33d2  XOR EDX,EDX
00ff51a1  e8823f71ff  CALL 0x00709128
00ff51a6  c645ef01  MOV byte ptr [EBP + -0x11],0x1
00ff51aa  eb5a  JMP 0x00ff5206
00ff51ac  a190f42401  MOV EAX,[0x0124f490]
00ff51b1  8b00  MOV EAX,dword ptr [EAX]
00ff51b3  e8ec171e00  CALL 0x011d69a4
00ff51b8  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff51bb  8b4074  MOV EAX,dword ptr [EAX + 0x74]
00ff51be  e8b18b5dff  CALL 0x005cdd74
00ff51c3  8bd0  MOV EDX,EAX
00ff51c5  8d4ded  LEA ECX,[EBP + -0x13]
00ff51c8  33c0  XOR EAX,EAX
00ff51ca  e869bee8ff  CALL 0x00e81038
00ff51cf  807ded00  CMP byte ptr [EBP + -0x13],0x0
00ff51d3  740a  JZ 0x00ff51df
00ff51d5  e85a5541ff  CALL 0x0040a734
00ff51da  e937030000  JMP 0x00ff5516
00ff51df  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff51e2  e829d30000  CALL 0x01002510
00ff51e7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff51ea  e82d8cffff  CALL 0x00fede1c
00ff51ef  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff51f4  8b00  MOV EAX,dword ptr [EAX]
00ff51f6  8a4035  MOV AL,byte ptr [EAX + 0x35]
00ff51f9  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
00ff51fc  888230070000  MOV byte ptr [EDX + 0x730],AL
00ff5202  c645ef01  MOV byte ptr [EBP + -0x11],0x1
00ff5206  807def00  CMP byte ptr [EBP + -0x11],0x0
00ff520a  0f84d8010000  JZ 0x00ff53e8
00ff5210  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5213  80b8e006000000  CMP byte ptr [EAX + 0x6e0],0x0
00ff521a  0f848c010000  JZ 0x00ff53ac
00ff5220  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5223  80b8d206000000  CMP byte ptr [EAX + 0x6d2],0x0
00ff522a  0f843e010000  JZ 0x00ff536e
00ff5230  ba04000000  MOV EDX,0x4
00ff5235  a1bca62501  MOV EAX,[0x0125a6bc]
00ff523a  e8e56678ff  CALL 0x0077b924
00ff523f  83f802  CMP EAX,0x2
00ff5242  0f8526010000  JNZ 0x00ff536e
00ff5248  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff524b  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff5252  0f8516010000  JNZ 0x00ff536e
00ff5258  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff525d  8b00  MOV EAX,dword ptr [EAX]
00ff525f  8b4804  MOV ECX,dword ptr [EAX + 0x4]
00ff5262  8d55e8  LEA EDX,[EBP + -0x18]
00ff5265  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5268  e823a50000  CALL 0x00fff790
00ff526d  84c0  TEST AL,AL
00ff526f  7441  JZ 0x00ff52b2
00ff5271  33d2  XOR EDX,EDX
00ff5273  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5276  e899ccffff  CALL 0x00ff1f14
00ff527b  8b15c0a62501  MOV EDX,dword ptr [0x0125a6c0]
00ff5281  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5284  e8cbcaffff  CALL 0x00ff1d54
00ff5289  8bd0  MOV EDX,EAX
00ff528b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff528e  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff5294  8b08  MOV ECX,dword ptr [EAX]
00ff5296  ff917c010000  CALL dword ptr [ECX + 0x17c]
00ff529c  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff529f  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
00ff52a5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff52a8  e83bc8ffff  CALL 0x00ff1ae8
00ff52ad  e936010000  JMP 0x00ff53e8
00ff52b2  8b45e8  MOV EAX,dword ptr [EBP + -0x18]
00ff52b5  83e802  SUB EAX,0x2
00ff52b8  7405  JZ 0x00ff52bf
00ff52ba  48  DEC EAX
00ff52bb  740f  JZ 0x00ff52cc
00ff52bd  eb71  JMP 0x00ff5330
00ff52bf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff52c2  e815bb0000  CALL 0x01000ddc
00ff52c7  e91c010000  JMP 0x00ff53e8
00ff52cc  ba04000000  MOV EDX,0x4
00ff52d1  a1bca62501  MOV EAX,[0x0125a6bc]
00ff52d6  e8496678ff  CALL 0x0077b924
00ff52db  83f802  CMP EAX,0x2
00ff52de  750f  JNZ 0x00ff52ef
00ff52e0  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff52e5  8b00  MOV EAX,dword ptr [EAX]
00ff52e7  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00ff52ea  e829f61d00  CALL 0x011d4918
00ff52ef  33d2  XOR EDX,EDX
00ff52f1  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff52f4  e81bccffff  CALL 0x00ff1f14
00ff52f9  8b15c0a62501  MOV EDX,dword ptr [0x0125a6c0]
00ff52ff  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5302  e84dcaffff  CALL 0x00ff1d54
00ff5307  8bd0  MOV EDX,EAX
00ff5309  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff530c  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff5312  8b08  MOV ECX,dword ptr [EAX]
00ff5314  ff917c010000  CALL dword ptr [ECX + 0x17c]
00ff531a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff531d  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
00ff5323  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5326  e8bdc7ffff  CALL 0x00ff1ae8
00ff532b  e9b8000000  JMP 0x00ff53e8
00ff5330  33d2  XOR EDX,EDX
00ff5332  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5335  e8dacbffff  CALL 0x00ff1f14
00ff533a  8b15c0a62501  MOV EDX,dword ptr [0x0125a6c0]
00ff5340  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5343  e80ccaffff  CALL 0x00ff1d54
00ff5348  8bd0  MOV EDX,EAX
00ff534a  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff534d  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff5353  8b08  MOV ECX,dword ptr [EAX]
00ff5355  ff917c010000  CALL dword ptr [ECX + 0x17c]
00ff535b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff535e  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
00ff5364  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5367  e87cc7ffff  CALL 0x00ff1ae8
00ff536c  eb7a  JMP 0x00ff53e8
00ff536e  33d2  XOR EDX,EDX
00ff5370  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5373  e89ccbffff  CALL 0x00ff1f14
00ff5378  8b15c0a62501  MOV EDX,dword ptr [0x0125a6c0]
00ff537e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5381  e8cec9ffff  CALL 0x00ff1d54
00ff5386  8bd0  MOV EDX,EAX
00ff5388  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff538b  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff5391  8b08  MOV ECX,dword ptr [EAX]
00ff5393  ff917c010000  CALL dword ptr [ECX + 0x17c]
00ff5399  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff539c  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
00ff53a2  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53a5  e83ec7ffff  CALL 0x00ff1ae8
00ff53aa  eb3c  JMP 0x00ff53e8
00ff53ac  33d2  XOR EDX,EDX
00ff53ae  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53b1  e85ecbffff  CALL 0x00ff1f14
00ff53b6  8b15c0a62501  MOV EDX,dword ptr [0x0125a6c0]
00ff53bc  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53bf  e890c9ffff  CALL 0x00ff1d54
00ff53c4  8bd0  MOV EDX,EAX
00ff53c6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53c9  8b8088040000  MOV EAX,dword ptr [EAX + 0x488]
00ff53cf  8b08  MOV ECX,dword ptr [EAX]
00ff53d1  ff917c010000  CALL dword ptr [ECX + 0x17c]
00ff53d7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53da  8b9088040000  MOV EDX,dword ptr [EAX + 0x488]
00ff53e0  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53e3  e800c7ffff  CALL 0x00ff1ae8
00ff53e8  33c0  XOR EAX,EAX
00ff53ea  5a  POP EDX
00ff53eb  59  POP ECX
00ff53ec  59  POP ECX
00ff53ed  648910  MOV dword ptr FS:[EAX],EDX
00ff53f0  68bc54ff00  PUSH 0xff54bc
00ff53f5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff53f8  80b8e206000000  CMP byte ptr [EAX + 0x6e2],0x0
00ff53ff  7526  JNZ 0x00ff5427
00ff5401  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff5406  8b00  MOV EAX,dword ptr [EAX]
00ff5408  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff540b  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00ff540e  e8116f41ff  CALL 0x0040c324
00ff5413  7512  JNZ 0x00ff5427
00ff5415  a11ce82401  MOV EAX,[0x0124e81c]
00ff541a  8a55ee  MOV DL,byte ptr [EBP + -0x12]
00ff541d  8810  MOV byte ptr [EAX],DL
00ff541f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5422  e839b6ffff  CALL 0x00ff0a60
00ff5427  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff542a  c6803107000000  MOV byte ptr [EAX + 0x731],0x0
00ff5431  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5434  83b84407000000  CMP dword ptr [EAX + 0x744],0x0
00ff543b  7472  JZ 0x00ff54af
00ff543d  a1e0f22401  MOV EAX,[0x0124f2e0]
00ff5442  8b00  MOV EAX,dword ptr [EAX]
00ff5444  8b4004  MOV EAX,dword ptr [EAX + 0x4]
00ff5447  8b55f4  MOV EDX,dword ptr [EBP + -0xc]
00ff544a  e8d56e41ff  CALL 0x0040c324
00ff544f  745e  JZ 0x00ff54af
00ff5451  b201  MOV DL,0x1
00ff5453  a100734a00  MOV EAX,[0x004a7300]
00ff5458  e8972d4eff  CALL 0x004d81f4
00ff545d  8945dc  MOV dword ptr [EBP + -0x24],EAX
00ff5460  33c0  XOR EAX,EAX
00ff5462  55  PUSH EBP
00ff5463  68a854ff00  PUSH 0xff54a8
00ff5468  64ff30  PUSH dword ptr FS:[EAX]
00ff546b  648920  MOV dword ptr FS:[EAX],ESP
00ff546e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5471  8b8044070000  MOV EAX,dword ptr [EAX + 0x744]
00ff5477  80b8a004000000  CMP byte ptr [EAX + 0x4a0],0x0
00ff547e  7510  JNZ 0x00ff5490
00ff5480  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
00ff5483  8b8044070000  MOV EAX,dword ptr [EAX + 0x744]
00ff5489  33d2  XOR EDX,EDX
00ff548b  e8ec2ffdff  CALL 0x00fc847c
00ff5490  33c0  XOR EAX,EAX
00ff5492  5a  POP EDX
00ff5493  59  POP ECX
00ff5494  59  POP ECX
00ff5495  648910  MOV dword ptr FS:[EAX],EDX
00ff5498  68af54ff00  PUSH 0xff54af
00ff549d  8b45dc  MOV EAX,dword ptr [EBP + -0x24]
00ff54a0  e8173c41ff  CALL 0x004090bc
00ff54a5  58  POP EAX
00ff54a6  ffe0  JMP EAX
00ff54af  58  POP EAX
00ff54b0  ffe0  JMP EAX
00ff5516  33c0  XOR EAX,EAX
00ff5518  5a  POP EDX
00ff5519  59  POP ECX
00ff551a  59  POP ECX
00ff551b  648910  MOV dword ptr FS:[EAX],EDX
00ff551e  683a55ff00  PUSH 0xff553a
00ff5523  8d45f0  LEA EAX,[EBP + -0x10]
00ff5526  ba02000000  MOV EDX,0x2
00ff552b  e8045b41ff  CALL 0x0040b034
00ff5530  58  POP EAX
00ff5531  ffe0  JMP EAX
