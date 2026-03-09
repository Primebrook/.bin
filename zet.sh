#!/bin/zsh

SECOND_BRAIN="$HOME/personal/second_brain"

echo "Enter the filename: "
read filename

if [ "$1" = "-q" ]; then
    file="$SECOND_BRAIN/quick_access/$filename.md"
else
    file="$SECOND_BRAIN/$filename.md"
fi

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
