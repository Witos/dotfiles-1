#!/usr/bin/env bash
# a logout menu using rofi

wm=${1:-i3}
CMD=`echo -e "Suspend\nLogout\nReboot\nHibernate\nShutdown" | rofi -dmenu -p "Logout Menu:" -lines 6 -width 100 -padding 500`

case $wm in
    i3)
        logout="i3-msg exit";;
    bspwm)
        logout="bspc quit";;
    sway)
        logout="sway-msg exit";;
    *)
        logout="";;
esac


if [ ! $CMD ]; then
    exit
fi

case $CMD in
    Logout)
        eval "$logout";;
    Shutdown)
        systemctl poweroff -i;;
    Reboot)
        systemctl reboot;;
    Hibernate)
        systemctl hibernate;;
    Suspend)
        systemctl suspend;;
esac
