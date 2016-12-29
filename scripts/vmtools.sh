#!/bin/bash

#This works with Centos 7.3, download file through vmware since default tools won't compile hgfs
VMTOOLS=VMwareTools-10.1.0-4449150.tar.gz

echo "Installing vmware tools"
yum -y install perl fuse-libs gcc gcc-c++ make binutils open-vm-tools kernel-devel
#perform tools install
tar -xzvf /tmp/$VMTOOLS -C /tmp/
sudo /tmp/vmware-tools-distrib/vmware-install.pl -d
