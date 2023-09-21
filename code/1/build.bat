
:: подгружаем бокс и насм в сигвин
move ..\..\..\Bochs-2.7\bochs.exe ..\..\..\bin
move ..\..\..\NASM\nasm.exe ..\..\..\bin


:: по хорошему эти пути вынести в переменные выглядеть это будет так
:: set /p PATH=enter the path:
:: echo your path: %PATH%
:: но это заебаться можно каждый запуск 


..\..\..\bin\bash --login -c 'cd ..; cd code; cd 1; nasm -fbin boot.asm -o boot.bin; dd if=/dev/zero of=boot.img bs=1024 count=1440; dd if=boot.bin of=boot.img conv=notrunc; bochs -f os.bxrc -q; rm boot.bin boot.img'

:: честно не пасу че за флаг логин без него не заводится
:: -с для передачи команд сигвину

pause

exit
