#!/usr/bin/env bash
# Secure servers

# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers/
# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/

# Change the root password
# passwd

# Update the default system applications
yum -y update

# Install fail2ban
yum -y install fail2ban

# Install logwatch to keep an eye on things
yum -y install logwatch
cat > /etc/cron.daily/00logwatch << EOF
/usr/sbin/logwatch --output mail --mailto yipeipei@gmail.com --detail high
EOF
