# Base directory
export DOTFILES_BASH="$(dirname "$(readlink $HOME/.bashrc)")"
export DOTFILES="$(dirname "${DOTFILES_BASH}")"

# macOS
if [[ "$(uname)" == Darwin ]]; then
    source "$DOTFILES/macos/bashrc_macos.sh"
fi

# Cygwin
# e.g. CYGWIN_NT-6.1
if [[ "$(uname)" =~ CYGWIN ]]; then
    source "$DOTFILES/cygwin/bashrc_cygwin.sh"
fi

# CSR
if [[ "$(hostname)" =~ ^csr || "$(hostname)" =~ ^gpu ]] ; then
    source "$DOTFILES/csr/bashrc_csr.sh"
fi

# Set PATH
for bin in "$DOTFILES"/*/bin
do
    PATH="$bin:$PATH"
done
export PATH

# Load profile
for profile in "$DOTFILES"/*/profile
do
    source "$profile"
done

##############################################################################
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Info
ls -l $SHELL

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

# Add git branch to bash prompt
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

RESET_ALL="\[\e[0m\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"

PS1="\[\e]0;\u@\h:\w\a\]\n$GREEN\u@\h$YELLOW:\w$GREEN\$(__git_ps1) $YELLOW\$?$RESET_ALL\n\$ "

# History
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Display
env | grep DISPLAY

# Python
export PYTHONSTARTUP="$DOTFILES/python/pythonstartup.py"
echo python3: "$(python3 --version)"

# Screen
screen -ls

# Aliases
alias .,='source $HOME/.bashrc'
alias .mvrc='mv $HOME/.bashrc $HOME/.bashrc.mv || mv $HOME/.bashrc.mv $HOME/.bashrc'
alias .sh='env -i /bin/sh'
alias .bash='env -i /bin/bash --noprofile --norc'
alias c='clear'
alias e='emacs'
alias g='git'
alias gg='(cd ~/wd/git/gh; for r in *; do echo $r; cd $r; git pp; cd ..; done)'
alias bb='(cd ~/wd/git/bb; for r in *; do echo $r; cd $r; git pp; cd ..; done)'
alias m='make'
alias p='python3'
alias i='ipython'
alias s='grep -nir --colour=auto'

# Load rc
for rc in "$DOTFILES"/*/rc
do
    source "$rc"
done
