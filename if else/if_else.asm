section .data
   equalString: db "Equal!", 0xa          ; create all the string variables that we will be using for this program here
                                          ; if you do not understand what this code segment is doing then look at the hello world example for full explanation
   equalLength: equ $-equalString

   notEqualString: db "Not Equal!", 0xa
   notEqualLength: equ $-notEqualString

   valueString: db "Value comparing is: "
   valueStringLength: equ $-valueString

section .text
global _start

_start:
   mov eax, 10                            ; move 10 to the eax register, the eax register is a 32 bit register for storing integers
   cmp eax, 10                            ; compare 10 to the current value of the eax register
                                          ; basically cmp is the if keyword of a modern language and the values you are comparing

   je EqualTo                             ; if the eax register is equal to 10, jump to the EqualTo function
   jl NotEqual                            ; if the eax register is less than 10, then jump to the NotEqual function
   jg NotEqual                            ; if the eax register is greater than 10, jump to the NotEqual function
   syscall                                ; after these functions have been done a syscall is required
                                          ; basically these above comparison operators are the actual comparison operators of a modern language

                                          ; other comparison operators include
                                          ; jne for !=
                                          ; jge for >=
                                          ; jle for <=

   mov eax, 19                            ; move a value of 19 to the eax register
   cmp eax, 10                            ; compare the eax value to 10
   je EqualTo                             ; if eax == 10 do the EqualTo function
   jl NotEqual                            ; if eax < 10 do the NotEqual function
   jg NotEqual                            ; if eax > 10 do the NotEqual function
   syscall                                ; required syscall

                                          ; basically we have created a simple modern high level language if else statement and ran it twice with
                                          ; different values. Say you just wanted the if section then you could omit the jl keyword and jg keyword and their values
                                          ; to create a basic if statement

                                          ; due to how functions work in x86, it is recommended that you move the standard exiting of a program
                                          ; to its own function, otherwise you will acquire a segmentation fault error

   call Exit                              ; call the function called "Exit"

EqualTo:
   mov rax, 1                             ; if they are Equal, write out "Equal!" to the console
   mov rdi, 1
   mov rsi, equalString
   mov rdx, equalLength
   syscall

NotEqual:
   mov rax, 1                             ; if they are not equal, write out "Not Equal!" to the console
   mov rdi, 1
   mov rsi, notEqualString
   mov rdx, notEqualLength
   syscall

Exit:                                     ; simple function simplifying the exit of the program to allow it to easily
                                          ; be called in multiple sections
   mov rax, 60
   mov rdi, 0
   syscall