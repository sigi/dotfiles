#!/bin/bash
gnome-keyring-daemon --start &
/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
/usr/lib/gnome-session/helpers/gnome-settings-daemon-helper &
nm-applet --sm-disable &
gnome-power-manager &
( sleep 30; exec system-config-printer-applet 2&>/dev/null ) &
skype &
claws-mail &
keepassx &

wmname LG3D
#xkbcomp /home/sigi/.config/typematrix.xkb :0.0 2>/dev/null
xrandr --output VGA-0 --right-of LVDS --auto
exec awesome
