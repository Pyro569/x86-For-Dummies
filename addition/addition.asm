section .data
    equalString: db "Equal!", 0xa
    equalLen: equ $-equalString

    notEqualString: db "Not Equal!", 0xa
    notEqualLen: equ $-notEqualString

section .text
global _start

_start:
    mov esi, 7          ; set esi register as 7
    add esi, 7          ; add 7 to the esi register
    cmp esi, 15         ; compare esi register to number 14
    je _Equal           ; if esi register is 14 run _Equal
    jmp _NotEqual       ; if esi register is not 14 run _NotEqual

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