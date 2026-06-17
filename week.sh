#!/bin/zsh

SECOND_BRAIN="$HOME/personal/second_brain"
NOTES_DIR="$SECOND_BRAIN/periodic_notes/weekly_notes"

# Offset: default to 0 (this week), in weeks.
offset="${1:-0}"

# Support "week - 5" as well as "week -5".
if [[ "$1" == "-" && -n "$2" ]]; then
  offset="-$2"
fi

# Use GNU date (gdate). Ensure it exists.
if ! command -v gdate >/dev/null 2>&1; then
  echo "Error: gdate not found."
  echo "Install it with: brew install coreutils"
  exit 1
fi

# Reference day in the target week, then back up to that week's Monday.
ref_date=$(gdate -d "$offset week" +%Y-%m-%d)
dow=$(gdate -d "$ref_date" +%u)               # 1 (Mon) .. 7 (Sun)
monday=$(gdate -d "$ref_date -$((dow - 1)) day" +"%d-%m-%Y")
week_num=$(gdate -d "$ref_date" +%V)          # ISO week number
year=$(gdate -d "$ref_date" +%G)              # ISO week-numbering year

# Pretty Monday date, e.g. "15th June 2026".
mon_day=$(gdate -d "$ref_date -$((dow - 1)) day" +%-d)
case "$mon_day" in
  11|12|13) suffix="th" ;;
  *1) suffix="st" ;;
  *2) suffix="nd" ;;
  *3) suffix="rd" ;;
  *)  suffix="th" ;;
esac
monday_pretty="${mon_day}${suffix} $(gdate -d "$ref_date -$((dow - 1)) day" +'%B %Y')"

file="$NOTES_DIR/$monday.md"

cd "$SECOND_BRAIN" || exit

new_note() {
  mkdir -p "$NOTES_DIR"
  touch "$file"

  cat <<EOF >"$file"
# Week $week_num, $year (w/c $monday_pretty)
---
tags: [periodic/weekly]
---

✅
🟡
❌
⌛

## ToDo

EOF
}

# Create note if it doesn't exist
if [ ! -f "$file" ]; then
  echo "File does not exist, creating: $file"
  new_note
fi

# Open the note at the bottom in insert mode
nvim '+ normal Gzzo' "$file"
