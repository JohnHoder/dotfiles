#!/bin/bash

activeworkspace=$(i3-msg -t get_workspaces | jq -c '.[] | select(.focused) | .name' --raw-output)
firefox &
windowname=firefox
xprop -spy -root _NET_ACTIVE_WINDOW | \
	while read line ; do 
		if xprop WM_CLASS -id ${line##* } | grep -q $windowname ; then
			i3-msg move "[con_id=\"${line##* }\"]" $activeworkspace
			exit
		fi
	done
