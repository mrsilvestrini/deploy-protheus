#!/bin/bash

#lines for set mounts,my case use fstab in /etc/fstab
echo 'Stop SMB Service...'
/bin/systemctl stop smb
/bin/systemctl stop nmb

echo 'Check Status SMB Services...'
/bin/systemctl status smb
/bin/systemctl status nmb

echo 'Umount Share...'
umount your_file_system_share

ECHO 'Backup Files...'
mv /etc/fstab /etc/fstab_old

echo 'Update Files...'
cp -p /mnt/configs/mounts/fstab /etc/

echo 'Start SMB Service...'
systemctl start smb
systemctl start nmb

echo 'Check Status SMB Services...'
systemctl status smb
systemctl status nmb

echo 'Mount Share...'
mount your_file_system_share

echo 'Test Mount...'
ls -la your_file_system_share
