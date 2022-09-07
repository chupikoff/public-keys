#!/bin/bash
useradd hes
usermod -aG wheel hes
sed -i 's/SELINUX=enabled/SELINUX=disabled/' /etc/sysconfig/selinux
echo 'hes        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
mkdir /home/hes/.ssh