#!/bin/bash
vol=""
getVolume ( ) {
    vol="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
}


case $1 in
    up)
        amixer -D pulse sset Master '5%+'
        ;;

    down)
        amixer -D pulse sset Master '5%-'
        ;;

    toggle)
        amixer set Master toggle
        ;;
    get)
        getVolume
        echo $vol
        ;;
    *)
        echo -n "invalid argument"
        ;;
esac
