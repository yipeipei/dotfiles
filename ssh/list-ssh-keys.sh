#!/usr/bin/env bash

for f in keys/id_rsa_*.pub
do
    ssh-keygen -E md5 -l -f "${f}"
done
