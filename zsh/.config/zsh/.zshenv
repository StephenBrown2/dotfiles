pathmunge () {
  if [ -d "$1" ]; then
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
      if [ "$2" = "after" ] ; then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
    fi
  fi
  export PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" \
         '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
}

export USER=$(whoami)
export HOME=/home/$USER
export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

if [[ -f $ZDOTDIR/zshenv ]]; then
  source $ZDOTDIR/zshenv
elif [[ -f $ZDOTDIR/.zshenv ]]; then
  source $ZDOTDIR/.zshenv
fi

if [[ -o login ]] && [[ -f $ZDOTDIR/zprofile ]]; then
  source $ZDOTDIR/zprofile
fi

if [[ -o interactive ]] && [[ -f $ZDOTDIR/zshrc ]]; then
  source $ZDOTDIR/zshrc
fi

if [[ -o login ]] && [[ -f $ZDOTDIR/zlogin ]]; then
  source $ZDOTDIR/zlogin
fi
