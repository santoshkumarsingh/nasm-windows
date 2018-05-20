section .data

message :db "Hello world",10,0 ;c style string

section .text
    extern _printf
    global _main

_main:
    
    ;create stack
    
    push ebp
    mov ebp,esp
    
    ;push message on stack
    
    push message
    
    ;call c print function
    
    call _printf
    
    
    ;destroy the stack
    
    mov esp,ebp
    pop ebp
    
    ret

