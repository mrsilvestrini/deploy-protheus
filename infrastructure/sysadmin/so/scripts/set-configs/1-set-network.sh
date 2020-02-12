#!/bin/bash

# Copy folder configs to /mnt/configs/network/
#Backup files
mkdir /etc/sysconfig/network-scripts/old
cp -p /etc/sysconfig/network-scripts/* /etc/sysconfig/network-scripts/old

#set ip static ip address with template in /configs/network/
ifdown ens33
rm -f /etc/sysconfig/network-scripts/ifcfg-ens33
#Edit file /configs/netowork/ifcfg-ens33 with ip,mac,dns
cp -p /mnt/configs/network/ifcfg-ens33 /etc/sysconfig/network-scripts/
ifup ens33
