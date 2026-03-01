#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

install_symlinks_dir "$SRC/system-bin" "/usr/local/bin"
