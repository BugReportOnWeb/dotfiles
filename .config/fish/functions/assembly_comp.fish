function assembly_comp
    set NAME (echo $argv | cut -d. -f1)
    set EXT (echo $argv | cut -d. -f2)
    set OUTPUT "$NAME.o"

    if test $EXT = "asm"
        nasm -f elf32 $argv -o $OUTPUT && ld -m elf_i386 $OUTPUT -o ../main/$NAME && ../main/$NAME || echo "Error occured!"
    else
        echo "[*.asm] acceptable argument"
        return 1
    end
end

