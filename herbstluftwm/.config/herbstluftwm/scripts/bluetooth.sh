#!/bin/bash
# Bluetooth Menu
# Dependencies: 
# * bluetoothctl
# * dmenu
# Julian Dangelmaier 2021

connect () {
device=$(bluetoothctl devices | dmenu -i -l 8 -p "Connect")
echo $device
mac=$(echo $device | awk -F '[ ]' '{ print $2 }')
echo $mac
res=$(bluetoothctl connect ${mac}| awk "/successful/ { print 1; }")
echo $res
case $res in
    1)
        notify-send "Connected: $device"
        ;;
    *)
        notify-send "Connection failed: $device"
        ;;
esac

}
disconnect (){

device=$(bluetoothctl info| grep "Device " | dmenu -i -l 8 -p "Disconnect")
mac=$(echo $device | awk -F '[ ]' '{ print $2 }')
res=$(bluetoothctl disconnect ${mac}| awk "/Successful/ { print 1; }")
case $res in
    1)
        notify-send "Disconnected: $device"
        ;;
    *)
        notify-send "Disconnection failed: $device"
        ;;
esac

}

launcher ( ) { 
connected=$(bluetoothctl info | grep Name| awk -F '[ ]' '{$1="" ; print $0}')
selection=$(echo -e "Connect\nDisconnect\nConnected:\n$connected" | dmenu -i -l 8 -p "Bluetooth Menu :)")
case $selection in
    Connect)
        connect
        ;;
    Disconnect)
        disconnect
        ;;
    *)
        ;;
esac

}

launcher
