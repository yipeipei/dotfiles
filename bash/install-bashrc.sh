#!/usr/bin/env bash
# Deprecated.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bashrc="\"${DIR}/bashrc.sh\""
rclist=(
    ~/.bashrc
    ~/.zshrc
    )

for rc in "${rclist[@]}"
do
    if [ -f ${rc} ]; then
        if [[ $( grep ${bashrc}  ${rc}) ]]; then
            echo Already installed ${bashrc} to ${rc}.
        else
            echo Installing ${bashrc} to ${rc}.
            echo >> ${rc}
            echo source ${bashrc} >> ${rc}
            echo Done.
        fi
    fi
done
