#!/usr/bin/env bash

date
hostname
echo "test crontab"

for i in $(seq 30 69)
do
    ssh "csr$i" find "/tmp/$USER" -exec touch {} \+
done
