#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Error: install.sh must be run as root"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/install/bash.sh" "$@"
"$SCRIPT_DIR/install/vim.sh" "$@"
"$SCRIPT_DIR/install/system-bin.sh" "$@"
"$SCRIPT_DIR/install/root-bin.sh" "$@"
