#!/usr/bin/env bash

set -o xtrace

source ./configure.sh

ssh -D 8080 -C -N $LOGIN_USER@$DOMAIN -vvv
