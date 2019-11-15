# Copy folder configs to /mnt/configs/ssh
/bin/systemctl stop sshd.service
/bin/systemctl status sshd.service
/bin/mkdir /.ssh
/bin/cp -p /mnt/configs/ssh/* /.ssh/
# .ssh directory: 700 (drwx------)
/bin/chmod 700 /.ssh
# public key (.pub file): 644 (-rw-r--r--)
/bin/chmod 644 /.ssh/id_rsa.pub
# private key (id_rsa): 600 (-rw-------)
/bin/chmod 600 /.ssh/id_rsa
#After create a user, copy folder /.ssh to /home/user/
/bin/cp -p -R /.ssh/ /home/marcos.silvestrini
#restart ssh
/bin/systemctl start sshd.service
/bin/systemctl status sshd.service


