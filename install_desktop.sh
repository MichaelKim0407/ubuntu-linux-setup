#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Error: install_desktop.sh must be run as root"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/install/apt-desktop.sh"
"$SCRIPT_DIR/install/chrome.sh"
