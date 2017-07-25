# vim:ft=zsh:
#
# Final init script executed on login shell - in essence late .zprofile
#

## Print fortune on login shell
[ -x /usr/bin/fortune ] && fortune -s

# start X, if not already running
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
echo &>/dev/null

