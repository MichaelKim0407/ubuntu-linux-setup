#!/bin/bash
set -e

UUID="monitor@astraext.github.io"

if gnome-extensions list --enabled | grep -q "$UUID"; then
    echo "Skipping Astra Monitor (already enabled)"
    exit 0
fi

echo "Install Astra Monitor via your browser:"
echo ""
echo "1. Install the GNOME Shell Integration browser extension:"
echo ""
echo "    https://chromewebstore.google.com/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep"
echo ""
read -rp "Press Enter to continue..."
echo ""
echo "2. Install Astra Monitor:"
echo ""
echo "    https://extensions.gnome.org/extension/6682/astra-monitor/"
echo ""
read -rp "Press Enter to continue..."
