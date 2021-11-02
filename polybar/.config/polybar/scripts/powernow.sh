#!/bin/bash
online=$(cat /sys/class/power_supply/AC/online)
case $online in
    0)
        power=$(cat /sys/class/power_supply/BAT0/power_now)
        powerW=$(expr $power / 1000)
        echo $powerW
        ;;
    *)
        echo ""
        ;;
esac


