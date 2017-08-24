#!/usr/bin/env bash

date
curl --connect-timeout 10 --max-time 60 --silent https://ipinfo.io/json
ifconfig
iwlist wlan0 scan
