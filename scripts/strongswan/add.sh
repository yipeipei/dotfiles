#!/usr/bin/env bash

set -e

source ./configure.sh

if [[ $# -ne 2 ]]; then
    echo Usage: ./add.sh NAME EMAIL
    exit
fi
NAME=$1
EMAIL=$2

cd /etc/strongswan/
strongswan pki --gen --type rsa --size 2048 --outform der > ipsec.d/private/${NAME}Key.der
chmod 600 ipsec.d/private/${NAME}Key.der
strongswan pki --pub --in ipsec.d/private/${NAME}Key.der --type rsa | strongswan pki --issue --lifetime 730 --cacert ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der --cakey ipsec.d/private/${OUTPUT_ROOT}Key.der --dn "C=${DN_C}, O=${DN_O}, CN=${EMAIL}" --san "${EMAIL}" --outform der > ipsec.d/certs/${NAME}Cert.der

cd /etc/strongswan/
openssl rsa -inform DER -in ipsec.d/private/${NAME}Key.der -out ipsec.d/private/${NAME}Key.pem -outform PEM
openssl x509 -inform DER -in ipsec.d/certs/${NAME}Cert.der -out ipsec.d/certs/${NAME}Cert.pem -outform PEM
openssl x509 -inform DER -in ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der -out ipsec.d/cacerts/${OUTPUT_ROOT}Cert.pem -outform PEM
chmod 600 ipsec.d/private/${NAME}Key.pem

openssl pkcs12 -export  -inkey ipsec.d/private/${NAME}Key.pem -in ipsec.d/certs/${NAME}Cert.pem -name "${NAME}'s VPN Certificate"  -certfile ipsec.d/cacerts/${OUTPUT_ROOT}Cert.pem -caname "${DN_CN_ROOT}" -out ${NAME}.p12
