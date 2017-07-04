#!/bin/bash

# shell script to prepend i3status with more stuff

i3status --config ~/.config/i3status/config | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')
    if [ $LG == "cz" ]
    then
        dat="[{ \"full_text\": \"KB: $LG\", \"color\":\"#cc33ff\" },"
    elif [ $LG == "de" ]
    then
	dat="[{ \"full_text\": \"KB: $LG\", \"color\":\"#ffffcc\" },"
    else
        dat="[{ \"full_text\": \"KB: $LG\", \"color\":\"#006699\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
