#!/usr/bin/env zsh

SH_DIR="$(dirname "$(readlink -f "$0")")"

if [ -f $SH_DIR/local.sh ]; then
    . $SH_DIR/local.sh
else
    echo "could not find local url-opener, aborting search engine definition"
    exit 1
fi

# ===Search Engine Configurations===
_def_search_engine() {
    engine_name="$1"
    addr="$2"
    search_addr="$2/$3"

    echo $engine_name engine
    eval "echo Defining $engine_name engine; $engine_name() { if [[ -z \"\$@\" ]]; then; echo opening $addr; url $addr; else; sed_str=\"s/%s/\$@/\"; url \"\$(echo '$search_addr' | sed \"\$sed_str\")\"; fi }"

    # echo Defining $engine_name engine
    # $engine_name() {
    #     if [[ -z "\$@" ]]; then
    #         echo opening $addr
    #         url $addr
    #     else
    #         sed_str="s/%s/\$@/"
    #         url "\$(echo '$search_addr' | sed "\$sed_str")"
    #     fi
    # }
}

[ -f ~/.search_engines ] && . ~/.search_engines
# ======
