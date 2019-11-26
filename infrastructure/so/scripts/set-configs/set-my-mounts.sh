#lines for set mounts,my case use fstab in /etc/fstab
echo 'Stop SMB Service...'
/bin/systemctl stop smb
/bin/systemctl stop nmb
/bin/sleep 5
/bin/clear

echo 'Check Status SMB Services...'
/bin/systemctl status smb
/bin/systemctl status nmb
/bin/sleep 5
/bin/clear

echo 'Umount Share...'
/bin/findmnt | /bin/grep projects
/bin/umount -l  /mnt/projects
/bin/umount -f  /mnt/projects
/bin/sleep 5
/bin/clear

echo 'Backup Files...'
/bin/mv /etc/fstab /etc/fstab_old
/bin/ls /etc/  | /bin/grep fstab
/bin/sleep 5
/bin/clear

echo 'Update Files...'
/bin/cp -p /mnt/configs/mounts/my-fstab /etc/fstab
/bin/chmod 644 /etc/fstab
/bin/ls -la /etc/  | /bin/grep fstab
/bin/sleep 5
/bin/clear

echo 'Start SMB Service...'
/bin/systemctl start smb
/bin/systemctl start nmb
/bin/sleep 5
/bin/clear

echo 'Check Status SMB Services...'
/bin/systemctl status smb
/bin/systemctl status nmb
/bin/sleep 5
/bin/clear

echo 'Restart server...'
/bin/sleep 5
init 6