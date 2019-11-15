INSTALLATION AND CONFIGURANTION ORACLE LINUX 8.0

Installation and configuration oracle linux 8.0 for base of project

Getting Started

- Fork the project and enjoy.
- Atention for pre requisites and License!!!

Prerequisites

- VMWare Workstation 14 or latest

Authors

- Marcos Silvestrini

License

- This project is licensed under the MIT License - see the LICENSE.md file for details

Oficial Doc

- https://oracle-base.com/articles/linux/oracle-linux-8-installation

Create a VM in VMWare

- Download file .ils
  https://edelivery.oracle.com/osdc/faces/SoftwareDelivery

- Create Template in VMWare
  https://oracle-base.com/articles/linux/oracle-linux-8-installation

- Cleanup Image in case of Clone
  https://community.spiceworks.com/how_to/151558-create-a-rhel-centos-6-7-template-for-vmware-vsphere)

- Configure Image

  - Configure Network
    https://linuxconfig.org/rhel-8-configure-static-ip-address

  - Configure ssh
    https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-rhel-8/

  - Configure Firewall (firewalld or iptables)
    systemctl stop firewalld
    systemctl disable firewalld

  - Configure Selinux
    https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_selinux/changing-selinux-states-and-modes_using-selinux

  - Configure Mounts
    https://www.techotopia.com/index.php/Sharing_Files_between_RHEL_and_Windows_Systems_with_Samba
