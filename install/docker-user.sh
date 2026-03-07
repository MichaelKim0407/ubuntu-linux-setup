#!/bin/bash
set -e

if groups "$USER" | grep -qw docker; then
    echo "Skipping docker group (already a member)"
else
    sudo usermod -aG docker "$USER"
    echo "Added $USER to docker group"
    echo -e "\e[33mWarning: restart required for docker group membership to take effect\e[0m"
fi
