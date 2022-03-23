function start_iwd
    systemctl | grep -qi iwd

    if test $status = 0
        iwctl 
    else
        echo -e "Want to start IWD (Y/n): "; read OPTION
    
        if test $OPTION = 'Y'; or test $OPTION = 'y'
            sudo systemctl start iwd && iwctl
        else
            return 0;
        end
    end 

end
