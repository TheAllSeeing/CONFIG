#!/usr/bin/env zsh

[ -f ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh ] && source ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "$P10K_DIR/p10k.zsh" ]] && source "$P10K_DIR/p10k.zsh"
