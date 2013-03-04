# ~/.bash_profile

# Awesome informational blog post here:
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

# Source user bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Source environment variables
if [ -f ~/.sh_env_vars ]; then
    source ~/.sh_env_vars
fi
