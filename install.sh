#!/bin/bash

# -------------------------------
# Set default rice
# -------------------------------

default="comfy"

# -------------------------------
# Set divider for a bit more presentable output
# -------------------------------

bold=$(tput bold)
normal=$(tput sgr0)

emphasize() {
    echo ""
    echo "${bold}$1${normal}"
    echo ""
}

headline() {
    echo ""
    echo "-----------------------------"
    echo "${bold}$1${normal}"
    echo ""
}

# -------------------------------
# Array with all required folders
#
# Some programs (e.g. newsbeuter) store databases and 
# other non-config files directly in the directory the 
# config files are stored in. 
# These should not get into the dotfiles.
# When later using stow, it is thus counterproductive to 
# use have it create symlinks to folders.
# -------------------------------

folders=( 
    ~/.calendars
    ~/.config
    ~/.config/cava
    ~/.config/conky
    ~/.config/dunst
    ~/.config/firefox
    ~/.config/firefox_home
    ~/.config/i3
    ~/.config/i3blocks
    ~/.config/khal
    ~/.config/khard
    ~/.config/mpv
    ~/.config/neofetch
    ~/.config/openbox
    ~/.config/ranger
    ~/.config/rofi
    ~/.config/termite
    ~/.config/tint2
    ~/.config/vdirsyncer
    ~/.config/vdirsyncer/status
    ~/.config/youtube-dl
    ~/.config/yabar
    ~/.contacts
    ~/.mpd
    ~/.mpd/playlists
    ~/.mutt
    ~/.mutt/accounts
    ~/.ncmpcpp
    ~/.ncmpcpp/artists
    ~/.ncmpcpp/lyrics
    ~/.newsbeuter
    ~/.password-store
    ~/.weechat
    ~/.weechat/logs
    ~/.weechat/xfer
    ~/git-src
)

headline "Creating directories if they didn't previously exist"

for i in "${folders[@]}"
do
    if [ ! -d $i ]; then
        echo "-- Creating $i"
        mkdir $i
    else
        echo "-- $i already exists"
    fi
done

# -------------------------------
# Files to remove
#
# Some files are created before this can be set up.
# Delete them.
# -------------------------------

filesToRemove=( 
    ~/.bashrc
    ~/.zshrc
)

headline "Removing unwanted files"

for i in "${filesToRemove[@]}"
do
    if [ -e "$i" ]
    then
        echo "Removing $i"
        # rm -i "$i"
    fi
done

# -------------------------------
# Install programs to run - apt-get
#
# All packages to be installed via apt-get are listed
# in general/.pkgs 
# -------------------------------

toInstall=`cat general/.pkgs`

headline "Installing packages available via apt-get"

emphasize "Running apt-get update before installation"
sudo apt-get update

for i in $toInstall
do
    emphasize "Installing $i via apt-get"
    # sudo apt-get install "$i"
done

# -------------------------------
# Install programs to run - pip3
#
# All packages to be installed via pip3 are listed in general.pkgs
# Usually, packages in pip are way more up-to-date than their
# equivalents offered via apt-get. This applies even to Debian Testing.
# Finally, some programs I use are not available via apt-get. (e.g. khard)
#
# I'm trying to move away from anything Python 2, hence pip3 is used here.
# -------------------------------

toInstallPip=`cat general/.pkgs-pip3`

headline "Installing packages available via pip"

for i in $toInstallPip
do
    emphasize "Installing $i via pip"
    # sudo pip3 install "$i"
done

# -------------------------------
# Download programs to build via git
#
# Some things need to be installed from source / are not available otherwise.
# -------------------------------

toDLgit=`cat general/.pkgs-from-git`

headline "Downloading programs to install independently"

for i in $toDLgit
do
    emphasize "Cloning $i through git"
    # git -C ~/git-src/ clone "$i"
done

# -------------------------------
# Running stow
# -------------------------------

headline "Running stow"

echo "Stowed general config files"
stow -t "/home/$USER/" -d "/home/$USER/Sync/Programming/dotfiles/" "general"
echo "Stowed default style-related config files ($default)"
stow -t "/home/$USER/" -d "/home/$USER/Sync/Programming/dotfiles/" "$default"

emphasize "Finished."

echo "What's next?"
echo "Install Syncthing (https://apt.syncthing.net/)"
