#!/usr/bin/env bash
THEME=$1
THEME_DIR="$HOME/nixos/themes/$THEME"

if [ -d "$THEME_DIR" ]; then
    echo "$THEME" > ~/nixos/current_theme

    ln -sf "$THEME_DIR/current-theme.conf" ~/.config/kitty/current-theme.conf


    kill -USR1 $(pgrep kitty)
else
    echo "theme $THEME does not exist"
    exit 1
fi
