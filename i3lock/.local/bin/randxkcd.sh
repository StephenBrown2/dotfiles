#!/bin/bash

# EDIT THIS TO YOUR LIKING. It's the path to the folder containing the cache of comics. Duh
CACHE=/tmp/xkcd

function getinfo() {
  [[ ! -f ${CACHE}/${1}.json ]] && curl -s "https://xkcd.com/$1/info.0.json" -o ${CACHE}/${1}.json
}

function lastnum() {
  # Get the number of the latest comic
  curl -s 'https://xkcd.com/info.0.json' | jshon -e num
}

function titletext() {
   cat ${CACHE}/${1}.json | jshon -Q -e 'title'
}

function alttext() {
  cat ${CACHE}/${1}.json | jshon -Q -e 'alt' | cleantext
}

function cleantext() {
  read a;
  echo "$a" | sed 's/(f)u(ck)/$1-$2/ig'
}

function imgurl() {
   cat ${CACHE}/${1}.json | jshon -Q -e 'img' -u
}

# Get a random number between 1 and Number_Of_Comics
# Using the modulo operator has the possibility of
# yielding 0, so we subtract one from Number_Of_Comics,
# and add it again at the end
random=404
until [[ ! -f ${CACHE}/${random}.ban ]]; do
  random=$(( ( RANDOM % ( `lastnum` - 1  ) ) + 1))
done

[[ "$1" == "--xkcd-true-behavior" ]] && random=4
# Fetch the random json, parse its goodness
getinfo ${random}
image=$(imgurl ${random})
title=$(titletext ${random})
alt=$(alttext ${random})

[[ ! -d "$CACHE" ]] && mkdir -p "$CACHE"

# We go into the cache folder
cd "$CACHE" ||
   { echo "Couldn't enter cache directory '$CACHE'. Fire up the mkdir-mobile!" >&2; exit 2; } # Error handling

# I use wget here because of the --continue flag. It makes it easy to cache.
# If the picture already has been downloaded, the wget command simply does
# nothing. Easy as 3.14...
wget --quiet --continue "$image" -O ${random}_$(basename $image) ||
   { echo "An error occured while downloading $image" >&2;
     rm -f ${CACHE}/${random}*;
     touch ${CACHE}/${random}.ban;
     exit 1; } # Still error handling

# Now all that's left to do is to print the path to the comic
echo "filename=${CACHE}/${random}_$(basename "$image")"
echo "alttext=${alt}"
echo "title=${title}"
echo "number=${random}"
