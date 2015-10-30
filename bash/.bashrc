# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Source bash specific profile 
if [ -f ~/.config/bash/profile ]; then
	source ~/.config/bash/profile
fi

# Source bash specific functions
if [ -f ~/.config/bash/functions ]; then
	source ~/.config/bash/functions
fi

# Source generic aliases
if [ -f ~/.config/shell/aliases ]; then
	source ~/.config/shell/aliases
fi

# Source bash specific aliases 
if [ -f ~/.config/bash/aliases ]; then
	source ~/.config/bash/aliases
fi

# Source bash specific prompt 
if [ -f ~/.config/bash/prompt ]; then
	source ~/.config/bash/prompt
fi
