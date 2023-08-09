section .data
    String: db "Value += 1", 0xa
    StringLen: equ $-String
section .text
    global _start

_start:
    cmp eax, 9
    jle PrintNumber

    mov rax, 60
    mov rdi, 0
    syscall

Print:
    mov rax, 1          
    mov rdi, 1
    mov rsi, String
    mov rdx, StringLen
    syscall

    inc eax
    jmp _start