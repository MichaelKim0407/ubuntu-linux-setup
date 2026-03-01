#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

install_symlinks_dir "$SRC/vim" "/etc/vim"
