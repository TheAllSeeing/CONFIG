#!/usr/bin/env sh

[ -f ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh ] && . ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh

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

    eval "$engine_name() { if [[ -z \"\$@\" ]]; then; echo opening $addr; url $addr; else; sed_str=\"s/%s/\$@/\"; url \"\$(echo '$search_addr' | sed \"\$sed_str\")\"; fi }"

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
