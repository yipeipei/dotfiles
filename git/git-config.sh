#!/usr/bin/env bash

# Clean
> .gitconfig
> .gitignore_global

# Global gitignore
curl https://www.gitignore.io/api/osx,linux,windows,xcode,visualstudio,jetbrains,eclipse,sublimetext,emacs,vim > .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Add subcommand: git ignore
git config --global alias.ignore '!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi'

# First-Time Git Setup
git config --global user.name "YI Peipei"
git config --global user.email "yipeipei@gmail.com"

# Dealing with line endings
git config --global core.autocrlf input
# Configure Git on OS X or Linux to properly handle line endings

# git config --global core.autocrlf true
# Configure Git on Windows to properly handle line endings

# Aliases
git config --global alias.pp "!git pull && git push"
git config --global alias.st "status -sb"
git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.au "add -u"
git config --global alias.ci "commit"
git config --global alias.ca "commit --amend"
git config --global alias.cp "cherry-pick"
git config --global alias.unstage "reset HEAD --"

git config --global alias.lo "log --oneline"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lc "log ORIG_HEAD.. --stat --no-merges"
git config --global alias.last "log -1 --stat"

git config --global alias.df "diff"
git config --global alias.dfc "diff --cached"
git config --global alias.dc "diff --color-words='[A-z0-9_]+|[^[:space:]]'"
git config --global alias.dcc "diff --color-words='[A-z0-9_]+|[^[:space:]]' --cached"

git config --global alias.who "shortlog -s --"

# GitHub Flow
# http://haacked.com/archive/2014/07/28/github-flow-aliases/
git config --global alias.up "!git pull --rebase --prune $@ && git submodule update --init --recursive"
git config --global alias.undo "reset --hard"
git config --global alias.save "!git add -A && git commit -m 'SAVEPOINT'"
git config --global alias.wip "commit -am 'WIP'"
git config --global alias.cont "reset HEAD~1 --mixed"
git config --global alias.wipe "wipe = !git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard"
