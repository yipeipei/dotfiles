#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Info
ls -l $SHELL

# Autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Zsh
if [ -n "$ZSH_VERSION" ]; then
    export ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="babun"
    plugins=(git)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    source $ZSH/oh-my-zsh.sh
fi

# Base directory
export DOTFILES_BASH="$(dirname "$(readlink $HOME/.bashrc)")"
export DOTFILES="$(dirname "${DOTFILES_BASH}")"

# SSH
source "$DOTFILES/ssh/auto-launch-ssh-agent.sh"
ssh-add -l -E md5

# Git
source "$DOTFILES/git/gitrc.sh"

# History
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# CSR
if [[ "$(hostname)" =~ "^csr" ]]; then
    soruce "$DOTFILES/csr/bashrc_csr.sh"
fi
