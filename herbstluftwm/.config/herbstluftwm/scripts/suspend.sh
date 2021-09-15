#!/bin/bash

i3lock -t -i Pictures/wallpaper_moon.png
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

