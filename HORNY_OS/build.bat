python src/boot/bin/Gener_bin.py


..\bin\bash --login -c 'cd ../../HORNY_OS; nasm -fbin src/boot/boot.asm -o src/boot/boot.bin; dd if=/dev/zero of=src/boot/boot.img bs=1024 count=1440; dd if=src/boot/boot.bin of=src/boot/boot.img conv=notrunc; dd if=src/boot/bin/binary.bin of=src/boot/boot.img conv=notrunc seek=1; gcc -m32 -ffunction-sections -c -o src/boot/kernel.o src/boot/kernel.c; ld -m i386pe -o src/boot/kernel.tmp -Ttext 0x20200 src/boot/kernel.o; objcopy -I pe-i386 -O binary src/boot/kernel.tmp src/boot/kernel.bin; dd if=src/boot/kernel.bin of=src/boot/boot.img conv=notrunc seek=1; bochs -f os.bxrc -q; rm src/boot/boot.bin; rm src/boot/boot.img; rm src/boot/kernel.bin; rm src/boot/kernel.o; rm src/boot/kernel.tmp'

pause