nasm -f elf64 division.asm -o division.o
ld division.o -o division
rm division.o
./division