

_source() {
    file_path="$1"
    if [ -f "$file_path" ]; then
        source "$file_path"
    else
        echo "could not find basic config: $file_path. Aborting ~/.zshrc"
    fi
}

_source ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh
_source "$ZSH_DIR/pluginsrc.zsh"
_source "$SH_DIR/profile"

# Title Congfiguration
precmd () { print -Pn "\e]0;Zsh ($ZSH_ID)\a" }
