#!/bin/bash

#lines for set mounts,my case use fstab in /etc/fstab
echo 'Stop SMB Service...'
systemctl stop smb
systemctl stop nmb
sleep 5
clear

echo 'Check Status SMB Services...'
systemctl status smb
systemctl status nmb
sleep 5
clear

echo 'Umount Share...'
findmnt | grep projects
umount -l /mnt/projects
umount -f /mnt/projects
sleep 5
clear

echo 'Backup Files...'
mv /etc/fstab /etc/fstab_old
ls /etc/ | grep fstab
sleep 5
clear

echo 'Update Files...'
cp -p /mnt/configs/mounts/my-fstab /etc/fstab
chmod 644 /etc/fstab
ls -la /etc/ | grep fstab
sleep 5
clear

echo 'Start SMB Service...'
systemctl start smb
systemctl start nmb
sleep 5
clear

echo 'Check Status SMB Services...'
systemctl status smb
systemctl status nmb
sleep 5
