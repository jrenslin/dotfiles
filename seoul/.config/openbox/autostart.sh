#!/bin/sh
xscreensaver -c &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
mpd &
mpdscribble &
tint2 &
emacs --daemon &
# conky -c ~/.config/conky/load-rarely-laptop/conky-clock.conf &
# conky -c ~/.config/conky/load-rarely-laptop/conky-wifi.conf &
# conky -c ~/.config/conky/tiles-laptop/conky-files-sync.conf &
# conky -c ~/.config/conky/tiles-laptop/conky-files-notes.conf & 
# conky -c ~/.config/conky/tiles-laptop/conky-files-pictures.conf &
# conky -c ~/.config/conky/tiles-laptop/conky-files-cache.conf &
# conky -c ~/.config/conky/load-rarely-laptop/conky-mpd-laptop.conf &
syncthing --no-browser &
feh --bg-tile ~/Sync/Images/Wallpapers/desktop_light/hip-square.png &
offlineimap &
xset b off
xautolock -time 10 -locker "i3lock -i /home/jrenslin/Sync/Images/Wallpapers/Lockscreen/Singapore_street_III[KaiLehmann][CC-BY]_4k.png && sleep 1" -detectsleep &
gnome-terminal --hide-menubar -e ncmpcpp
gnome-terminal --hide-menubar -e ikhal --role='secondaryterminal'
# gnome-terminal --hide-menubar --geometry=130x55+1600+119
# gnome-terminal --hide-menubar --geometry=480x480
gnome-terminal --hide-menubar --role="mainterminal"
conky -c /home/jrenslin/.config/conky/load-rarely-laptop/conky-clock.conf &
conky -c /home/jrenslin/.config/conky/load-rarely-laptop/conky-mpd-laptop.conf &
conky -c /home/jrenslin/.config/conky/load-rarely-laptop/conky-wifi.conf &
conky -c /home/jrenslin/.config/conky/tiles-laptop/conky-files-sync.conf &
conky -c /home/jrenslin/.config/conky/tiles-laptop/conky-files-notes.conf &
conky -c /home/jrenslin/.config/conky/tiles-laptop/conky-files-pictures.conf &
conky -c /home/jrenslin/.config/conky/tiles-laptop/conky-files-cache.conf &
conky -c /home/jrenslin/.config/conky/load-rarely/conky-next-event.conf &

