#!/bin/zsh

SECOND_BRAIN="$HOME/personal/second_brain"

echo "Enter the filename: "
read filename
file="$SECOND_BRAIN"'/inbox/'$filename.md

cd "$SECOND_BRAIN" || exit

new_note() {
    touch "$file"

    cat <<EOF >"$file"



EOF
}

# If the note does not exist, create a new one. If it does exist, open it in nvim.
if [ ! -f "$file" ]; then
    new_note
fi

# Open the note.
nvim "$file"
