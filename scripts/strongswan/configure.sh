#!/usr/bin/env bash

set -o xtrace

# Server info
DOMAIN="one.yipeipei.com"
PUBLIC_IP=$(curl ipv4.icanhazip.com)

# Distinguished name
DN_C="HK"
DN_O="YI Peipei"
DN_CN_ROOT="Peipei Root CA"
DN_CN_HOST="$DOMAIN"

# Output file
OUTPUT_ROOT="PeipeiCA"
OUTPUT_HOST="$DOMAIN"

if [ -z "$PUBLIC_IP" ]; then
    echo Can not get public IP.
    exit
fi
