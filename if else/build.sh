nasm -f elf64 if_else.asm -o if_else.o
ld if_else.o -o if_else
rm if_else.o
./if_else