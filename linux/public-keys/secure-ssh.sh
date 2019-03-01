#!/bin/bash
#SECURE-SSH.SH
#AUTHOR BRONSONLECLERC
#Creates a new ssh user called $1
#Adds a public key to that users authorized keys file
#Removes roots ability to ssh in
useradd $1
mkdir -p /home/$1/.ssh/
cp /home/bronson/sys265-scripts/linux/public-keys/sys265.pub /home/$1/.ssh/authorized_keys.pub
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys.pub
chown -R $1:$1 /home/$1/.ssh
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{ s//PermitRootLogin no/g; }' /etc/ssh/sshd_config

