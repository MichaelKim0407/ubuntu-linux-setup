#!/bin/bash
set -e

apt-get update

# Each group is sorted alphabetically. Add new packages to the appropriate group.
# editor
apt-get install -y vim

# system tools
apt-get install -y jq plocate

# networking
apt-get install -y curl net-tools netcat-openbsd

# system monitoring
apt-get install -y acpi htop iotop

# dev tools
apt-get install -y make
