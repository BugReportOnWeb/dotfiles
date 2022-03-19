function make_file
    dd if=/dev/zero of=$argv[1] count=$argv[2] bs=1M 2> /dev/null
end
