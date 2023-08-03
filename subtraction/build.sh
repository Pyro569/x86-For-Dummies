nasm -f elf64 subtraction.asm -o subtraction.o
ld subtraction.o -o subtraction
rm subtraction.o
./subtraction