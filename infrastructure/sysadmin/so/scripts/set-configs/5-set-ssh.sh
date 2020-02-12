#!/bin/bash

# Copy folder configs to /mnt/configs/ssh
systemctl stop sshd.service
systemctl status sshd.service

# .ssh directory: 700 (drwx------)
# public key (.pub file): 644 (-rw-r--r--)
# private key (id_rsa): 600 (-rw-------)

#After create a user, copy file /ssh/authorized_keys to /home/user/.ssh
mkdir -p /home/your_user/.ssh
chmod 700 /home/your_user/.ssh
cp -p /mnt/configs/ssh/authorized_keys /home/your_user/.ssh
chmod 644 /home/your_user/.ssh/authorized_keys
chown -R your_user:your_user /home/your_user/.ssh/

#set sshd_config
mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bkp
cp -p /mnt/configs/ssh/sshd_config /etc/ssh/

#restart ssh
systemctl start sshd.service
