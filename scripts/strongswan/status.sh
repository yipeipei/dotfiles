#!/usr/bin/env bash

set -o xtrace

source ./configure.sh

ssh -tt $LOGIN_USER@$DOMAIN << EOF
ls

sudo su << EOD
strongswan status
EOD

exit
EOF
