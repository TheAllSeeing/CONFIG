#!/usr/bin/env sh

__unalias() {
    if alias $1 >/dev/null 2>&1; then
        unalias $1
    fi
}
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
__unalias sudo
sudo() {
    echo "Phone not rooted, cannot sudo." >2
    exit 1
}

# xdg-open or equivalent pointer

__unalias open
open() {
    tel-open "$@"
}

# Open a url link
__unalias url
url() {
    termux-open-url $(echo "$@" | sed "s/ /%20/g")
}

__unalias xcopy
xcopy() {
    /data/data/com.termux/files/home/.local/bin/xcopy $@
}

__unalias xpaste
xpaste() {
    /data/data/com.termux/files/home/.local/bin/xpaste $@ bs
}
