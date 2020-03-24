# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

