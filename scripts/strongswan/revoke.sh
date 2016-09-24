#!/usr/bin/env bash

source ./configure.sh

if [[ $# -ne 1 ]]; then
    echo Usage: ./revoke.sh NAME
    exit
fi
NAME=$1

cd /etc/strongswan

if [[ ! -f ipsec.d/crls/crl.der ]]; then
    strongswan pki --signcrl --reason key-compromise --cacert ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der --cakey ipsec.d/private/${OUTPUT_ROOT}Key.der --cert ipsec.d/certs/${NAME}Cert.der --outform der > ipsec.d/crls/crl.der
else
    cp ipsec.d/crls/crl.der ipsec.d/crl.der.tmp
    strongswan pki --signcrl --reason key-compromise --cacert ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der --cakey ipsec.d/private/${OUTPUT_ROOT}Key.der --cert ipsec.d/certs/${NAME}Cert.der --lastcrl ipsec.d/crl.der.tmp --outform der > ipsec.d/crls/crl.der
    rm ipsec.d/crl.der.tmp
fi

strongswan restart
