#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

install_symlinks_dir "$SRC/vim" "/etc/vim"

if update-alternatives --query editor | grep -q 'Value: /usr/bin/vim.basic'; then
    echo "Skipping default editor (already set to vim.basic)"
else
    update-alternatives --set editor /usr/bin/vim.basic
    echo "Set default editor to vim.basic"
fi
