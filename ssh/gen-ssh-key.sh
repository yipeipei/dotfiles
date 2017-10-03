#!/usr/bin/env bash

DATE_TIME="$(date +%Y-%m-%d\ %H:%M:%S\ %z)"
ssh-keygen -t rsa -b 4096 -C "$USER@$HOSTNAME on $DATE_TIME"
