function file_size
    set arg_size (du -h $argv | awk '{print $1}' | sed 's/\.[0-9]//g')
    set arg_name (du -h $argv | awk '{print $2}')

    echo -e "$arg_name is of $arg_size"
end

