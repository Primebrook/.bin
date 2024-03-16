#!/bin/zsh

personal_dirs=$(ls ~/personal/ | tr ' ' '\n')
zappi_dirs=$(ls ~/zappi/ | tr ' ' '\n')

selected=$(printf "%s\n%s" "$personal_dirs" "$zappi_dirs" | fzf)

if [ -z "$selected" ]; then
  exit 0
fi

if printf "%s" "$personal_dirs" | grep -qs "^$selected$"; then
  path="$HOME/personal/$selected"
else
  path="$HOME/zappi/$selected"
fi

/opt/homebrew/bin/tmux neww -n "$selected" -c "$path"
