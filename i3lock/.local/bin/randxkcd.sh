#!/bin/bash

# EDIT THIS TO YOUR LIKING. It's the path to the folder containing the cache of comics. Duh
CACHE=/tmp/xkcd

function fetchurl() {
   # This function is just in case you haven't got curl.
   # It could be replaced by wget, /dev/tcp or something like that
   curl -s "$1" ||
      { echo "Network error. Fix it" >&2; exit 1; } # Error handling
}

function lastnum() {
   # Get the number of the latest comic
   fetchurl 'http://xkcd.com/' |
      awk '/link to this comic: http:\/\/xkcd.com\// { split(substr($6,17),n,"/"); print n[1] }'
}

function alttext() {
   fetchurl "https://xkcd.com/$1/info.0.json" | jshon -Q -e 'alt'
}

function imgurl() {
   fetchurl "https://xkcd.com/$1/info.0.json" | jshon -Q -e 'img' -u
}

# Get a random number between 1 and Number_Of_Comics
# Using the modulo operator has the possibility of
# yielding 0, so we subtract one from Number_Of_Comics,
# and add it again at the end
random=$(( ( RANDOM % ( `lastnum` - 1  ) ) + 1))

[[ "$1" == "--xkcd-true-behavior" ]] && random=4

# Fetch the random html document, find the img tag, get the url
# (it's the text between the quotes marks, hence the -F to awk)
image=$(imgurl ${random})
alt=$(alttext ${random})

[[ ! -d "$CACHE" ]] && mkdir -p "$CACHE"

# We go into the cache folder
cd "$CACHE" ||
   { echo "Couldn't enter cache directory '$CACHE'. Fire up the mkdir-mobile!" >&2; exit 2; } # Error handling

# I use wget here because of the --continue flag. It makes it easy to cache.
# If the picture already has been downloaded, the wget command simply does
# nothing. Easy as 3.14...
wget --quiet --continue "$image" -O ${random}_$(basename $image) ||
   { echo "An error occured while downloading $image" >&2; exit 1; } # Still error handling

# Now all that's left to do is to print the path to the comic
echo "filename=${CACHE}/${random}_$(basename "$image")"
echo "alttext=${alt}"
