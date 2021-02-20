#!/bin/bash

# This file (~/.profile), is run exactly once per session -- when you login.
# As it runs after system wide /etc/profile script, the typical thing you want to do in this script is set, or modify, environment variables.
# If you set a shell option or alias in this script, it will not be propagated to a subshell.
# For this reason, do not use .zlogin, .bash_profile, .bash_login, etc.

export PROFILE=true

# Set language environment
export LANG=fr_CH.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US

export EDITOR='vim'

# Set JAVA_HOME
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl":$PATH
PATH=~/bin:$PATH
PATH=/opt/sdk/platform-tools:$PATH
PATH=~/pebble-dev/pebble-sdk-4.4.1-linux64/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/opt/sublime_text_3:$PATH
PATH=/opt/pebble-dev/bin:$PATH

#Don't know why but fr fortunes don't seem to get into path by themselves
PATH=/usr/local/share/games/fortunes:$PATH

export PATH

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

### Print fortune [french] on login shell (add "droit" if you want to see only law related quotes)
[ -x /usr/bin/fortune ] && fortune /usr/local/share/games/fortunes

### Start X on tty1 automatically (without having to type startx)
### And fix sound bug on some machines
if [[ "$(tty)" == '/dev/tty1' && "$EUID" -ne 0 ]]; then
	$(amixer -D pulse sset Master on) > /dev/null 2>&1
	$(startx i3)
	# > /dev/null 2>&1 = no output on the screen
fi
