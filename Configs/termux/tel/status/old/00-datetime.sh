#!/data/data/com.termux/files/usr/bin/bash
source ~/.tel/configs/status.sh

day="$(date "+ %Y-%m-%d W%U")"
time="$(date "+ %H:%M")"
NC='\033[0m' # No Col

printf "$day\n$time"
