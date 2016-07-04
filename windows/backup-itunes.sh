#!/usr/bin/env bash

# iTunes Library.itl
# iTunes Library Extras.itdb
# iTunes Library Genius.itdb
for f in ${HOME}/Music/iTunes/*.it*
do
    cp -v -a "${f}" "${HOME}/Google Drive/Music/iTunes"
done
