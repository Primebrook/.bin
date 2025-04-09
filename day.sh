#!/bin/zsh

SECOND_BRAIN="$HOME/personal/second_brain"

today=$(date +"%d-%m-%Y")
tomorrow=$(gdate -d "tomorrow" '+%d-%m-%Y')
yesterday=$(gdate -d "yesterday" '+%d-%m-%Y')

file="$SECOND_BRAIN"'/periodic_notes/daily_notes/'$(date +"%d-%m-%Y").md

cd "$SECOND_BRAIN" || exit

new_note() {
    touch "$file"


    # Add the daily note template
    cat <<EOF >"$file"
# $today

## What do I want to achieve today? (Intention)

## Tasks

EOF
}

# If the daily note does not exist, create a new one.
# this uses the test command with the -f flag.
if [ ! -f "$file" ]; then
    echo "File does not exist, creating a new note."
    new_note
fi

# Open the daily note at the bottom of the file in nvim in insert mode.
nvim '+ normal Gzzo' "$file"
