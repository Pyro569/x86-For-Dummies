nasm -f elf64 addition.asm -o addition.o
ld addition.o -o addition
rm addition.o
./addition