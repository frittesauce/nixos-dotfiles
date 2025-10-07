#!/usr/bin/env bash
THEME=$1
THEME_DIR="$HOME/nixos/themes/$THEME"

if [ -d "$THEME_DIR" ]; then
    echo "$THEME" > ~/nixos/current_theme

    ln -sf "$THEME_DIR/kittyCol.conf" ~/.config/kitty/current-theme.conf
    ln -sf "$THEME_DIR/Colours.qml" ~/.config/quickshell/services/Colours.qml
    ln -sf "$THEME_DIR/wallpapers" ~/Pictures/

    file=$(ls $THEME_DIR/wallpapers | shuf -n 1)

    echo "$file selected"

    swww img "$THEME_DIR/wallpapers/$file"

    kill -USR1 $(pgrep kitty)
else
    echo "theme $THEME does not exist"
    exit 1
fi
