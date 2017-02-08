#!/usr/bin/env bash
# Save the old file before making a symbolic link

for last; do true; done
if [ -e "${last}" ] && [ ! -L "${last}" ]; then
    mv -v "${last}" "${last}.old"
fi
ln -f -s "$@"
