
/workspace/reverse-engineering/input/cprs/CPRSChart.exe:     file format pei-i386


Disassembly of section .text:

00862bfc <.text+0x461bfc>:
  862bfc:	68 1b 2c 86 00       	push   0x862c1b
  862c01:	8d 45 f0             	lea    eax,[ebp-0x10]
  862c04:	e8 cb 83 ba ff       	call   0x40afd4
  862c09:	8d 45 fc             	lea    eax,[ebp-0x4]
  862c0c:	e8 c3 83 ba ff       	call   0x40afd4
  862c11:	58                   	pop    eax
  862c12:	ff e0                	jmp    eax
  862c14:	e9 83 78 ba ff       	jmp    0x40a49c
  862c19:	eb e6                	jmp    0x862c01
  862c1b:	5e                   	pop    esi
  862c1c:	5b                   	pop    ebx
  862c1d:	8b e5                	mov    esp,ebp
  862c1f:	5d                   	pop    ebp
  862c20:	c3                   	ret
