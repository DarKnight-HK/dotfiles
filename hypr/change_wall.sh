#!/bin/sh
wallpapersDir="$HOME/Downloads/walls-catppuccin-mocha-master"

wallpapers=("$wallpapersDir"/*)

if [ ${#wallpapers[@]} -eq 0 ]; then
    wallpapers=("$wallpapersDir"/*)
fi

# Select a random wallpaper from the array
wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
selectedWallpaper="${wallpapers[$wallpaperIndex]}"
# Update the wallpaper using the swww img command
swww img "$selectedWallpaper"

notify-send "$selectedWallpaper"
