section .data
   helloString: db "Hello, World!", 0xa   ; this is a simple string type variable with the value "Hello, World!" with a new line at the end
                                          ; 0xa stands for new line
   helloLen: equ $-helloString            ; the length of the variable helloLen equals where the current cursor position is minus helloString length
                                          ; basically this gets the number of bytes in length that helloString is

                                          ; another way of achieving this without creating the helloLen variable is
                                          
                                          ; section .data
                                          ; helloString: db "Hello, World!", 0xa, 14

                                          ; the above way of achieving this is by creating a string with the value "Hello, World!", with a new line at the end
                                          ; and then with a length of 14 bytes including the newline character

section .text                             ; section .text is basically just signalling this is where the code starts
global _start                             ; global _start makes the _start function a global function meaning it can be accessed in other files

_start:                                   ; _start is the x86 equivalent of your standard java public static void main(String[] args){}
   mov rax, 1                             ; moves a value of 1 to the rax register, on linux based systems this means console output
   mov rdi, 1                             ; move value of 1 to the rdi register (frankly i'm not quite aware of what this call is doing, just know it is required for
                                          ; console output)
   mov rsi, helloString                   ; moves the helloString to the rsi register signalling that we want to write the helloString value
   mov rdx, helloLen                      ; moves the value helloLen (in this case the length of helloString in bytes) to the rdx register signalling
                                          ; that we want to write that amount of bytes (14 in this case)
   syscall                                ; syscall just calls any code that has been listed above

   mov rax, 60                             ; these last three lines are just requirements in x86 code to exit a program without a segmentation fault error
   mov rdi, 0
   syscall