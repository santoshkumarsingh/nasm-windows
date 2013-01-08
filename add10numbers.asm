section .data
num1: dd 10, 20, 30, 40, 50, 10, 20, 30, 40, 50,300
total: dd 0
msg :  dd "sum=%d",10,0

section .text
    extern _printf
    global _main
_main:
    push ebp
    mov ebp,esp
    mov ebx,num1  ;point bx to first number
    mov ecx,11     ;load count of numbers in ecx
    mov eax,0       ;initialize sum to zero
loop:
    add eax,[ebx]
    add ebx,4
    sub ecx,1
    jnz loop
    mov  [total],eax
    push dword [total]
    
    push msg
    call _printf
    mov esp,ebp
    pop ebp
    
    ret