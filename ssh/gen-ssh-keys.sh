#!/usr/bin/env bash

devices=(
    "one"
    "two"
    "iPad"
    "iPhone"
    "MacBook"
    "cs9170"
    )

for d in "${devices[@]}"
do
    if [ ! -f "id_rsa_${d}" ]; then
        echo "Generating a new SSH key for ${d}"
        ssh-keygen -t rsa -b 4096 -C "Peipei on ${d}" -f "id_rsa_${d}"
    fi
done
