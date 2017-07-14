#!/bin/bash
if [[ $(xrandr | grep '\Wconnected' | awk '{ print $1 }' | wc -l) == "1" ]]; then
    xrandr --output HDMI1 --off
    xrandr --output VGA1 --off
    echo yessir
fi
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ $output =~ ^LVDS.*$ ]]; then
            lvds=$output
    fi
done
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ ^LVDS.*$ ]]; then
       #xrandr --output $lvds --auto --output $output --pos 0x0 --auto --right-of $lvds --primary
       xrandr --output $output --auto --left-of $lvds
    fi
done
