#!/bin/bash
set -e

apt-get update

# Each group is sorted alphabetically. Add new packages to the appropriate group.
# editor, build tools
apt-get install -y make vim

# networking
apt-get install -y net-tools netcat-openbsd

# system monitoring
apt-get install -y acpi htop iotop
