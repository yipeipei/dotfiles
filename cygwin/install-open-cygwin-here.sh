#!/usr/bin/env bash
# Add "Open Cygwin Here" folder context menu
# Run Cygwin as administrator

apt-cyg install chere
chere -i -t mintty -s bash -e "Open Cygwin Here" -f
