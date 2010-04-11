#!/bin/bash
xrandr --output VGA-0 --right-of LVDS --auto; sleep 2
gnome-settings-daemon
gnome-screensaver 2&>/dev/null
( sleep 30; exec system-config-printer-applet 2&>/dev/null ) &
( sleep 4; nm-applet ) &
( sleep 4; gnome-power-manager ) &
( sleep 4; skype ) &
( sleep 4; claws-mail ) &
( sleep 4; keepassx ) &

xset fp+ /home/sigi/.fonts
xset fp rehash

xinput set-prop '"TPPS/2 IBM TrackPoint"' "Evdev Wheel Emulation Button" 2
xinput set-prop '"TPPS/2 IBM TrackPoint"' "Evdev Wheel Emulation" 1

wmname LG3D
exec awesome
