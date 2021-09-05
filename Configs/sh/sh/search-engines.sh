#!/usr/bin/env sh


# ===Get URL opener command===
[ -f ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh ] && . ~/Gray/CONFIG/Configs/sh/sh/confdirs.sh

if [ -f $SH_DIR/local.sh ]; then
    . $SH_DIR/local.sh
else
    echo "could not find local url-opener, aborting search engine definition"
    exit 1
fi
# ======

# ===Define Definer===
_def_search_engine() {
    engine_name="$1"
    addr="$2"
    search_addr="$2/$3"

    eval "$engine_name() { if [[ -z \"\$@\" ]]; then echo opening $addr; url $addr; else sed_str=\"s/%s/\$@/\"; url \"\$(echo '$search_addr' | sed \"\$sed_str\")\"; fi }"

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
# ======

# ===Define Search Engines===
_def_search_engine eco "https://www.ecosia.org" "search?q=%s"
_def_search_engine pirate "https://1337x.to" "srch?search=%s"
_def_search_engine reddit "http://www.reddit.com" "r/%s"
_def_search_engine wiki "https://en.wikipedia.org" "w/index.php?title=Special:Search&search=%s"
_def_search_engine anime "https://nyaa.si" "?f=2&c=1_2&q=%s"
_def_search_engine conjugate "https://en.bab.la/conjugation/english" "%s"

_def_search_engine ggl "https://www.google.com" "search?q=%s"
_def_search_engine drive "https://drive.google.com/drive" "search?q=%s"
_def_search_engine pic "https://www.google.co.il/images" "?q=%s"
_def_search_engine translate "http://translate.google.co.ils" "?source=osdd#auto|auto|%s"
_def_search_engine vid "https://www.youtube.com" "results?search_query=%s&page={startPage?}&utm_source=opensearch"

_def_search_engine toheb "http://www.morfix.co.il" "%s"
_def_search_engine github "https://github.com" "search?q=%s&ref=opensearch"

_def_search_engine define "http://www.dictionary.com" "browse/%s?r=75&src=ref&ch=dic"
_def_search_engine word "http://www.thesaurus.com" "browse/%s"

_def_search_engine 1337x "https://1337x.to" "srch?search=%s"
_def_search_engine pirate "https://thepiratebay.asia" "/s/?q=%s&page=0&orderby=99"

_def_search_engine netflix "https://www.netflix.com" "/search?q=%s"
# ======
