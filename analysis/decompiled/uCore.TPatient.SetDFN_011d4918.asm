; Static instruction listing. Function bodies and indirect exception flow require review.
011d4918  55  PUSH EBP
011d4919  8bec  MOV EBP,ESP
011d491b  83c480  ADD ESP,-0x80
011d491e  8955f8  MOV dword ptr [EBP + -0x8],EDX
011d4921  8945fc  MOV dword ptr [EBP + -0x4],EAX
011d4924  8d4580  LEA EAX,[EBP + -0x80]
011d4927  8b15a4a11c01  MOV EDX,dword ptr [0x011ca1a4]
011d492d  e86a8023ff  CALL 0x0040c99c
011d4932  33c0  XOR EAX,EAX
011d4934  55  PUSH EBP
011d4935  68314b1d01  PUSH 0x11d4b31
011d493a  64ff30  PUSH dword ptr FS:[EAX]
011d493d  648920  MOV dword ptr FS:[EAX],ESP
011d4940  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011d4943  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011d4946  8b5204  MOV EDX,dword ptr [EDX + 0x4]
011d4949  e8d67923ff  CALL 0x0040c324
011d494e  0f84bf010000  JZ 0x011d4b13
011d4954  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4957  e8dcfaffff  CALL 0x011d4438
011d495c  837df800  CMP dword ptr [EBP + -0x8],0x0
011d4960  0f84ad010000  JZ 0x011d4b13
011d4966  8d5580  LEA EDX,[EBP + -0x80]
011d4969  8b45f8  MOV EAX,dword ptr [EBP + -0x8]
011d496c  e8dba2ffff  CALL 0x011cec4c
011d4971  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4974  83c004  ADD EAX,0x4
011d4977  8b55f8  MOV EDX,dword ptr [EBP + -0x8]
011d497a  e8456a23ff  CALL 0x0040b3c4
011d497f  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4982  83c010  ADD EAX,0x10
011d4985  8b5580  MOV EDX,dword ptr [EBP + -0x80]
011d4988  e8376a23ff  CALL 0x0040b3c4
011d498d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4990  83c008  ADD EAX,0x8
011d4993  8b5584  MOV EDX,dword ptr [EBP + -0x7c]
011d4996  e8296a23ff  CALL 0x0040b3c4
011d499b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d499e  83c00c  ADD EAX,0xc
011d49a1  8b5588  MOV EDX,dword ptr [EBP + -0x78]
011d49a4  e81b6a23ff  CALL 0x0040b3c4
011d49a9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49ac  83c014  ADD EAX,0x14
011d49af  8b558c  MOV EDX,dword ptr [EBP + -0x74]
011d49b2  e80d6a23ff  CALL 0x0040b3c4
011d49b7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49ba  8b5590  MOV EDX,dword ptr [EBP + -0x70]
011d49bd  895018  MOV dword ptr [EAX + 0x18],EDX
011d49c0  8b5594  MOV EDX,dword ptr [EBP + -0x6c]
011d49c3  89501c  MOV dword ptr [EAX + 0x1c],EDX
011d49c6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49c9  8b5598  MOV EDX,dword ptr [EBP + -0x68]
011d49cc  895020  MOV dword ptr [EAX + 0x20],EDX
011d49cf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49d2  83c028  ADD EAX,0x28
011d49d5  8b55e8  MOV EDX,dword ptr [EBP + -0x18]
011d49d8  e8e76923ff  CALL 0x0040b3c4
011d49dd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49e0  83c02c  ADD EAX,0x2c
011d49e3  8b55ec  MOV EDX,dword ptr [EBP + -0x14]
011d49e6  e8d96923ff  CALL 0x0040b3c4
011d49eb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49ee  668b559c  MOV DX,word ptr [EBP + -0x64]
011d49f2  66895024  MOV word ptr [EAX + 0x24],DX
011d49f6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d49f9  83c030  ADD EAX,0x30
011d49fc  8b55b8  MOV EDX,dword ptr [EBP + -0x48]
011d49ff  e8c06923ff  CALL 0x0040b3c4
011d4a04  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a07  8a55bc  MOV DL,byte ptr [EBP + -0x44]
011d4a0a  885034  MOV byte ptr [EAX + 0x34],DL
011d4a0d  8b45a4  MOV EAX,dword ptr [EBP + -0x5c]
011d4a10  8945f4  MOV dword ptr [EBP + -0xc],EAX
011d4a13  8b45f4  MOV EAX,dword ptr [EBP + -0xc]
011d4a16  8945f0  MOV dword ptr [EBP + -0x10],EAX
011d4a19  837df000  CMP dword ptr [EBP + -0x10],0x0
011d4a1d  7409  JZ 0x011d4a28
011d4a1f  8b45f0  MOV EAX,dword ptr [EBP + -0x10]
011d4a22  8b40fc  MOV EAX,dword ptr [EAX + -0x4]
011d4a25  8945f0  MOV dword ptr [EBP + -0x10],EAX
011d4a28  837df000  CMP dword ptr [EBP + -0x10],0x0
011d4a2c  0f9fc0  SETG AL
011d4a2f  8b55fc  MOV EDX,dword ptr [EBP + -0x4]
011d4a32  884235  MOV byte ptr [EDX + 0x35],AL
011d4a35  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a38  80783500  CMP byte ptr [EAX + 0x35],0x0
011d4a3c  7412  JZ 0x011d4a50
011d4a3e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a41  83c038  ADD EAX,0x38
011d4a44  ba484b1d01  MOV EDX,0x11d4b48
011d4a49  e8766923ff  CALL 0x0040b3c4
011d4a4e  eb10  JMP 0x011d4a60
011d4a50  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a53  83c038  ADD EAX,0x38
011d4a56  ba704b1d01  MOV EDX,0x11d4b70
011d4a5b  e8646923ff  CALL 0x0040b3c4
011d4a60  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a63  83c040  ADD EAX,0x40
011d4a66  8b55a8  MOV EDX,dword ptr [EBP + -0x58]
011d4a69  e8566923ff  CALL 0x0040b3c4
011d4a6e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a71  8b55a0  MOV EDX,dword ptr [EBP + -0x60]
011d4a74  89503c  MOV dword ptr [EAX + 0x3c],EDX
011d4a77  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a7a  8b55b0  MOV EDX,dword ptr [EBP + -0x50]
011d4a7d  895044  MOV dword ptr [EAX + 0x44],EDX
011d4a80  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a83  83c048  ADD EAX,0x48
011d4a86  8b55b4  MOV EDX,dword ptr [EBP + -0x4c]
011d4a89  e8366923ff  CALL 0x0040b3c4
011d4a8e  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4a91  8b55c0  MOV EDX,dword ptr [EBP + -0x40]
011d4a94  895050  MOV dword ptr [EAX + 0x50],EDX
011d4a97  8b55c4  MOV EDX,dword ptr [EBP + -0x3c]
011d4a9a  895054  MOV dword ptr [EAX + 0x54],EDX
011d4a9d  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4aa0  8a55c8  MOV DL,byte ptr [EBP + -0x38]
011d4aa3  885058  MOV byte ptr [EAX + 0x58],DL
011d4aa6  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4aa9  8b55cc  MOV EDX,dword ptr [EBP + -0x34]
011d4aac  89505c  MOV dword ptr [EAX + 0x5c],EDX
011d4aaf  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4ab2  83c060  ADD EAX,0x60
011d4ab5  8b55d0  MOV EDX,dword ptr [EBP + -0x30]
011d4ab8  e8076923ff  CALL 0x0040b3c4
011d4abd  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4ac0  83c064  ADD EAX,0x64
011d4ac3  8b55d4  MOV EDX,dword ptr [EBP + -0x2c]
011d4ac6  e8f96823ff  CALL 0x0040b3c4
011d4acb  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4ace  83c068  ADD EAX,0x68
011d4ad1  8b55dc  MOV EDX,dword ptr [EBP + -0x24]
011d4ad4  e8eb6823ff  CALL 0x0040b3c4
011d4ad9  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4adc  83c06c  ADD EAX,0x6c
011d4adf  8b55e0  MOV EDX,dword ptr [EBP + -0x20]
011d4ae2  e8dd6823ff  CALL 0x0040b3c4
011d4ae7  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4aea  83c070  ADD EAX,0x70
011d4aed  8b55e4  MOV EDX,dword ptr [EBP + -0x1c]
011d4af0  e8cf6823ff  CALL 0x0040b3c4
011d4af5  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4af8  83c074  ADD EAX,0x74
011d4afb  8b55d8  MOV EDX,dword ptr [EBP + -0x28]
011d4afe  e8c16823ff  CALL 0x0040b3c4
011d4b03  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4b06  e8edfdffff  CALL 0x011d48f8
011d4b0b  8b45fc  MOV EAX,dword ptr [EBP + -0x4]
011d4b0e  e8c5fdffff  CALL 0x011d48d8
011d4b13  33c0  XOR EAX,EAX
011d4b15  5a  POP EDX
011d4b16  59  POP ECX
011d4b17  59  POP ECX
011d4b18  648910  MOV dword ptr FS:[EAX],EDX
011d4b1b  68384b1d01  PUSH 0x11d4b38
011d4b20  8d4580  LEA EAX,[EBP + -0x80]
011d4b23  8b15a4a11c01  MOV EDX,dword ptr [0x011ca1a4]
011d4b29  e85a8223ff  CALL 0x0040cd88
011d4b2e  58  POP EAX
011d4b2f  ffe0  JMP EAX
