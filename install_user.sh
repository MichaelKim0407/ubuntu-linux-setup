#!/bin/bash
set -e

if [[ $EUID -eq 0 ]]; then
    echo "Error: install_user.sh must not be run as root"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/install/bash-user.sh" "$@"
"$SCRIPT_DIR/install/nopasswd.sh" "$@"
# docker-user.sh must be last — it prints a restart warning that should not be buried
"$SCRIPT_DIR/install/docker-user.sh"
