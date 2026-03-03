#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

DCONF_PATH="/org/gnome/shell/extensions/astra-monitor/"

EXISTING=$(dconf dump "$DCONF_PATH" | grep -v '^\[' | tr -d '[:space:]')
if [ -n "$EXISTING" ]; then
    if [ "$FORCE" = false ]; then
        echo "Skipping Astra Monitor settings (already configured; use --force to overwrite)"
        exit 0
    fi
fi

dconf load "$DCONF_PATH" < "$SRC/astra-monitor/settings.dconf"
echo "Applied Astra Monitor settings"
