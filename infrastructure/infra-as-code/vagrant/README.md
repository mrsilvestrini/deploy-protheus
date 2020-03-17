# PROVISION VM FOR DEVELOPER

Provision VM for developer with erp protheus

Getting Started

Fork the project and enjoy.  
Atention for pre requisites and License!!!

- Prerequisites
  VMWare Workstation 14 or latest
  Vagrant

- Authors
  Marcos Silvestrini

- License
  This project is licensed under the MIT License - see the LICENSE.md file for details

- Oficial Doc
  <https://www.vagrantup.com/docs/index.html>

- Install Vagrant in Rhel Centos 8

  - Download vagrant
    <https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm>  
    sudo wget <https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm>

  - Install
    sudo yum localinstall vagrant_2.2.7_x86_64.rpm -y  
    vagrant ––version
  - Install VMWare Tools
    yum -y install kernel-devel
    <https://docs.vmware.com/en/VMware-Workstation-Pro/15.0/com.vmware.ws.using.doc/GUID-08BB9465-D40A-4E16-9E15-8C016CC8166F.html>
  - Install Open Vmware Tools
    <https://www.thegeekdiary.com/centos-rhel-how-to-install-open-virtual-machine-tools-for-virtual-machines-hosted-on-vmware/>  
    rpm -qa|grep -i open-vm\*

- Install Vagrant in Rhel Centos 8

  - Download vagrant
    <https://www.vagrantup.com/downloads.html>

- Provider VMWare Workstation

  - Install Plugins
    vagrant plugin install vagrant-vmware-desktop
    vagrant plugin list

  - Create VM  
    Create a Vagrantfile  
    Configure Network  
    Configure ssh  
    Configure Firewall (firewalld or iptables)  
    Configure Selinux  
    Configure Mounts
