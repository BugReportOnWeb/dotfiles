if status is-interactive
    set fish_greeting                                               # Supresses fish's intro message
    figlet -t "$USER @ $hostname" | lolcat                          # My loginame and hostname just to let the fam know
    echo "----------------------------------------------" | lolcat  # Breaks the line piped to lolcat (just colorful)
    fortune | cowsay -e ^^; echo ""                                 # Run fortune and pipe it to cowsay
    #pfetch                                                         # Run neofetch when term starts 
    
    # Set either default Emacs mode of vi mode
    function fish_user_key_bindings
        fish_default_key_bindings
        # fish_vi_key_bindings
    end

    # ALIASES #
    alias update='sudo pacman -Syu && yay -Sua'
    alias fs='file_size'
    alias mkf='make_file'
    # alias fs='function fs; set file_size (du -h $argv | awk \'{print $1}\' | sed \'s/\.[0-9]//g\'); set file_name (du -h $argv | awk \'{print $2}\'); echo $file_name is of $file_size; end; fs'
    alias nfetch='neofetch'
    alias vim='nvim'
    alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' 
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    set -gx EDITOR vim
end

