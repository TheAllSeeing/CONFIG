

[ -f ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh ] && source ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh

[ -f  "$OMZ_DIR/omzrc.zsh" ] && source "$OMZ_DIR/omzrc.zsh"
[ -f "$SH_DIR/profile" ] && source "$SH_DIR/profile"

# Title Congfiguration
precmd () { print -Pn "\e]0;Zsh ($ZSH_ID)\a" }
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
