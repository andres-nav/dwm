#!/usr/bin/sh

setxkbmap -option ctrl:swap_lalt_lctl
setxkbmap -option caps:swapescape

( xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1 ) &
( xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Middle Emulation Enabled" 1 ) &

( unclutter -grab ) &

( killall megasync ; sleep 1 ; megasync ) &
( killall dwmblocks ; sleep 1 ; dwmblocks ) &

exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) /usr/local/bin/dwm
