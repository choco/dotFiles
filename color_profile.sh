if [ "$#" -ne 1 ]; then
    echo "[+] Please specify color profile"
    exit -1
fi
if [ -n "$TMUX" ]; then
    tmux set-environment TERMINAL_PROFILE "$1"
    tmux source ~/.tmux.conf
fi
export TERMINAL_PROFILE="$1"
clear
