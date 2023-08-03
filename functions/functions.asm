section .data
   functionString: db "This is called from a function!", 0xa    ; create all the string variables that we will be using for this program here
                                                                ; if you do not understand what this code segment is doing then look at the hello 
                                                                ; world example for full explanation
   functionStringLen: equ $-functionString

section .text
global _start

_start:
    call Print                                                  ; call a function called Print
    syscall                                                     ; mandatory syscall

    call Exit                                                   ; call a function called Exit
                                                                ; if you have created a function in x86 then you must create a function to exit as well
                                                                ; that you will call in order to avoid getting a segmentation fault error

Print:                                                          ; define a function called "Print"
    mov rax, 1                                                  ; write out "This is called from a function!" to the console
    mov rdi, 1
    mov rsi, functionString
    mov rdx, functionStringLen
    syscall
Exit:                                                           ; create a function called Exit
    mov rax, 60                                                 ; these last three lines are just requirements in x86 code to exit a program without 
                                                                ; a segmentation fault error
    mov rdi, 0
    syscall