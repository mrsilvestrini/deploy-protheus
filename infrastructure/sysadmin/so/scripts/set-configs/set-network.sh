#!/bin/bash

# Copy folder configs to /mnt/configs/network/
#Backup files
/bin/mkdir /etc/sysconfig/network-scripts/old
/bin/cp -p /etc/sysconfig/network-scripts/* /etc/sysconfig/network-scripts/old

#set ip static ip address with template in /configs/network/
ifdown ens33
/bin/rm -f /etc/sysconfig/network-scripts/ifcfg-ens33
#Edit file /configs/netowork/ifcfg-ens33 with ip,mac,dns
/bin/cp -p /mnt/configs/network/ifcfg-ens33 /etc/sysconfig/network-scripts/
ifup ens33
