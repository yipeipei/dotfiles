rem Run as administrator

set CONNECTION="Local Area Connection"

set IPV4_ADDRESS=158.182.9.170
set SUBNET_MASK=255.255.255.0
set DEFAULT_GATEWAY=158.182.9.2
set DHCP_SERVER=158.182.7.3
set PREFERRED_DNS_SERVER=158.182.7.12
set ALTERNATE_DNS_SERVER=158.182.7.13
set PRIMARY_WINS_SERVER=158.182.7.121
set SECONDARY_WINS_SERVER=158.182.7.122

netsh interface ipv4 set address name=%CONNECTION% source=static addr=%IPV4_ADDRESS% mask=%SUBNET_MASK% gateway=%DEFAULT_GATEWAY%
netsh interface ipv4 set dnsserver name=%CONNECTION% source=static addr=%PREFERRED_DNS_SERVER%
netsh interface ipv4 add dnsserver name=%CONNECTION% addr=%ALTERNATE_DNS_SERVER% index=2
netsh interface ipv4 set winsserver name=%CONNECTION% source=static addr=%PRIMARY_WINS_SERVER%
netsh interface ipv4 add winsserver name=%CONNECTION% addr=%SECONDARY_WINS_SERVER% index=2

pause