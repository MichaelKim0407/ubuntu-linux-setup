#!/bin/bash
set -e

if [[ $EUID -eq 0 ]]; then
    echo "Error: install_user.sh must not be run as root"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/install/bash-user.sh" "$@"
