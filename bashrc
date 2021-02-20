#!/bin/bash

# Typically bash is compiled to source the .bashrc file on non-login, non-interactive ssh sessions. This feature is enabled by all major Linux distributions.
# .bashrc is so-called $ENV file (like .kshrc, .kshenv or .aliases).
# It gets executed upon each non-interactive invocation of the shell. Thus usually not upon running interactive shell (RHEL does so, though).

# For DEBUG purposes
export BASHRC=true

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If shell is interactive, let zsh come to play
# An interactive shell is one started without non-option arguments
# and without the -c option whose standard input and error are both
# connected to terminals (as determined by isatty(3)), or one
# started with the -i option.

if [[ $- == *i* ]]; then
    #echo "Interactive"
    export SHELL=zsh
    exec zsh -l
fi

