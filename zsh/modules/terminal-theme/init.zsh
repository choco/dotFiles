# Set TERMINAL_THEME environment variable
# to either "dark" or "light" based on bg color

function update_terminal_theme() {
  # save tty
  oldstty=$(stty -g)
  stty raw -echo min 0 time 0
  printf "\x1bPtmux;\x1b\e]11;?\033\\" >/dev/tty
  # xterm needs the sleep (or "time 1", but that is 1/10th second).
  sleep 0.01
  read -r answer
  result=${answer#*;}
  result=$(echo $result | sed 's/^.*\;//;s/[^rgb:0-9a-f/]//g')
  # restore tty
  stty $oldstty
  r=$((16#${result:4:4}))
  g=$((16#${result:9:4}))
  b=$((16#${result:14:4}))
  total=$((($r+$g+$b)/3))
  total="("${total}"/65535)*255"
  total=$(echo "$total" | bc -l)
  total=`printf %.0f $total`

  if [[ $total -gt 200 ]]; then
    variant="light"
  else
    variant="dark"
  fi
  export TERMINAL_THEME=$variant

  if tmux info &> /dev/null; then
    tmux source-file ~/.tmux.conf >/dev/null
  fi
}

update_terminal_theme
