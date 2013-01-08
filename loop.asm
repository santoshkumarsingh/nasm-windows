section .data

msg : db "Num=%d",10,0

section .text

extern _printf
global _main

_main:
    
    push ebp
    mov ebp,esp
    mov ebx,10
    
loop:
    push ebx ;first parameter
    push msg ;second parameter
    call _printf ;call inbuilt printf function for outputting
    dec ebx ;decrement the value of ebx by +1
    jnz loop ;if not equal to zero got to loop
       
    pop ebp
    mov esp,ebp
    ret
    