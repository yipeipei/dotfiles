# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Info
ls -l $SHELL

# Autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Base directory
export DOTFILES_BASH="$(dirname "$(readlink $HOME/.bashrc)")"
export DOTFILES="$(dirname "${DOTFILES_BASH}")"

# SSH
source "$DOTFILES/ssh/auto-launch-ssh-agent.sh"
ssh-add -l -E md5

# Git
source "$DOTFILES/git/gitrc.sh"
env | grep GIT_

# History
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# CSR
if [[ "$(hostname)" =~ "^csr" ]]; then
    soruce "$DOTFILES/csr/bashrc_csr.sh"
fi
