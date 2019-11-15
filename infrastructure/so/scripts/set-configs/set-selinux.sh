# Copy folder configs to /mnt/configs
#lines for set string SELINUX=permissive in file
bin/cat /etc/selinux/config
/bin/mkdir /etc/selunux/old
/bin/cp -p /etc/selunux/config /etc/sysconfig/network-scripts/old
/bin/rm -f /etc/selunux/config
/bin/cp -p /mnt/configs/selinux/config /etc/selinux/

