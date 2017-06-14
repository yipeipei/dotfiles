rem Run as administrator

set CONNECTION="Local Area Connection"

netsh interface ipv4 set address name=%CONNECTION% source=dhcp
netsh interface ipv4 set dnsserver name=%CONNECTION% source=dhcp

pause