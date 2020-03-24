#!/bin/bash

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

echo "XINITRC executed."

# use bash for "exec -l", howto run login shell by /bin/sh ?
# if startx has an argument, then make it LXSESSION
if [ $# -eq 1 -a -n "$1" ]; then
	LXSESSION=$1
else
# default session
	LXSESSION=/usr/bin/i3
fi

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# xinitrc-common should noramlly exist on fedora, so the elifs' content will be skipped
# Execute LXSESSION (i3)
if [ -f /etc/X11/xinit/xinitrc-common ]; then
# fedora
	. /etc/X11/xinit/xinitrc-common
	exec $SSH_AGENT /bin/sh -c "exec -l bash -c \"$LXSESSION\""
elif [ -x /etc/X11/xinit/Xsession ]; then
# fedora
	exec $SSH_AGENT /bin/sh -c "exec /etc/X11/xinit/Xsession \"$LXSESSION\""
elif [ -x /etc/X11/Xsession ]; then
# mandriva, debian, ubuntu
	exec $SSH_AGENT /bin/sh -c "exec /etc/X11/Xsession \"$LXSESSION\""
elif [ -x /etc/X11/xinit/xinitrc ]; then
#suse
	export WINDOWMANAGER=$LXSESSION
	exec $SSH_AGENT /bin/sh -c "exec -l bash -c /etc/X11/xinit/xinitrc"
else
# unknown, user should custom /etc/lxdm/xinitrc self
	if [ -x /etc/lxdm/xinitrc ]; then
		. /etc/lxdm/xinitrc "$LXSESSION"
	fi
	if [ -d /etc/X11/xinit/xinitrc.d ] ; then
		for f in /etc/X11/xinit/xinitrc.d/* ; do
			[ -x "$f" ] && . "$f"
		done
		unset f
	fi

	if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS";
	then
		eval "$(dbus-launch --sh-syntax --exit-with-session)"
	fi

	exec $SSH_AGENT /bin/sh -c "exec -l bash -c \"$LXSESSION\""
fi


# include sbin in PATH
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# set tty colours.
if [ "$TERM" = "linux" ]; then
    printf "\e]P0000000" # color0
    printf "\e]P19e1828" # color1
    printf "\e]P2aece92" # color2
    printf "\e]P3968a38" # color3
    printf "\e]P4414171" # color4
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
#   clear # removes artefacts but also removes /etc/{issue,motd}
fi