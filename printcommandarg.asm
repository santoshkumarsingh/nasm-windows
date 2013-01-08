section .data

msg :db "Arg=%s",10,0
argCount :db "Count=%d",10,0

section .text
extern _printf
global _main
;int main(int numarg,char * arg[])
_main:
    push ebp
    mov ebp,esp
    
    mov eax,DWORD[ebp+8] ;numarg
    mov ebx ,DWORD [ebp+12];char*
    mov ecx,0
beginLoop:
    
    push ebx
    push eax
    push ecx
    ;call printf
    push DWORD [ebx]
    push msg
    call _printf
    add esp,8 ;clean up the stack
    
    
    
    
    pop ecx
    pop eax
    pop ebx
    
    inc ecx
    add ebx,4 ;
    
    cmp ecx,eax
    jne beginLoop
    
    mov esp,ebp
    pop ebp
    ret
    
    