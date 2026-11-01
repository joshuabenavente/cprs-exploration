
/workspace/reverse-engineering/input/cprs/CPRSChart.exe:     file format pei-i386


Disassembly of section .text:

00a0c793 <.text+0x60b793>:
  a0c793:	33 c0                	xor    eax,eax
  a0c795:	5a                   	pop    edx
  a0c796:	59                   	pop    ecx
  a0c797:	59                   	pop    ecx
  a0c798:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  a0c79b:	68 bf c7 a0 00       	push   0xa0c7bf
  a0c7a0:	8d 45 e4             	lea    eax,[ebp-0x1c]
  a0c7a3:	ba 02 00 00 00       	mov    edx,0x2
  a0c7a8:	e8 87 e8 9f ff       	call   0x40b034
  a0c7ad:	8d 45 fc             	lea    eax,[ebp-0x4]
  a0c7b0:	e8 1f e8 9f ff       	call   0x40afd4
  a0c7b5:	58                   	pop    eax
  a0c7b6:	ff e0                	jmp    eax
  a0c7b8:	e9 df dc 9f ff       	jmp    0x40a49c
  a0c7bd:	eb e1                	jmp    0xa0c7a0
  a0c7bf:	5f                   	pop    edi
  a0c7c0:	5e                   	pop    esi
  a0c7c1:	5b                   	pop    ebx
  a0c7c2:	8b e5                	mov    esp,ebp
  a0c7c4:	5d                   	pop    ebp
  a0c7c5:	c3                   	ret
