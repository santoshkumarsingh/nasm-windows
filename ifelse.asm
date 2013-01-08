section .data
x : dd 32
y : dd 50

msg1 : db "X is greater than Y",10,0
msg2 : db "Y is greater than X",10,0

section .bss

section .text
    extern _printf
    global _main

_main:
    ;create stack frame
    push ebp
    mov ebp,esp
    ;if (x>y) msg1 else msg2
    mov eax,DWORD [x]
    mov ebx ,DWORD [y]
    cmp eax,ebx
    jg .xGreaterThanY
    push DWORD msg2
    call _printf
    jmp .done
    
.xGreaterThanY:
    push DWORD msg1
    call _printf
    jmp .done
    
.done:
    
    ;destroy the stack frame
     mov esp,ebp
     pop ebp
     ret
    