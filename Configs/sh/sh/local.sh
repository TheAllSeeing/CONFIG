#!/usr/bin/env sh

# Localization Standartization parameters: function, directory pointers, path additions
# DEVICE: AllSeer (Desktop Linux System)

# HOME
export HOME=/cygdrive/c/Users/ataya/Home

# exa pointer (to use in wrapper function)
_exa() {
	echo exa not available for windows
	return 1
}

# ls pointer (to use in wrapper funciton)
_ls() {
    /usr/bin/ls --color=auto $@
}

# sudo or sudo equivalent pointer (for cygwin, android, etc.)
sudo() {
    cygstart --action="runas" $@
}

# xdg-open or equivalent pointer
open() {
    cygstart $@
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
