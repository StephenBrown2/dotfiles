# ~/.zshrc

# Source environment variables
#if [ -f ~/.config/shell/env ]; then
#    source ~/.config/shell/env
#fi

# Autoload zsh functions.
fpath=(~/.config/zsh/functiondir $fpath)
autoload -U ~/.config/zsh/functiondir/*(:t)

# Source zsh specific configuration
if [ -f ~/.config/zsh/conf ]; then
    source ~/.config/zsh/conf
fi

# Source zsh specific functions
if [ -f ~/.config/zsh/functions ]; then
    source ~/.config/zsh/functions
fi

# Source bash specific functions
#if [ -f ~/.config/bash/functions ]; then
#    source_sh ~/.config/bash/functions
#fi

# Source generic aliases
#if [ -f ~/.config/shell/aliases ]; then
#    source_sh ~/.config/shell/aliases
#fi

# Source zsh specific aliases
if [ -f ~/.config/zsh/aliases ]; then
    source ~/.config/zsh/aliases
fi

if [ -d ~/.config/zsh/completions ]; then
    for f in ~/.config/zsh/completions/*; do
        source $f
    done
fi

# Source zplug (before prompt, for reasons)
if [ -f $XDG_CONFIG_HOME/zsh/zplug ]; then
    export ZPLUG_FILE=$XDG_CONFIG_HOME/zsh/zplug
    source $ZPLUG_FILE
fi

# Source zsh specific key bindings
if [ -f ~/.config/zsh/zkbd ]; then
    source ~/.config/zsh/zkbd
fi

# Source zsh specific prompt
if [ -f ~/.config/zsh/prompt ]; then
    source ~/.config/zsh/prompt
fi


export RS_USER=stephenbrown2
export RS_KEY=831496306d86c15d6d6502a31448035d
export RS_REGION=dfw
export PRIVATE_KEY=/home/stephen/.ssh/id_ed25519
export PUBLIC_KEY=/home/stephen/.ssh/id_ed25519.pub

