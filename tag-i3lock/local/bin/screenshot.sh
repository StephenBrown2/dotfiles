#!/usr/bin/env zsh

# Grab the screen
maim /tmp/clearscreen.png;
# How blurry should we make it?
# (Smaller pixscale=bigger pixels)
pixscale=$(( ( RANDOM % 15 ) + 1));
echo $pixscale
rescale=${$((1./${pixscale}*10000))%%.*};
echo $rescale
rm -f /tmp/screen.png
convert /tmp/clearscreen.png -thumbnail ${pixscale}% -scale ${rescale}% /tmp/screen.png;
rm -f /tmp/clearscreen.png
