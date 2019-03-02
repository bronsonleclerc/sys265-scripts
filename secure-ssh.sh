#!/bin/bash

useradd $1
mkdir -p /home/$1/.ssh/
mkdir /home/$1/.ssh/authorized_keys2
cp /home/bronson/sys265-scripts/sys265.pub /home/$1/.ssh/authorized_keys.pub
cp /home/bronson/sys265-scripts/sys265.pub /home/$1/.ssh/authorized_keys2/authorized_keys.pub
chmod 700 /home/$1/.ssh
chmod 640 /home/$1/.ssh/authorized_keys2
chmod 600 /home/$1/.ssh/authorized_keys.pub
chown -R $1:$1 /home/$1/.ssh
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{ s//PermitRootLogin no/g; }' /etc/ssh/sshd_config

