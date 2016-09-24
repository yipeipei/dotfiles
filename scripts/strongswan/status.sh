#!/usr/bin/env bash

set -o xtrace

source ./configure.sh

ssh -tt ec2-user@$DOMAIN << EOF
ls

sudo su << EOD
strongswan status
EOD

exit
EOF
