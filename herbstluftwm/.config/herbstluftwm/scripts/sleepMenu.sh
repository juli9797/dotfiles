#!/bin/bash

selection=$(echo -e "Suspend\nHybrid Sleep\nHibernate\nShutdown" | dmenu -i -l 5 -p "System:")
BASE="$(dirname $0)"

case $selection in
    Suspend)
        ${BASE}/suspend.sh suspend
        ;;
    "Hybrid Sleep")
        ${BASE}/suspend.sh hybrid-sleep
        ;;
    Hibernate)
        ${BASE}/suspend.sh hibernate 
        ;;
    Shutdown)
        ${BASE}/suspend.sh poweroff 
        ;;
    *)
        ;;

    esac
