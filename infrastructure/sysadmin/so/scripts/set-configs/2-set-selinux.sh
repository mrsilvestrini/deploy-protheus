#!/bin/bash

# Copy folder configs to /mnt/configs
#lines for set string SELINUX=permissive in file
cat /etc/selinux/config
rm -rf /etc/selinux/old
mkdir /etc/selinux/old
cp -p /etc/selinux/config /etc/sysconfig/network-scripts/old
rm -f /etc/selinux/config
cp -p /mnt/configs/selinux/config /etc/selinux/
