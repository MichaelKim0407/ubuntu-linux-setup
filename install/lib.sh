#!/bin/bash

_LIB_DIR=$(dirname "${BASH_SOURCE[0]}")
REPO_ROOT=$(realpath "$_LIB_DIR/..")
SRC="$REPO_ROOT/src"

OVERWRITE=
for _arg in "$@"; do
    case "$_arg" in
        --overwrite|-y) OVERWRITE=yes; break ;;
        --no-overwrite|-n) OVERWRITE=no; break ;;
    esac
done
unset _arg

# Usage: confirm_overwrite <label>
# Returns 0 to proceed with overwrite, 1 to skip.
# Behavior is controlled by $OVERWRITE: "yes" always proceeds, "no" always skips,
# empty prompts the user interactively.
confirm_overwrite() {
    local label="$1"
    if [[ "$OVERWRITE" == yes ]]; then
        return 0
    elif [[ "$OVERWRITE" == no ]]; then
        return 1
    else
        read -rp "$label already exists. Overwrite? [y/N] " _answer
        [[ "$_answer" =~ ^[Yy]$ ]]
        local _rc=$?
        unset _answer
        return $_rc
    fi
}

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
