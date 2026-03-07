#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

install_symlinks_dir "$SRC/bash" "/etc"

BASHRC="/etc/bash.bashrc"
APPEND_LINE="source /etc/bash.bashrc.append"

if grep -qF "$APPEND_LINE" "$BASHRC"; then
    echo "Skipping $BASHRC append (already present)"
else
    echo "" >> "$BASHRC"
    echo "$APPEND_LINE" >> "$BASHRC"
    echo "Appended to $BASHRC"
fi
