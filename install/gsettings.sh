#!/bin/bash
set -e

# Workspaces
gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.mutter workspaces-only-on-primary true

# Keyboard — workspace switching (Ctrl+Alt+Left/Right freed up for PyCharm)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Alt><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Alt><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Alt><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Alt><Super>Right']"

# Keyboard — disable view split on left/right (Super+Left/Right)
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"

# Tiling
gsettings set org.gnome.shell.extensions.tiling-assistant disable-tile-groups true
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false

# App switching — current workspace/monitor only
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Input methods
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'libpinyin'), ('ibus', 'hangul')]"

# Dash-to-dock
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-minimize-or-previews'
