nasm -f elf64 multiplication.asm -o multiplication.o
ld multiplication.o -o multiplication
rm multiplication.o
./multiplication