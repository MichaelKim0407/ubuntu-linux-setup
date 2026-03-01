#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

if [[ $EUID -eq 0 ]]; then
    ps1_src="$SRC/bash-user/root_ps1"
else
    ps1_src="$SRC/bash-user/user_ps1"
fi

# Install .bash_ps1 (copy)
ps1_dest="$HOME/.bash_ps1"
if [[ -e "$ps1_dest" ]]; then
    if [[ "$FORCE" == true ]]; then
        cp "$ps1_src" "$ps1_dest"
        echo "Reinstalled .bash_ps1"
    else
        echo "Skipping .bash_ps1 (already exists)"
    fi
else
    cp "$ps1_src" "$ps1_dest"
    echo "Installed .bash_ps1"
fi

# Install .bash_append (symlink)
append_src="$SRC/bash-user/bash_append"
append_dest="$HOME/.bash_append"
ln -sf "$append_src" "$append_dest"
echo "Installed .bash_append"

# Append source line to ~/.bashrc
BASHRC="$HOME/.bashrc"
APPEND_LINE="source ~/.bash_append"

if grep -qF "$APPEND_LINE" "$BASHRC"; then
    echo "Skipping $BASHRC append (already present)"
else
    echo "" >> "$BASHRC"
    echo "$APPEND_LINE" >> "$BASHRC"
    echo "Appended to $BASHRC"
fi
