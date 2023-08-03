section .data
    EmptyLine: db 0xa
section .bss
    value: resb 4
section .text
    global _start

_start:
    mov eax, 9          ; put value of 9 in eax
    add eax, 0x30       ; convert eax to ascii
    mov [value], eax    ; push the eax value to the value variable
    mov eax, value      ; move the value variable to eax

    mov rax, 1          ; write out the value
    mov rdi, 1
    mov rsi, value
    mov rdx, 100
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, EmptyLine
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall