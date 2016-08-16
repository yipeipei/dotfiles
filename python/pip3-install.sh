#!/usr/bin/env bash
# Install pip and other packages

# Bootstrapping the pip installer
python3 -m ensurepip --upgrade

pip3 install --upgrade pip
pip3 install --upgrade youtube-dl
pip3 install --upgrade you-get
pip3 install --upgrade pythonpy
pip3 install --upgrade scrapy
pip3 install --upgrade flask
pip3 install --upgrade requests
pip3 install --upgrade numpy
pip3 install --upgrade networkx

pip3 freeze > requirements.txt
