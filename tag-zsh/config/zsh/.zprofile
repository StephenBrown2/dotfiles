### See note under https://wiki.archlinux.org/index.php/zsh#Startup.2FShutdown_files
typeset -U PATH path

pathmunge () {
  if [ -d "$1" ]; then
    if [ "$2" = "after" ] ; then
      path=($path[@] $1)
    else
      path=($1 $path[@])
    fi
  fi
  rehash
}

pathmunge ${HOME}/.local/bin
