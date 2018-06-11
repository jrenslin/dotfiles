#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export BAR_FONT="xft:Roboto Mono 40"
export BAR_HEIGHT="60"

compton --config /dev/null &

. /etc/X11/Xsession
