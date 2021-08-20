CONFIGS_DIR="$(cd "$(dirname "$0")" && pwd)/Configs"

if echo $PREFIX | grep 'termux'; then
    : # Running on MiniSeer Termux

elif [ -f /etc/lsb-release ]; then
    sudo apt install lyx
    if [ -d ~/.lyx ] || [ -f ~/.lyx ]; then
        echo "~/.lyx Directory Found"
        rm -i -r ~/.lyx
    fi
    ln -s $CONFIGS_DIR/lyx ~/.lyx

elif [ $(uname -s) = "CYGWIN" ]; then
    : # Running on NoSeer CygWin

else
    echo "Unrecognized Filesystem:"
    echo "- No /etc/lsb-release file detected"
    if [-n "$PREFIX"]; then
        echo "- \$PREFIX: $PREFIX"
    else
        echo "- No \$PREFIX defined"
    fi
    echo "- uname -s : $(uname -s)"
    exit 1
fi
