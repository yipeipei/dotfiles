#!/usr/bin/env bash

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

brew bundle dump --force --global

