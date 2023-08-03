section .data
    equalString: db "Equal!", 0xa
    equalLen: equ $-equalString

    notEqualString: db "Not Equal!", 0xa
    notEqualLen: equ $-notEqualString

section .text
global _start

_start:
    mov esi, 9          ; set esi register as 9
    mov eax, 3          ; set eax register as 3
    div esi             ; divide esi
                        ; the div keyword divides eax by the register you state and then sets edx to the quotient of the two
    cmp edx, 3          ; compare edx register to number 3
    je _Equal           ; if esi register is 3 run _Equal
    jmp _NotEqual       ; if esi register is not 3 run _NotEqual

_Equal:
    mov rax, 1                                                 
    mov rdi, 1
    mov rsi, equalString
    mov rdx, equalLen
    syscall
    jmp _Exit

_NotEqual:
    mov rax, 1
    mov rdi, 1
    mov rsi, notEqualString
    mov rdx, notEqualLen
    syscall
    jmp _Exit

_Exit:
    mov rax, 60
    mov rdi, 0
    syscall