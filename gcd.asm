section .data
a : dd 33
b : dd 11
msg : dd "GCD=%d"

section .text
extern _printf
global _main

;gcd(int a, int b)
_main:
        push ebp
        mov ebp, esp
 

	mov eax ,dword [a]
	mov ebx,dword [b]
CONTD:
	cmp eax,0
	je L1
	cmp eax,ebx
	jge modulo
	xchg eax,ebx
modulo:
	cdq
	idiv ebx
	mov eax,edx
	jmp CONTD
L1:
	mov eax,ebx
	push eax
	push msg
	call _printf
	mov esp,ebp
	pop ebp
	ret
	
	
	
	
	