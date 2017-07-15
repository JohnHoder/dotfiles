#!/usr/bin/env python3
# coding: utf-8

from sys import argv
import dbus

def get_curr_state():
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = kbd_backlight.GetBrightness()
    return current


def kb_light_set(delta):
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = kbd_backlight.GetBrightness()
    maximum = kbd_backlight.GetMaxBrightness()-1
    new = max(0, current + delta)

    print(current, maximum,new)

    if new >= 0 and new <= maximum:
        current = new
        kbd_backlight.SetBrightness(current)

    # Return current backlight level percentage
    return current / maximum * 100 

if __name__ == '__main__':
    if len(argv[1:]) == 0:
        if get_curr_state() == 1:
            print("true")
            print(kb_light_set(-1))
        else:
            print("false")
            print(kb_light_set(1))
    elif len(argv[1:]) == 1:
        if argv[1] == "--up" or argv[1] == "+":
            # ./kb-light.py (+|--up) to increment
            print(kb_light_set(1))
        elif argv[1] == "--down" or argv[1] == "-":
            # ./kb-light.py (-|--down) to decrement
            print(kb_light_set(-1))
        else:
            print("Unknown argument:", argv[1])
    else:
        print("Script takes exactly one argument.", len(argv[1:]), "arguments provided.")

