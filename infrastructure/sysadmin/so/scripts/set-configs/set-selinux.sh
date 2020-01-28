#!/bin/bash

# Copy folder configs to /mnt/configs
#lines for set string SELINUX=permissive in file
/bin/cat /etc/selinux/config
/bin/rm -rf /etc/selinux/old
/bin/mkdir /etc/selinux/old
/bin/cp -p /etc/selinux/config /etc/sysconfig/network-scripts/old
/bin/rm -f /etc/selinux/config
/bin/cp -p /mnt/configs/selinux/config /etc/selinux/
