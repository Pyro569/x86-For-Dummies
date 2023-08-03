section .data                          ; define our variables, if you do not understand this look at the "Hello, World!" example
   equal db "Equal", 0xa
   equalLen equ $-equal

   notEqual db "Not Equal!", 0xa
   notEqualLen equ $-notEqual

section .text
   global _start

_start:
   mov eax, 10                         ; set eax as 10
   cmp eax, 10                         ; compare eax value to 10
                                       ; think of this as a modern high level language if and then the input values
   je _Equal                           ; if eax is 11, then run _Equal
   jmp _NotEqual                       ; if eax is not equal to 10, then run _NotEqual

_Equal:
   mov rax, 1
   mov rdi, 1
   mov rdx, equalLen
   mov rsi, equal
   syscall
   jmp _Exit

_NotEqual:
   mov rax, 1
   mov rdi, 1
   mov rdx, notEqualLen
   mov rsi, notEqual
   syscall

_Exit:
   mov rax, 60
   mov rdi, 0
   syscall