#!/bin/bash

## Error if something goes wrong
set -e

INSTALL_DIR=/tmp/kickguest-win10-vmware/provision

apt-get update

## We want empty passwords for ssh:
echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

## Install the packages
apt-get install -y docker.io curl git pwgen whois virtualbox-guest-additions-iso virtualbox-guest-utils  vim

## Allow normal user to access docker command
gpasswd -a user docker

## Remove the default password from user (login without passwd)
passwd -d user

## Allow empty passwords for ssh (mark as secure tty) - dangerous.
echo ssh >> /etc/securetty

## Copy files
rm -f /etc/update-motd.d/*

## Copy: Recursive is lower case -r -- why ever
cp -r $INSTALL_DIR/etc/rc.local /etc/
chmod +x /etc/rc.local

cp -r $INSTALL_DIR/etc/update-motd.d/* /etc/update-motd.d/
chmod +x /etc/update-motd.d/*

cp $INSTALL_DIR/etc/issue /etc/

echo "DONE!"


