#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

if [[ "$HOSTNAME" == "jrenslin-laptop" ]]; then
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
    export QT_AUTO_SCREEN_SCALE_FACTOR=1

#    export DUNST_FONT='Roboto 10'
#    export DUNST_SIZE='600x60-80+80'

    export BAR_FONT="xft:Roboto Mono 40"
    export BAR_HEIGHT="60"


    compton --config /dev/null &

elif [[ "$HOSTNAME" == "jrenslin-pc" ]]; then
#    xrandr \
#        --output DVI-0 \
#        --primary \
#        --mode 1920x1080 \
#        --output HDMI-0 \
#        --mode 1920x1080 \
#        --below DVI-0

#    export DUNST_FONT='Artwiz Lemon 7'
#    export DUNST_SIZE='300x30-40+70'

fi

. /etc/X11/Xsession
