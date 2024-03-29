if status is-interactive
    set fish_greeting                                               # Supresses fish's intro message
    #figlet -t "$USER @ $hostname" | lolcat                          # My loginame and hostname just to let the fam know
    #echo "----------------------------------------------" | lolcat  # Breaks the line piped to lolcat (just colorful)
    fortune | cowsay -e ^^; echo ""                                 # Run fortune and pipe it to cowsay
    #pfetch                                                         # Run neofetch when term starts 
    
    # Set either default Emacs mode of vi mode
    function fish_user_key_bindings
        # fish_default_key_bindings
        # fish_vi_key_bindings
    end

    fish_vi_cursor

    # ALIASES #
    alias update='sudo pacman -Syu && yay -Sua'
    alias fs='file_size'
    alias mkf='make_file'
    alias nfetch='neofetch'
    alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' 
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    alias asm='assembly_comp'
    alias nctl='start_iwd'
    alias wiki='vim -c VimwikiIndex'
    alias todo='vim ~/vimwiki/Tasks.wiki'
    alias mix='pulsemixer'
    alias sl='sl | lolcat'
    alias out='comp_check'
    alias gitcp='pass -c GitHub/token'
    alias class='~/Development/shellscripting/auto/main.sh'
    alias clr='. /usr/local/bin/clear_react'

    set -gx EDITOR nvim
    set --export PATH $HOME/.cargo/bin $PATH
end

