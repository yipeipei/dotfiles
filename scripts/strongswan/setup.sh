#!/usr/bin/env bash
# Setup IPsec VPN with strongSwan

# https://raymii.org/s/tutorials/IPSEC_vpn_with_CentOS_7.html

set -e

source ./configure.sh

# Install packages

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# yum -y remove epel-release

yum -y install strongswan
# yum -y remove strongswan

yum -y install haveged
systemctl enable haveged
systemctl start haveged

# Generate certificates

cd /etc/strongswan
strongswan pki --gen --type rsa --size 4096 --outform der > ipsec.d/private/${OUTPUT_ROOT}Key.der
chmod 600 ipsec.d/private/${OUTPUT_ROOT}Key.der
strongswan pki --self --ca --lifetime 3650 --in ipsec.d/private/${OUTPUT_ROOT}Key.der --type rsa --dn "C=${DN_C}, O=${DN_O}, CN=${DN_CN_ROOT}" --outform der > ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der

strongswan pki --gen --type rsa --size 2048 --outform der > ipsec.d/private/${OUTPUT_HOST}Key.der
chmod 600 ipsec.d/private/${OUTPUT_HOST}Key.der
strongswan pki --pub --in ipsec.d/private/${OUTPUT_HOST}Key.der --type rsa | strongswan pki --issue --lifetime 730 --cacert ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der --cakey ipsec.d/private/${OUTPUT_ROOT}Key.der --dn "C=${DN_C}, O=${DN_O}, CN=${DN_CN_HOST}" --san $DOMAIN --san $PUBLIC_IP  --san @$PUBLIC_IP --flag serverAuth --flag ikeIntermediate --outform der > ipsec.d/certs/${OUTPUT_HOST}Cert.der

# Configure IPSEC

cat > /etc/strongswan/ipsec.conf << EOF
# ipsec.conf - strongSwan IPsec configuration file

config setup
    charondebug="ike 2, knl 2, cfg 2, net 2, esp 2, dmn 2,  mgr 2"

conn %default
    keyexchange=ikev2
    ike=aes128-sha256-ecp256,aes256-sha384-ecp384,aes128-sha256-modp2048,aes128-sha1-modp2048,aes256-sha384-modp4096,aes256-sha256-modp4096,aes256-sha1-modp4096,aes128-sha256-modp1536,aes128-sha1-modp1536,aes256-sha384-modp2048,aes256-sha256-modp2048,aes256-sha1-modp2048,aes128-sha256-modp1024,aes128-sha1-modp1024,aes256-sha384-modp1536,aes256-sha256-modp1536,aes256-sha1-modp1536,aes256-sha384-modp1024,aes256-sha256-modp1024,aes256-sha1-modp1024!
    esp=aes128gcm16-ecp256,aes256gcm16-ecp384,aes128-sha256-ecp256,aes256-sha384-ecp384,aes128-sha256-modp2048,aes128-sha1-modp2048,aes256-sha384-modp4096,aes256-sha256-modp4096,aes256-sha1-modp4096,aes128-sha256-modp1536,aes128-sha1-modp1536,aes256-sha384-modp2048,aes256-sha256-modp2048,aes256-sha1-modp2048,aes128-sha256-modp1024,aes128-sha1-modp1024,aes256-sha384-modp1536,aes256-sha256-modp1536,aes256-sha1-modp1536,aes256-sha384-modp1024,aes256-sha256-modp1024,aes256-sha1-modp1024,aes128gcm16,aes256gcm16,aes128-sha256,aes128-sha1,aes256-sha384,aes256-sha256,aes256-sha1!
    dpdaction=clear
    dpddelay=300s
    rekey=no
    left=%any
    leftsubnet=0.0.0.0/0
    leftcert=${OUTPUT_HOST}Cert.der
    right=%any
    rightdns=8.8.8.8,8.8.4.4
    rightsourceip=10.42.42.0/24

conn IPSec-IKEv2
    keyexchange=ikev2
    auto=add

conn IPSec-IKEv2-EAP
    also="IPSec-IKEv2"
    rightauth=eap-mschapv2
    rightauthby2=pubkey
    rightsendcert=never
    eap_identity=%any

conn CiscoIPSec
    keyexchange=ikev1
    forceencaps=yes
    authby=xauthrsasig
    xauth=server
    auto=add
EOF
chmod 600 /etc/strongswan/ipsec.conf

cat > /etc/strongswan/ipsec.secrets << EOF
: RSA ${OUTPUT_HOST}Key.der

# [<domain>\]<username> : EAP "<plaintext password>" 
# alice : EAP "YzCgnveYuL429fH" 
# bob : EAP "E23pOjvW8z248iAp" 
# hipster : XAUTH "xauth_ikev1_example_password"
EOF
chmod 600 /etc/strongswan/ipsec.secrets

# Configure Firewall

systemctl enable firewalld
systemctl start firewalld

firewall-cmd --zone=dmz --permanent --add-rich-rule='rule protocol value="esp" accept' # ESP (the encrypted data packets)
firewall-cmd --zone=dmz --permanent --add-rich-rule='rule protocol value="ah" accept' # AH (authenticated headers)
firewall-cmd --zone=dmz --permanent --add-port=500/udp #IKE  (security associations)
firewall-cmd --zone=dmz --permanent --add-port=4500/udp # IKE NAT Traversal (IPsec between natted devices)
firewall-cmd --permanent --add-service="ipsec"
firewall-cmd --zone=dmz --permanent --add-masquerade
# firewall-cmd --permanent --set-default-zone=dmz
firewall-cmd --set-default-zone=dmz
firewall-cmd --reload
firewall-cmd --list-all

cat >> /etc/sysctl.conf << EOF
# VPN
net.ipv4.ip_forward = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
EOF
sysctl -p

# Start the VPN
systemctl enable strongswan
systemctl start strongswan
