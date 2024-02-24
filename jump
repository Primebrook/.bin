project_dirs=$(ls ~/projects/ | tr ' ' '\n')
zappi_dirs=$(ls ~/zappi/ | tr ' ' '\n')

selected=$(printf "%s\n%s" "$project_dirs" "$zappi_dirs" | fzf)

if [ -z "$selected" ]; then
  exit 0
fi

if printf "%s" "$project_dirs" | grep -qs "^$selected$"; then
  path="$HOME/projects/$selected"
else
  path="$HOME/zappi/$selected"
fi

tmux neww -n "$selected" -c "$path"
