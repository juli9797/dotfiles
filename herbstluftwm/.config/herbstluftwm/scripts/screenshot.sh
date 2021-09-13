#!/bin/bash
# Screenshot dmenu
# Dependencies:
# * bluetoothctl
# * dmenu
# Julian Dangelmaier 2021


fpath=$(echo -e ""|dmenu -p "Screenshot filename")
case $fpath in
    "")
        ;;
    *)
        import ~/Pictures/$fpath.png
        ;;
esac
