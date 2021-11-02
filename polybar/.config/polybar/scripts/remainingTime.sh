
online=$(cat /sys/class/power_supply/AC/online)
case $online in
    0)
        expr $(cat /sys/class/power_supply/BAT0/energy_now) / $(cat /sys/class/power_supply/BAT0/power_now)
        ;;
    *)
        echo ""
        ;;
esac

