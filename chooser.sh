#!/bin/bash
# Created May 2015. Last update 2015-05-28 j.fallon@linux.com
echo -e "\E[0;30m""GNU Screen Session Chooser" #Greeter
tput sgr0 # Reset prompt text color

#Menu
PS3='choose a session: '
options=("Empty (Default)" "Reconnect" "No Screen" "TeX Development Environment" "Miscellaneous Development Environment" "SSH split with pi@192.168.1.4" "pacaur -Syu" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Empty (Default)")
			screen  # new screen instance
            ;;
        "Reconnect")
			screen -R # if possible, reconnect to an existing session
            ;;
        "No Screen")
			$SHELL # start the user's shell
            ;;
	# Custom start files
        "TeX Development Environment")
			screen -c /home/fallon/bin/screen-conf/TeX 
            ;;
        "Miscellaneous Development Environment")
			screen -c /home/fallon/bin/screen-conf/misc
            ;;
        "SSH split with pi@192.168.1.4")
			screen -c /home/fallon/bin/screen-conf/ssh-pi
            ;;
		"pacaur -Syu")
			screen -c /home/fallon/bin/screen-conf/screen-pacsyu
			;;
	# Close the terminal
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
