#!/bin/zsh

SECOND_BRAIN="$HOME/personal/second_brain"
NOTES_DIR="$SECOND_BRAIN/periodic_notes/daily_notes"

# Offset: default to 0 (today)
offset="${1:-0}"

# If user passed something like "day -5", offset = -5.
# If they accidentally pass "day - 5", you can optionally support that too:
if [[ "$1" == "-" && -n "$2" ]]; then
  offset="-$2"
fi

# Use GNU date (gdate). Ensure it exists.
if ! command -v gdate >/dev/null 2>&1; then
  echo "Error: gdate not found."
  echo "Install it with: brew install coreutils"
  exit 1
fi

# Compute the date for the offset day
target_date=$(gdate -d "$offset day" +"%d-%m-%Y")

file="$NOTES_DIR/$target_date.md"

cd "$SECOND_BRAIN" || exit

new_note() {
  mkdir -p "$NOTES_DIR"
  touch "$file"

  cat <<EOF >"$file"
# $target_date

## What do I want to achieve today? (Intention)

## Tasks

EOF
}

# Create note if it doesn't exist
if [ ! -f "$file" ]; then
  echo "File does not exist, creating: $file"
  new_note
fi

# Open the note at the bottom in insert mode
nvim '+ normal Gzzo' "$file"
