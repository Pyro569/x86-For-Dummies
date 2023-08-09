nasm -f elf64 forloop.asm -o forloop.o
ld forloop.o -o forloop
rm forloop.o
./forloop