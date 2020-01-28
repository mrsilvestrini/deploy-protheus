#!/bin/bash

# Copy folder configs to /mnt/configs/ssh
/bin/systemctl stop sshd.service
/bin/systemctl status sshd.service

# .ssh directory: 700 (drwx------)
# public key (.pub file): 644 (-rw-r--r--)
# private key (id_rsa): 600 (-rw-------)

#After create a user, copy file /ssh/authorized_keys to /home/user/.ssh
/bin/mkdir -p /home/your_user/.ssh
/bin/chmod 700 /home/your_user/.ssh
/bin/cp -p /mnt/configs/ssh/authorized_keys /home/your_user/.ssh
/bin/chmod 644 /home/your_user/.ssh/authorized_keys
/bin/chown -R your_user:your_user /home/your_user/.ssh/

#set sshd_config
/bin/mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bkp
/bin/cp -p /mnt/configs/ssh/sshd_config /etc/ssh/

#restart ssh
/bin/systemctl start sshd.service
