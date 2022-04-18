function comp_check
    set EXT (echo $argv | cut -d. -f2)

    switch $EXT
        case c
            if test -d ../c_dir
                gcc $argv && ./a.out
            else
                mkdir c_dir && mv $argv c_dir && cd c_dir
                gcc $argv && ./a.out
            end
        case cpp
            if test -d ../cpp_dir
                g++ $argv && ./a.out
            else
                mkdir cpp_dir && mv $argv cpp_dir && cd cpp_dir
                g++ $argv && ./a.out
            end
        case asm
            if test -d ../asm_dir
                nasm -f elf32 $argv && ld -m elf_i386 (echo $argv | cut -d. -f1).o && ./a.out
            else
                mkdir asm_dir && mv $argv asm_dir && cd asm_dir
                nasm -f elf32 $argv && ld -m elf_i386 (echo $argv | cut -d. -f1).o && ./a.out
            end
        case '*'
            return 1
    end
end
