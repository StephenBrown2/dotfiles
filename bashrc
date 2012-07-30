# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Source bash specific functions
if [ -f ~/.bash_functions ]; then
	source ~/.bash_functions
fi

# Source generic aliases
if [ -f ~/.sh_aliases ]; then
	source ~/.sh_aliases
fi

# Source bash specific aliases 
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
