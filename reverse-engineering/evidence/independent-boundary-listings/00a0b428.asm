
/workspace/reverse-engineering/input/cprs/CPRSChart.exe:     file format pei-i386


Disassembly of section .text:

00a0b428 <.text+0x60a428>:
  a0b428:	33 c0                	xor    eax,eax
  a0b42a:	5a                   	pop    edx
  a0b42b:	59                   	pop    ecx
  a0b42c:	59                   	pop    ecx
  a0b42d:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  a0b430:	68 47 b4 a0 00       	push   0xa0b447
  a0b435:	8d 45 fc             	lea    eax,[ebp-0x4]
  a0b438:	e8 97 fb 9f ff       	call   0x40afd4
  a0b43d:	58                   	pop    eax
  a0b43e:	ff e0                	jmp    eax
  a0b440:	e9 57 f0 9f ff       	jmp    0x40a49c
  a0b445:	eb ee                	jmp    0xa0b435
  a0b447:	8b c3                	mov    eax,ebx
  a0b449:	5b                   	pop    ebx
  a0b44a:	8b e5                	mov    esp,ebp
  a0b44c:	5d                   	pop    ebp
  a0b44d:	c3                   	ret
