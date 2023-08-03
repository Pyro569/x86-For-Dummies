section .data
    equalString: db "Equal!", 0xa
    equalLen: equ $-equalString

    notEqualString: db "Not Equal!", 0xa
    notEqualLen: equ $-notEqualString

section .text
global _start

_start:
    mov esi, 7          ; set esi register as 7
    sub esi, 6          ; subtract 6 from the esi register
    cmp esi, 1          ; compare esi register to number 1
    je _Equal           ; if esi register is 1 run _Equal
    jmp _NotEqual       ; if esi register is not 1 run _NotEqual

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