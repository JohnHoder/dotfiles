#!/bin/bash

if [[ $(xrandr | grep '\Wconnected' | awk '{ print $1 }' | wc -l) == "1" ]]; then
    xrandr --output HDMI1 --off
    xrandr --output VGA1 --off
    echo "Single monitor mode"
fi

# Set lvds variable
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ $output =~ ^LVDS.*$ ]]; then
        lvds=$output
    fi
done

# Set-up all the monitors
counter=0
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ ^LVDS.*$ ]]; then
        echo $output
        if [ "${counter}" -eq "0" ]; then
            #echo $counter
            #xrandr --output $lvds --auto --output $output --pos 0x0 --auto --right-of $lvds --primary
            xrandr --output $output --auto --right-of $lvds --primary
        elif [ "${counter}" -eq "1" ]; then
            xrandr --output $output --auto --left-of $lvds
            #echo $counter
	fi
        counter=$((counter+1))
    fi
done

#killall -SIGUSR1 conky
if [[ $(ps -o etimes= -p "`pgrep -o -x conky`") -gt 7 ]]; then
    killall -SIGUSR1 conky
fi
