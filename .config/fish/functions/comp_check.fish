function comp_check
    set EXT (echo $argv | cut -d. -f2)

    switch $EXT
        case c
            gcc $argv && ./a.out
        case cpp
            g++ $argv && ./a.out
        case asm
            nasm -f elf32 $argv && ld -m elf_i386 (echo $argv | cut -d. -f1).o && ./a.out
        case '*'
            return 1
    end
end
