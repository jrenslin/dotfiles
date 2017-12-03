#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Aliases

# Updating and interaction w/ system
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove'
alias brightness='xrandr --output eDP-1 --brightness `echo $1`'
increase_brightness() { ~/Sync/Programming/bash/brightness/increase_brightness.sh }
reduce_brightness() { ~/Sync/Programming/bash/brightness/reduce_brightness.sh }
alias list-installed='dpkg-query -W --showformat='${Installed-Size;10}\t${Package}\n' | sort -k1,1n'

# Files
alias appendfoldername='for i in *; do mv $i "`pwd|awk -F'/' '{print $NF}'`$i"; done'
alias dots='cd ~/Sync/Programming/dotfiles'
alias writing='cd ~/synced_notes/CUR'
alias flattendir='find "/$1" -mindepth 2 -type f -exec mv -t "/$1" -i "{}" +'

# Mail
alias synctasks='~/Sync/Programming/bash/backups/sync_tasks_with_ftp.sh'
alias syncmail='offlineimap -o -a jrenslin && offlineimap -o -a museumdigital'
alias syncinfo='syncmail && synctasks'

# Posting to my website
alias post-note='function _postnote(){ cd ~/Sync/Programming/Python/JACMS-Offline && python3 jacms-t.py post notes "$1" && cd ~; };_postnote'
alias post-music='function _postmusic(){ cd ~/Sync/Programming/Python/JACMS-Offline && python3 jacms-t.py post music "$1" && cd ~; };_postmusic'

# Running scripts
alias aklaman='~/Sync/Programming/bash/shortcut_scripts/aklaman.sh'
alias ocrscreen-eng='/home/jrenslin/Sync/Programming/bash/ocr/ocrscreen.sh eng'
alias ocrscreen-jpn='/home/jrenslin/Sync/Programming/bash/ocr/ocrscreen.sh jpn'
alias ocrscreen-jav='/home/jrenslin/Sync/Programming/bash/ocr/ocrscreen.sh jav'
alias readings='~/Sync/Programming/bash/shortcut_scripts/readings.sh'

# Running other programs
alias aard='java -Dslobber.browse=true -jar ~/.jars/aard2-web-0.7.jar ~/Sync/Data/Dictionaries/*.slob'
alias scanlocalnetwork='nmap -T4 -F 192.168.2.1/24'
alias aria2c='aria2c --conf-path=$HOME/.config/aria2/aria2.conf'
alias aria2batch='aria2c --conf-path=$HOME/.config/aria2/aria2.conf -i $HOME/Downloads/batch.txt'
alias youtube-dl-audio='youtube-dl --config-location=$HOME/.config/youtube-dl/dlAudio'

# Custom commands for specific handling of other programs 
alias fe='feh -F -Z "$1"'
alias videothumbnails='function _videothumbnails(){ mkdir output && ffmpeg -i "$1" -vf fps=1/60 output/thumbnail_%05d.jpg };_videothumbnails'
alias wallpaper-switch='feh --randomize --bg-scale ~/Sync/Images/Wallpapers/with_space_left/*'

# Handling PDFs
alias convertall-pdf-png='mkdir converted; for f in *.psd; do convert "$(echo $f)[0]" "converted/$(echo $f | sed -e `s|\.psd|\.png|g`)" && echo "Converted `$f` to $(echo $f | sed -e `s|\.psd|\.png|g`) ..."; done'
alias ocrpdf='ocrpdf () {ocrmypdf "`echo $1`" "_"`echo $1`" && rm -f "`echo $1`" && mv "_`echo $1`" "`echo $1`" }; ocrpdf'
alias pdfgreps='function _pdfgrepnormal(){ pdfgrep -inr "$1" ~/Sync/Readings 2> /dev/null; };_pdfgrepnormal'
alias readings_pdftotext='~/Sync/Programming/Python/PDFtoText/pdftotexts.sh'
alias rotatepdf='pdftk A=$1 shuffle AoddWest AevenEast output MyRotatedFile.pdf'

# Zip
alias zipcurrentfolder='zip -r "$(echo "${PWD##*/}.cbz")" .'
alias rartocbz='echo "$1" && unrar e "$1" && echo $1'
alias unrartofolder='f() { mkdir $1 && mv $1.rar $1 && cd $1 && unrar e $1 } f;'

# Others
alias concatenate_vids='f() { ffmpeg -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts && ffmpeg -i $2 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts && ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -c copy -bsf:a aac_adtstoasc $3}; f'
alias newterm='gnome-terminal --hide-menubar'
alias listwindows='~/Sync/Programming/bash/listwindows.sh'
alias readifyforexport='ln -s ~/Sync/Jabref/pdf.bib . && ln -s ~/Sync/Jabref/frankfurt.bib .'
alias reloaddunst='killall dunst;notify-send foo'
alias stow='stow -t ~/'

alias muse='ncmpcpp -h 192.168.2.106 -p 6601'
 
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fzf="fzf --height 40% --reverse --preview 'head -30 {}'"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
