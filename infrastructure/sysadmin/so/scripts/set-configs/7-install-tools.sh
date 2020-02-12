#!/bin/bash

# Update Packages
yum update -y && yum upgrade -yum
yum clean all

# Install dos2unix
yum install -y dos2unix
dos2unix --version

# install vim
yum install -y vim

# Install cifs-util(smb)
yum install -y cifs-utils

# Install net-tools
yum install -y net-tools

# Install nmap
yum install -y nmap
nmap --version

# Install telnet
yum install -y telnet

# Install git
yum install -y git
git --version

# install wget
yum install -y wget
wget --version

# Install Apache
yum install -y httpd

# Install Links web browser - https://www.tecmint.com/command-line-web-browsers/
yum install -y links
links -version

# Install webmin - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-webmin-on-centos-7
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.740-1.noarch.rpm
rpm -ivh webmin-*.rpm
Access: http://centreon.silvestrini:10000/

# Install gcc compiler
yum install -y gcc
gcc --version

# Install java
yum install -y java
java -version
