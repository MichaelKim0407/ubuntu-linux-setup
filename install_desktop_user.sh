#!/bin/bash
set -e

if [[ $EUID -eq 0 ]]; then
    echo "Error: install_desktop_user.sh must not be run as root"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/install/gsettings.sh"
python3 "$SCRIPT_DIR/install/terminator.py"
"$SCRIPT_DIR/install/astra-monitor.sh"
"$SCRIPT_DIR/install/astra-monitor-settings.sh" "$@"
