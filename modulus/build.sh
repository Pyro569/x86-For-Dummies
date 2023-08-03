nasm -f elf64 modulus.asm -o modulus.o
ld modulus.o -o modulus
rm modulus.o
./modulus