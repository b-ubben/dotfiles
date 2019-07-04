export PATH
PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=~/.npm-global/bin:$PATH
export PS1="\w $ "
alias vim="nvim"
alias dev-init="cd ~/dev && tmux new -s dev"
alias ls="lsd"
export PATH=$PATH:$HOME/Library/Python/3.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /Users/fleshprisonmonolith/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fleshprisonmonolith/google-cloud-sdk/path.bash.inc' ]; then . '/Users/fleshprisonmonolith/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fleshprisonmonolith/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/fleshprisonmonolith/google-cloud-sdk/completion.bash.inc'; fi
