#!/usr/bin/env bash

source bashrc_csr.sh

if [[ "$(hostname)" != "$CSR_BASE" ]]; then
    echo Invoke on $CSR_BASE for compatibility.
    exit
fi

brew install gcc
brew install gdb
brew install make
brew install cmake
brew install git
brew install python3
brew install boost --with-icu4c
brew install boost-python --with-python3
brew install swig
brew install libffi
brew install libxml2
brew install libxslt
brew install pv
brew install autojump
brew install fpp
brew install fzf

brew bundle dump --force --global
