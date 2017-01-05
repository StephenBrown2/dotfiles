#!/usr/bin/env zsh

[[ -f /tmp/clearscreen.png ]] && rm -f /tmp/clearscreen.png
[[ -f /tmp/screen.png ]] && rm -f /tmp/screen.png

# Grab the screen
maim /tmp/clearscreen.png;
# Figure out the dimensions of the screen
screenwidth=$(identify -format "%W" /tmp/clearscreen.png)
screenheight=$(identify -format "%H" /tmp/clearscreen.png)
# How blurry should we make it?
# (Smaller pixscale=bigger pixels)
pixscale=$(( ( RANDOM % 15 ) + 1));
rescale=${$((1./${pixscale}*10000))%%.*};
# Blurrify the screenshot and clean up
convert /tmp/clearscreen.png -thumbnail ${pixscale}% -scale ${rescale}% /tmp/screen.png;
rm -f /tmp/clearscreen.png

# Make sure the comic fits inside it well
maxheight=${$((${screenheight}*.98))%%.*}

# Get the comic and alt text
eval $(~/.local/bin/random-xkcd)

# and the width of that image, for the alt text
xkcdwidth=$(identify -format "%W" $filename)

# What font should imagemagick use?
#fontname=Humor-Sans
fontname=xkcd-Regular

# Set up the xkcd alt text and append to the comic image
captionoptions=(-background white -fill black -gravity center -font ${fontname} -pointsize 14 -size ${xkcdwidth})
convert "${captionoptions[@]}" caption:"Comic #${number}: ${title}" -append ${filename} "${captionoptions[@]}" caption:"${alttext}" -bordercolor white -border 5 -bordercolor black -border 1 -append -resize "x${maxheight}>" /tmp/xkcd-alt.png

# Stick the comic smack dab in the middle of the pixelated background
convert -gravity center -composite /tmp/screen.png /tmp/xkcd-alt.png /tmp/xcreen.png

# Clean up after ourselves, but leave the xcreen for locking
for file in clearscreen.png screen.png xkcd.png xkcd-alt.png; do
  [[ -f /tmp/$file ]] && rm -f /tmp/$file
done
