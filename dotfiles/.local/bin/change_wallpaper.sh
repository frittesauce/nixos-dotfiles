#!/usr/bin/env bash

swww img $(find ~/Pictures/Wallpapers -type f | vicinae dmenu -p 'Pick a wallpaper...') --resize stretch
