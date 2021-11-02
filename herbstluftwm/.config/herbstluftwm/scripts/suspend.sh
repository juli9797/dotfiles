#!/bin/bash
i3lock -t -i /usr/share/backgrounds/wallpaper_moon.png
case $1 in
    suspend)
        systemctl suspend
        ;;
    hybrid-sleep)
        systemctl hybrid-sleep
        ;;
    hibernate)
        systemctl hibernate
        ;;
    poweroff)
        systemctl -i poweroff
        ;;
    *)
        #lock
        ;;
esac

