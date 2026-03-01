#!/bin/bash
set -e

source "$(dirname "$0")/lib.sh"

install_symlinks_dir "$SRC/root-bin" "$HOME/.local/bin"
