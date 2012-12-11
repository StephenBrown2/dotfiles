# ~/.zshrc

# Key Bindings
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
#bindkey "^[[A" history-beginning-search-backward # Up
#bindkey "^[[B" history-beginning-search-forward # Down

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Source zsh specific functions
if [ -f ~/.zsh_functions ]; then
    source ~/.zsh_functions
fi

# Source generic aliases
if [ -f ~/.sh_aliases ]; then
    source_sh ~/.sh_aliases
fi

# Source zsh specific aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# Source zsh specific prompt
if [ -f ~/.zsh_prompt ]; then
	source ~/.zsh_prompt
fi
