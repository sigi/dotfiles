#!/bin/bash

gnome-settings-daemon &
# /usr/lib/gnome-volume-manager/gnome-volume-manager

xscreensaver &

# urxvtd -q -f -o &

# (mpd && remuco-mpd) & 

# gdlinux

( while [ -z `pidof awesome` ]; do sleep 0.2; done; sleep 0.5
  nm-applet &
  gnome-power-manager &
  system-config-printer-applet &
  claws-mail &
  keepassx & ) &
#  bluetooth-applet & ) &

gpg-agent --enable-ssh-support --daemon \
  --write-env-file ${HOME}/.gpg-agent-info "$@"

xset fp+ /home/sigi/.fonts; xset fp rehash
xset b off
xset b 0 0 0

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1

# gem server 2&>/dev/null

# wmname LG3D
exec awesome
# exec icewm
