section .data
    fizzString: db "Fizz!", 0xa
    fizzLen: equ $-fizzString

    notFizzString: db "Not Fizz!", 0xa
    notFizzLen: equ $-notFizzString

section .text
global _start

_start:
    mov esi, 9          ; set esi register as 9
    mov eax, 3          ; set eax register as 3
    div esi             ; to get a modulus divide the register you want, it will divide eax by the register you state and set edx as the remainder
    cmp eax, 0          ; compare edx register to number 0
    je _Fizz            ; if esi register is 0 run _Equal
    jmp _NotFizz        ; if esi register is not 0 run _NotEqual

_Fizz:
    mov rax, 1                                                 
    mov rdi, 1
    mov rsi, fizzString
    mov rdx, fizzLen
    syscall
    jmp _Exit

_NotFizz:
    mov rax, 1
    mov rdi, 1
    mov rsi, notFizzString
    mov rdx, notFizzLen
    syscall
    jmp _Exit

_Exit:
    mov rax, 60
    mov rdi, 0
    syscall