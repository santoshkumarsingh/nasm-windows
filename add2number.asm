section .data
    
    msg : db "Sum=%d",10,0


section .text
    extern _printf
    global _main

_main:
    ;create stack
    push ebp
    mov esp,ebp
    ;store first value in eax register
    mov eax,45
    ;add second value in eax and store the value in eax
    add eax,45
    
    push eax
    
    push msg
    
    call _printf
    
    pop ebp
    
    mov esp,ebp
    
    ret
    
    
    
