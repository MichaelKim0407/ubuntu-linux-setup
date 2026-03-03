#!/bin/bash
set -e

apt-get update

# Each group is sorted alphabetically. Add new packages to the appropriate group.
# desktop apps
apt-get install -y terminator

# GNOME extensions
apt-get install -y gnome-browser-connector gir1.2-gtop-2.0

# input methods
apt-get install -y ibus-hangul ibus-libpinyin

# notifications
apt-get install -y libnotify-bin
