#!/bin/bash
xrandr --output VGA-0 --right-of LVDS --auto; sleep 2
/usr/lib/gnome-settings-daemon/gnome-settings-daemon
/usr/lib/gnome-session/helpers/gnome-settings-daemon-helper
( sleep 30; exec system-config-printer-applet 2&>/dev/null ) &
( gnome-keyring-daemon --start; sleep 5; nm-applet --sm-disable ) &
( sleep 5; gnome-power-manager ) &
( sleep 5; skype ) & 
( sleep 5; claws-mail ) &
( sleep 5; keepassx ) &

xset fp+ /home/sigi/.fonts
xset fp rehash

wmname LG3D
#xkbcomp /home/sigi/.config/typematrix.xkb :0.0 2>/dev/null
exec awesome
