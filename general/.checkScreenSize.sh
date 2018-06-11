#!/bin/bash

if [ "$HOSTNAME" = "jrenslin-pc" ]; then

    xrandr --newmode "3840x2160_30.00"  339.57  3840 4080 4496 5152  2160 2161 2164 2197  -HSync +Vsync2

    xrandr --addmode HDMI-1 3840x2160_30.00

    xrandr --output HDMI-1 --mode 3840x2160_30.00

fi
