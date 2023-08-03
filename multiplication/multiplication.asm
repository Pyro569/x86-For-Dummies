section .data
    equalString: db "Equal!", 0xa
    equalLen: equ $-equalString

    notEqualString: db "Not Equal!", 0xa
    notEqualLen: equ $-notEqualString

section .text
global _start

_start:
    mov esi, 3          ; set esi register as 3
    mov eax, 3          ; set eax register as 3
    mul esi             ; multiply esi
                        ; the mul keyword multiplies the register you state by the value of eax and then sets eax to the product of the two
    cmp eax, 9          ; compare eax register to number 9
    je _Equal           ; if esi register is 9 run _Equal
    jmp _NotEqual       ; if esi register is not 9 run _NotEqual

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