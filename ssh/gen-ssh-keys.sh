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
    if [ ! -f "keys/id_rsa_${d}" ]; then
        echo "Generating a new SSH key for ${d}"
        ssh-keygen -t rsa -b 4096 -C "Peipei on ${d}" -f "keys/id_rsa_${d}"
    fi
    chmod 600 "keys/id_rsa_${d}"
    chmod 644 "keys/id_rsa_${d}.pub"
done
