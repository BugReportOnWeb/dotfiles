function comp_check
    set EXT (echo $argv | cut -d. -f2)

    switch $EXT
        case c
            mkdir c_dir && mv $argv c_dir && cd c_dir
            gcc $argv && ./a.out
        case cpp
            mkdir cpp_dir && mv $argv cpp_dir && cd cpp_dir
            g++ $argv && ./a.out
        case asm
            mkdir asm_dir && mv $argv asm_dir && cd asm_dir
            nasm -f elf32 $argv && ld -m elf_i386 (echo $argv | cut -d. -f1).o && ./a.out
        case '*'
            return 1
    end
end
