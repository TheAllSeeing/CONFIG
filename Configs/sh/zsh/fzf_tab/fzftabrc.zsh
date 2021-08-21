#!/usr/bin/env zsh

# override vim-mode conflict
bindkey "^I" fzf-tab-complete
# set fzf-tab to use tmu
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
