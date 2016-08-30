#!/bin/bash

echo "Installing open vm tools"
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install -y open-vm-tools
mkdir /mnt/hgfs
