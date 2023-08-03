nasm -f elf64 functions.asm -o functions.o
ld functions.o -o functions
rm functions.o
./functions