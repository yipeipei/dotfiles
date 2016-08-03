#!/usr/bin/env bash
# Generate fingerprint for AWS EC2 key pair

if [[ $# -ne 1 ]]; then
    echo Usage: ./ec2-fingerprint-key.sh FILE
    exit
fi

if [[ "$1" =~ pem$ ]]; then
    # AWS generated and downloaded
    # SHA1 hash of the private key
    openssl pkcs8 -in "$1" -nocrypt -topk8 -outform DER | openssl sha1 -c
else
    # User uploaded
    # SSH2 MD5 fingerprint of uploaded public key
    if [[ "$1" =~ pub$ ]]; then
        # Provided public key
        ssh-keygen -f "$1" -e -m PKCS8 | openssl pkey -pubin -pubout -outform DER | openssl md5 -c
    else
        # Provided private key
        openssl pkey -in "$1" -pubout -outform DER | openssl md5 -c
    fi
fi
