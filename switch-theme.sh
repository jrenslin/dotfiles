#!/bin/bash

# -------------------------------
# Script to switch between themes
# -------------------------------

# -------------------------------
# Move $1 and $2 to more readable variables
# -------------------------------

from="$1"
to="$2"

# -------------------------------
# Unstow the theme that's currently used and stow the target theme.
# -------------------------------

stow -t "/home/$USER/" -d "/home/$USER/Sync/Programming/dotfiles/" -D "$from"
stow -t "/home/$USER/" -d "/home/$USER/Sync/Programming/dotfiles/" "$to"

# -------------------------------
# Restart i3 if on workstation, else reconfigure openbox.
# -------------------------------

if [ "$HOSTNAME" = "jrenslin-pc" ]; then
    i3-msg restart
else
    openbox --reconfigure
fi

# -------------------------------
# Kill dunst 
# Kill all instances of conky to start the theme-specific ones later
# -------------------------------

killall dunst
killall conky

# -------------------------------
# Start theme-specific instances of conky 
# -------------------------------

if [ "$to" = "juicy" ]; then
    conkys=(
        ~/.config/conky/load-rarely/conky-clock.conf
        ~/.config/conky/conky-sys-stats.conf
        ~/.config/conky/load-rarely/conky-tasks-khal.conf
        ~/.config/conky/load-rarely/conky-mpd.conf
        ~/.config/conky/tiles/conky-files-sync.conf
        ~/.config/conky/tiles/conky-files-notes.conf
        ~/.config/conky/tiles/conky-files-pictures.conf
        ~/.config/conky/tiles/conky-files-cache.conf
    )
elif [ "$to" = "summer" ]; then
    conkys=(
        ~/.config/conky/load-rarely/conky-clock.conf
        ~/.config/conky/load-rarely/conky-mpd.conf
        ~/.config/conky/tiles/conky-files-sync.conf
        ~/.config/conky/tiles/conky-files-notes.conf
        ~/.config/conky/tiles/conky-files-pictures.conf
        ~/.config/conky/tiles/conky-files-cache.conf
    )
elif [ "$to" = "comfy" ]; then
    conkys=(
        ~/.config/conky/load-rarely/conky-clock.conf
        ~/.config/conky/load-rarely/conky-mpd.conf
        ~/.config/conky/tiles/conky-files-sync.conf
        ~/.config/conky/tiles/conky-files-notes.conf
        ~/.config/conky/tiles/conky-files-pictures.conf
        ~/.config/conky/tiles/conky-files-cache.conf
    )
fi

for i in "${conkys[@]}"; do
    sleep 1
    conky -q -d -c "$i"
done

# -------------------------------
# Set user-specific background
# -------------------------------

if [ "$to" = "juicy" ]; then
    feh --randomize --bg-scale ~/Sync/Images/Wallpapers/with_space_left/* &
elif [ "$to" = "summer" ]; then
    feh --bg-scale ~/Sync/Images/Wallpapers/desktop_light/Bicycle\[Wenchieh_Yang\]\[PD\].jpg &
elif [ "$to" = "comfy" ]; then
    feh --bg-tile ~/Sync/Images/Wallpapers/desktop_light/comfy_tiles.png &
fi


# -------------------------------
# Send notification that switch of theme is compleed
# -------------------------------

notify-send "Switched theme to $to"
