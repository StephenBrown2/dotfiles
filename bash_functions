# ~/.bash_functions

function cdls() { cd $1 && ls -A; }
function cdll() { cd $1 && ls -lA; }
function mtouch() { mkdir -p `dirname $1` && touch $1; }
