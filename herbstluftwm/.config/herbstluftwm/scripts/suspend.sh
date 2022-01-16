#!/bin/bash
function checkSwap() {
    if test -h /dev/disk/by-label/swap; then
        echo "Swap exists" 
    else
        notify-send "Swap partition not found"
    fi
}
function lock() {
    i3lock -t -i /usr/share/backgrounds/wallpaper_moon.png
}
checkSwap
case $1 in
    suspend)
        lock
        systemctl suspend
        ;;
    hybrid-sleep)
        lock
        systemctl hybrid-sleep
        ;;
    hibernate)
        lock
        systemctl hibernate
        ;;
    poweroff)
        lock
        systemctl -i poweroff
        ;;
    blank)
        xset dpms force off
        ;;
    *)
        #lock
        ;;
esac


