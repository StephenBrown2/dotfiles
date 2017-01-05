#!/bin/bash

# EDIT THIS TO YOUR LIKING. It's the path to the folder containing the cache of comics. Duh
CACHE=/home/stephen/.cache/xkcd

function getinfo() {
  [[ ! -f ${CACHE}/${2}.json ]] && curl -s "https://xkcd.com/$1/info.0.json" -o ${CACHE}/${2}.json
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

# Be sure we're SFW!
KILLLIST=($(egrep 'fuck|shit' /home/stephen/.cache/xkcd/*.json | cut -f1 -d:));

for file in "${KILLLIST[@]}"; do
  rm ${file%.*}*
  touch ${file%.*}.ban
done

if [[ "$1" == "--xkcd-true-behavior" ]]; then
  random=4
elif [[ "$1" =~ [0-9]+ ]]; then
  random=$1
else
  random=404
fi
printf -v padded "%04d" ${random};
# Get a random number between 1 and Number_Of_Comics
# Using the modulo operator has the possibility of
# yielding 0, so we subtract one from Number_Of_Comics,
# and add it again at the end
until [[ ! -f ${CACHE}/${padded}.ban ]]; do
  random=$(( ( RANDOM % ( `lastnum` - 1  ) ) + 1));
  printf -v padded "%04d" ${random};
done

# Fetch the random json, parse its goodness
getinfo ${random} ${padded}
image=$(imgurl ${padded})
title=$(titletext ${padded})
alt=$(alttext ${padded})
[[ ! -d "$CACHE" ]] && mkdir -p "$CACHE"

# We go into the cache folder
cd "$CACHE" ||
   { echo "Couldn't enter cache directory '$CACHE'. Fire up the mkdir-mobile!" >&2; exit 2; } # Error handling

# I use wget here because of the --continue flag. It makes it easy to cache.
# If the picture already has been downloaded, the wget command simply does
# nothing. Easy as 3.14...
wget --quiet --continue "$image" -O ${padded}_$(basename $image) ||
   { echo "An error occured while downloading $image" >&2;
     rm -f ${CACHE}/${padded}*;
     touch ${CACHE}/${padded}.ban;
     exit 1; } # Still error handling

# Now all that's left to do is to print the path to the comic
echo "filename=\"${CACHE}/${padded}_$(basename "$image")\""
echo "alttext=${alt}"
echo "title=${title}"
echo "number=${random}"
