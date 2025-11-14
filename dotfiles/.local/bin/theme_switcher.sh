#!/usr/bin/env bash

BASE_DIR="$HOME/nixos/themes"

# Script to run when a folder is selected
TARGET_SCRIPT="$HOME/.local/bin/switch_theme.sh"

# Generate list of folders
folders=()
while IFS= read -r -d $'\0' dir; do
    folders+=("$(basename "$dir")")
done < <(find "$BASE_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

selected=$(printf '%s\n' "${folders[@]}" | vicinae dmenu --placeholder "Select Theme")

if [[ -n "$selected" ]]; then
    "$TARGET_SCRIPT" "$selected"
    echo "Switched to theme: $selected"
fi
