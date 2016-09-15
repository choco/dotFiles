LONG_CMD_NOTIFY_IGNORE=${AUTO_NTFY_DONE_IGNORE:-emacs info less mail man meld most mutt nano screen ssh tail tmux vi vim watch nvim}
DELAY_AFTER_NOTIFICATION=2

function long_cmd_notify_preexec() {
  longcmd_start_time=$(date +%s)
  longcmd_command=$(echo "$1")
}

function long_cmd_notify_precmd() {
  local ret_value="$?"
  [ -n "$longcmd_start_time" ] || return
  local duration=$(( $(date +%s) - $longcmd_start_time ))
  longcmd_start_time=''

  local appname=$(basename "${longcmd_command%% *}")
  [[ " $LONG_CMD_NOTIFY_IGNORE " == *" $appname "* ]] && return

  if [ $duration -gt $DELAY_AFTER_NOTIFICATION ]; then
    printf "\a"
  fi
}

function long_cmd_notify_setup() {
  # Load required functions.
  autoload -Uz add-zsh-hook

  add-zsh-hook preexec long_cmd_notify_preexec
  add-zsh-hook precmd long_cmd_notify_precmd
}

long_cmd_notify_setup
