#!/bin/bash

screenshot_filename="$HOME/Pictures/screenshots/$(date +"%d-%m-%Y-%H%S")-Selection.png"
grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | swappy -f -

