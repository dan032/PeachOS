build:
	nasm -f bin ./boot.asm -o ./boot.bin
	dd if=./message.txt >> ./boot.bin
	dd if=/dev/zero bs=512 count=1 >> ./boot.bin

start:
	qemu-system-x86_64 -hda ./boot.bin

all:
	make build
	make start