;an equivalent program to this in assembly
SECTION .data

operChar: db '+',0
msg: db 'Math: %d %c %d = %d',10,0

SECTION .text
;allow access to printf
extern _printf
;make our main available externally
global _main

_main:    ;int main(int numArguments, char* arg[])
     push ebp
     mov ebp , esp
    sub esp, 4    ;reserve space for a 32 bit variable[4 byes= 8*4=32]

    ;set up the register what will hold the values we want to operate on
    mov eax , 8
    mov edx , 4
    
    push eax    ;save value of eax; so msg can be displayed correctly
    add eax, edx ;translates to eax = eax + edx
    mov ecx, eax    ;mov result into ecx
    pop eax     ;restore value of eax 

    ;recall that printf tooks like
    ;printf(msg,eax,operChar,edx,result)
    push ecx    ;temporary- we will get the value using assembly, for now just bare with me
    push edx
    push DWORD [operChar]
    push eax
    push msg
    call _printf
    add esp, 20     ;this cleans up the stack; we pushed 5 things unto the stack each of 4 bytes long = 5*4


     mov esp, ebp
     pop ebp
     ret