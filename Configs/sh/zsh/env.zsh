#!/usr/bin/env zsh

#

[ -f ~/.bash_local ] && source ~/.bash_local

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi


ZSH_DIR="$(dirname "$(readlink -f "$0")")"
SH_DIR="$(dirname "$ZSH_DIR/../sh")"

[ -f "$SH_DIR/search-engines.sh" ] && source "$SH_DIR/search-engines.sh"
