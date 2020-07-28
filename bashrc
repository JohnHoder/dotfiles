# .bashrc

export BASHRC=true

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set JAVA_HOME
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# Create alias for chromeproxy
alias chromeproxy='chromium-browser --proxy-server="localhost:8080"'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# set tty colours.
if [ "$TERM" = "linux" ]; then
    printf "\e]P0000000" # color0
    printf "\e]P19e1828" # color1
    printf "\e]P211b014" # color2
    printf "\e]P3968a38" # color3
    printf "\e]P4a99b3f" # color4
    printf "\e]P5963c59" # color5
    printf "\e]P6418179" # color6
    printf "\e]P7bebebe" # color7
    printf "\e]P8888888" # color8
    printf "\e]P9cf6171" # color9
    printf "\e]PAc5f779" # color10
    printf "\e]PBfff796" # color11
    printf "\e]PC4186be" # color12
    printf "\e]PDcf9ebe" # color13
    printf "\e]PE71bebe" # color14
    printf "\e]PFffffff" # color15
    #clear # removes artefacts but also removes /etc/{issue,motd}
fi

# If shell is not interactive, let zsh come to play
# An interactive shell is one started without non-option arguments
# and without the -c option whose standard input and error are both
# connected to terminals (as determined by isatty(3)), or one
# started with the -i option.

if [[ $- == *i* ]]; then
    export SHELL=zsh
    exec zsh -l
fi

