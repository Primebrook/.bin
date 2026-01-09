# ~/.bin

Personal command-line utilities for fast note-taking and navigation.

## Scripts

### `day`

Opens today's daily note in nvim. Creates it if it doesn't exist.

```bash
day      # today
day -1   # yesterday
day -5   # 5 days ago
```

Notes are stored in `~/personal/second_brain/periodic_notes/daily_notes/DD-MM-YYYY.md`.

**Requires:** `gdate` (install with `brew install coreutils`)

**Example Usage**:

https://github.com/user-attachments/assets/9fcfe21c-1d55-45c9-b4a6-f329f93a3477



---

### `zet`

Creates or opens a note in your inbox. Prompts for a filename.

```bash
zet
# Enter the filename: my-idea
# Opens ~/personal/second_brain/inbox/my-idea.md
```

---

### `jump`

Fuzzy-find a project directory and open it in a new tmux window.

```bash
jump
# fzf through ~/personal/ and ~/zappi/ directories
# Opens selected directory in a new tmux window
```

**Requires:** `fzf`, `tmux`

## Setup

Add this directory to your PATH:

```bash
export PATH="$HOME/.bin:$PATH"
```
