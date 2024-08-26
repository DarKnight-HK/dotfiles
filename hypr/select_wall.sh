
#!/bin/sh

# Directory containing wallpapers
wallpapersDir="$HOME/Downloads/walls-catppuccin-mocha-master"

# Get a list of wallpapers in the directory
wallpapers=("$wallpapersDir"/*)

# Check if the wallpapers array is empty
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No wallpapers found in $wallpapersDir"
    exit 1
fi

# Prepare a list of file names for rofi
fileNames=$(printf '%s\n' "${wallpapers[@]}" | xargs -n 1 basename)

# Use rofi to select a wallpaper by file name
selectedFileName=$(printf '%s\n' "$fileNames" | rofi -dmenu -p "Select Wallpaper")

# Check if a wallpaper was selected
if [ -z "$selectedFileName" ]; then
    echo "No wallpaper selected"
    exit 1
fi

# Find the full path of the selected file
selectedWallpaper=$(printf '%s\n' "${wallpapers[@]}" | grep -F "$selectedFileName")

# Update the wallpaper using the swww img command
swww img "$selectedWallpaper"

# Notify user of the selected wallpaper
notify-send "Wallpaper Changed" "$selectedFileName"

