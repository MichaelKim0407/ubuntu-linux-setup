#!/bin/bash
set -e

if dpkg -s google-chrome-stable &> /dev/null; then
    echo "Skipping Google Chrome (already installed)"
    exit 0
fi

# Adapted from the official Google Chrome installation guide for Ubuntu:
# https://ubuntuhandbook.org/index.php/2024/04/install-google-chrome-ubuntu-24-04-lts/
apt-get update
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-chrome.gpg
chmod a+r /etc/apt/keyrings/google-chrome.gpg

cat > /etc/apt/sources.list.d/google-chrome.sources <<EOF
Types: deb
URIs: https://dl.google.com/linux/chrome/deb/
Suites: stable
Components: main
Architectures: amd64
Signed-By: /etc/apt/keyrings/google-chrome.gpg
EOF

apt-get update
apt-get install -y google-chrome-stable

echo "Installed Google Chrome"
