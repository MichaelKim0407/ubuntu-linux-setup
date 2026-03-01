#!/bin/bash

_LIB_DIR=$(dirname "${BASH_SOURCE[0]}")
REPO_ROOT=$(realpath "$_LIB_DIR/..")
SRC="$REPO_ROOT/src"

FORCE=false
for _arg in "$@"; do
    [[ "$_arg" == "--force" ]] && FORCE=true && break
done
unset _arg

# Usage: install_symlink <src_file> <dest_dir>
install_symlink() {
    local src_file="$1"
    local dest_dir="$2"
    local filename
    filename=$(basename "$src_file")
    local dest="$dest_dir/$filename"

    ln -sf "$src_file" "$dest"
    echo "Installed $filename"
}

# Usage: install_symlinks_dir <src_dir> <dest_dir>
# Symlinks all files in src_dir to dest_dir, excluding README.md
install_symlinks_dir() {
    local src_dir="$1"
    local dest_dir="$2"

    mkdir -p "$dest_dir"

    for src_file in "$src_dir"/*; do
        install_symlink "$src_file" "$dest_dir"
    done
}
