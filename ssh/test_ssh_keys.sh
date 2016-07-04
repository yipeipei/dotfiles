#!/usr/bin/env bash

for f in keys/id_rsa_*.pub
do
    echo "Challenge ${f%.pub}"
    ssh-keygen -y -f "${f%.pub}"
done
