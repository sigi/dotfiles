#!/bin/bash

gnome-settings-daemon
xscreensaver -nosplash &

xrandr --output VGA-0 --right-of LVDS --auto; sleep 2

#( sleep 30; exec system-config-printer-applet 2&>/dev/null ) &
( while [ -z `pidof awesome` ]; do sleep 0.2; done; sleep 0.5
  nm-applet & gnome-power-manager & system-config-printer-applet & skype & claws-mail & keepassx & ) &

xset fp+ /home/sigi/.fonts; xset fp rehash

xinput set-prop '"TPPS/2 IBM TrackPoint"' "Evdev Wheel Emulation Button" 2
xinput set-prop '"TPPS/2 IBM TrackPoint"' "Evdev Wheel Emulation" 1

wmname LG3D; exec awesome
