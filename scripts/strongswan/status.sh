#!/usr/bin/env bash

source ./configure.sh

ssh -tt ec2-user@$DOMAIN << EOF
ls

sudo su << EOD
strongswan status
EOD

exit
EOF
