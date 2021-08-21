#!/usr/bin/env sh

# Localization Standartization parameters: function, directory pointers, path additions
# DEVICE: AllSeer (Desktop Linux System)

# HOME
export HOME=/home/atai

# Useful System Directories
export APPS=/usr/share/applications
export LAPPS=~/.local/share/applications

# Specific System Path Additions
export PATH=$PATH:/snap/bin

# exa pointer (to use in wrapper function)
_exa() {
    /usr/local/bin/exa $@
}

# ls pointer (to use in wrapper funciton)
_ls() {
    /usr/bin/ls --color=auto $@
}

# sudo or sudo equivalent pointer (for cygwin, android, etc.)
sudo() {
    /usr/bin/sudo $@
}

# xdg-open or equivalent pointer
open() {
    xdg-open "$@"
}

# Open a url link
url() {
    addr=$(echo $@ | sed 's/ /%20/g')
    echo Opening $addr
    firefox "$addr"
}

# xcopy() {
#    xclip -sel clip $@
# }

# xpaste() {
#     xclip -sel clip -o $@
# }
