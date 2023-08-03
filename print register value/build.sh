nasm -f elf64 printvalue.asm -o printvalue.o
ld printvalue.o -o printvalue
rm printvalue.o
./printvalue