#!/bin/zsh

SECOND_BRAIN_NOTES="$HOME/personal/second_brain/notes"

echo "Enter the filename: "
read filename

if [ "$1" = "-q" ]; then
    file="$SECOND_BRAIN_NOTES/quick_access/$filename.md"
else
    file="$SECOND_BRAIN_NOTES/$filename.md"
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
