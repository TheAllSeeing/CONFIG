#!/usr/bin/env sh

# Localization Standartization parameters: function, directory pointers, path additions
# DEVICE: AllSeer (Desktop Linux System)

# HOME
export HOME=/data/data/com.termux/files/home

# exa pointer (to use in wrapper function)
_exa() {
    /data/data/com.termux/files/usr/bin/exa $@
}

# ls pointer (to use in wrapper funciton)
_ls() {
    /data/data/com.termux/files/usr/bin/ls $@
}

# sudo or sudo equivalent pointer (for cygwin, android, etc.)
sudo() {
    echo "Phone not rooted, cannot sudo." >2
    exit 1
}

# xdg-open or equivalent pointer
open() {
    xdg-open "$@"
}

# Open a url link
url() {
    termux-open-url $(echo "$@" | sed "s/ /%20/g")
}

xcopy() {
    /data/data/com.termux/files/home/.local/bin/xcopy $@
}

xpaste() {
    /data/data/com.termux/files/home/.local/bin/xpaste $@ bs
}
