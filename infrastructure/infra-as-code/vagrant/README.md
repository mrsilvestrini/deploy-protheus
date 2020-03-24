# PROVISION VM FOR DEVELOPER

## Provision VM for developer with erp protheus

## Getting Started

Fork the project and enjoy.  
Atention for pre requisites and License!!!

## Prerequisites

Virtual Box
Vagrant

## Authors

Marcos Silvestrini

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Oficial Doc

<https://www.vagrantup.com/docs/index.html>

## Install Vagrant in Rhel Centos 7\8

## Download vagrant

    <https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm>
    sudo wget <https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm>

## Install

    sudo yum localinstall vagrant_2.2.7_x86_64.rpm -y
    vagrant ––version

## Create Box Red Hat 7

    vagrant init
    edit file with content:

    Vagrant.configure("2") do |config|
    config.vm.box = "iamseth/rhel-7.3"
    config.vm.box_version = "1.0.0"
    end

    Configure Network
    Configure ssh
    Configure Firewall (firewalld or iptables)
    Configure Selinux
    Configure Mounts
