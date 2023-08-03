section .data
    EmptyLine: db 0xa
section .bss
    value: resb 4
section .text
    global _start

_start:
    mov eax, 48         ; move 48 to the eax register
    mov [value], eax    ; assign the eax register to the value pointer
    mov eax, [value]    ; assign the value pointer to the eax register

                        ; the code 48 prints out 0, but if you want to print out a larger number, say 12, you would need to run the
                        ; print two seperate times, once using 48 in the register, and then the second time using 49 in the register

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