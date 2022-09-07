#!/bin/bash
useradd hes
usermod -aG wheel hes
sed -i 's/SELINUX=enabled/SELINUX=disabled/' /etc/sysconfig/selinux
echo 'hes        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
mkdir /home/hes/.ssh
wget -P /home/hes/.ssh https://raw.githubusercontent.com/chupikoff/install/main/authorized_keys
chown -R hes. /home/hes
chmod 0700 /home/hes/.ssh
chmod 0600 /home/hes/.ssh/authorized_keys
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i '#ListenAddress 0.0.0.0/ListenAddress 88.85.89.70/' /etc/ssh/sshd_config
sed -i '#PermitRootLogin yes/PermitRootLogin no' /etc/ssh/sshd_config
echo "alias s='sudo su -'" >> /home/hes/.bashrc
timedatectl set-timezone Europe/Amsterdam
reboot