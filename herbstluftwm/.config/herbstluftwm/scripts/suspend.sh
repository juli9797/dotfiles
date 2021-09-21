#!/bin/bash
i3lock -t -i /usr/share/backgrounds/wallpaper_moon.png
case $1 in
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate 
        ;;
    *)
        #lock
        
        ;;
esac

