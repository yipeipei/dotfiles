# strongswan

## Prerequisite

- 1 CentOS/RHEL 7 server
- 1 public IP address
- root access

## Test

```bash
./configure.sh
```

## Setup IPSec VPN server

```bash
./setup.sh
```

The VPN server supports three types of VPN services:
- IKEv2 + RSA certificate,
- IKEv2 + EAP, and
- IKEv1 + XAUTH RSA

## Generate client certificate

```bash
./add.sh NAME EMAIL
```

Send `NAME.p12` and its export paraphrase to the client. Additionally, send `/etc/strongswan/ipsec.d/cacerts/${OUTPUT_ROOT}Cert.pem` if for iOS.

## Revoke client certificate

```bash
./revoke.sh NAME
```

## Add user account

```
/etc/strongswan/ipsec.secrets
```

Clients

- iOS clients below iOS 8 need to use IKEv1. iOS 8+ supports IKEv2.
- OS X does not support IKEv2 (not on 10.10) so need to use IKEv1.
- Android 4+ and Windows 7+ support IKEv2.

## Client configuration

### OS X

1. open `Keychain.app`
2. import `NAME.p12` into the System keychain (not the login),
   then mark the Root CA as trusted for IPSec
3. in the Access Control tab of the private key, make sure `/usr/sbin/racoon`
   is  allowed to access it.
4. add VPN Connection (Cisco IPSec)

### iOS

1. install `${OUTPUT_ROOT}Cert.pem` and `NAME.p12`
2. add IPSec and use Certificate

### Windows

1. run `mmc`, add the `Certificates` Snap-In (for `Computer account`)
2. import `NAME.p12` into `Certificates (Local Computer)\Trusted Root Certification Authorities\Certificates` store
3. add VPN Connection

### Android

1. install the StrongSwan app
2. `Add VPN Profile`
   (Gateway: IP/Hostname of VPN server, Type: IKEv2 Certificate, CA Certificate: Select automatically)
3. `Select user certificate`, install `NAME.p12`

## Misc

### Show connections

```bash
strongswan status
strongswan statusall
```

### List host certs

```bash
strongswan listcerts
```

### Restart VPN server

```bash
strongswan restart
```

### View certificate properties

```bash
strongswan pki --print --in /etc/strongswan/ipsec.d/cacerts/${OUTPUT_ROOT}Cert.der
# or
openssl x509 -inform DER -in /etc/strongswan/ipsec.d/certs/${OUTPUT_HOST}Cert.der -noout -text
```