# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Info
ls -l $SHELL

# Autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Base directory
export DOTFILES_BASH="$(dirname "$(readlink $HOME/.bashrc)")"
export DOTFILES="$(dirname "${DOTFILES_BASH}")"

# PATH
export PATH="$DOTFILES/bash/do:$PATH"
export PATH="$DOTFILES/python/do:$PATH"

# SSH
source "$DOTFILES/ssh/auto-launch-ssh-agent.sh"
ssh-add -l -E md5

# Git
source "$DOTFILES/git/gitrc.sh"
env | grep GIT_

# Autocomplete git commands, branch and tag names
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# History
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Cygwin
# e.g. CYGWIN_NT-6.1
if [[ "$(uname)" =~ "CYGWIN" ]]; then
    source "$DOTFILES/cygwin/bashrc_cygwin.sh"
fi

# CSR
if [[ "$(hostname)" =~ "^csr" ]]; then
    source "$DOTFILES/csr/bashrc_csr.sh"
fi
