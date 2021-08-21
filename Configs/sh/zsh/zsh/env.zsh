#!/usr/bin/env zsh


[ -f ~/.bash_local ] && source ~/.bash_local

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi

[ -f ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh ] && source ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh

[ -f "$SH_DIR/search-engines.sh" ] && source "$SH_DIR/search-engines.sh"
