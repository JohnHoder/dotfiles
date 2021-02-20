#!/bin/bash

# This file (.xinitrc) is run with startx
# If startx has no parameter, LXSESSION will be set to i3

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

export XINITRC=true

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

#include sbin in PATH
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

# xinitrc-common should normally exist on fedora, so the elifs' content will be skipped
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
