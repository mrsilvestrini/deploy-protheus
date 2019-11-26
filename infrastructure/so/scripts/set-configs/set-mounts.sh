#lines for set mounts,my case use fstab in /etc/fstab
echo 'Stop SMB Service...'
/bin/systemctl stop smb
/bin/systemctl stop nmb

echo 'Check Status SMB Services...'
/bin/systemctl status smb
/bin/systemctl status nmb

echo 'Umount Share...'
/bin/umount your_file_system_share

ECHO 'Backup Files...'
/bin/mv /etc/fstab /etc/fstab_old

echo 'Update Files...'
/bin/cp -p /mnt/configs/mounts/fstab /etc/

echo 'Start SMB Service...'
/bin/systemctl start smb
/bin/systemctl start nmb

echo 'Check Status SMB Services...'
/bin/systemctl status smb
/bin/systemctl status nmb

echo 'Mount Share...'
/bin/mount your_file_system_share

echo 'Test Mount...'
/bin/ls -la your_file_system_share