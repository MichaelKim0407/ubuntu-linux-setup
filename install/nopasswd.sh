#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

DEST="/etc/sudoers.d/$USER"
CONTENT="$USER ALL=(ALL) NOPASSWD: ALL"

if sudo test -e "$DEST"; then
    if confirm_overwrite "$DEST"; then
        echo "$CONTENT" | sudo tee "$DEST" > /dev/null
        sudo chmod 0440 "$DEST"
        echo "Reinstalled $DEST"
    else
        echo "Skipping $DEST (already exists)"
    fi
else
    echo "$CONTENT" | sudo tee "$DEST" > /dev/null
    sudo chmod 0440 "$DEST"
    echo "Installed $DEST"
fi
