#!/bin/bash
if ! id -u hes > /dev/null 2>&1; then
  useradd hes
fi
usermod -aG wheel hes
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
echo 'hes        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
mkdir /home/hes/.ssh
if ! [ -f /home/hes/.ssh/authorized_keys ]; then
  wget -P /home/hes/.ssh https://raw.githubusercontent.com/chupikoff/install/main/authorized_keys
fi
chown -R hes. /home/hes
chmod 0700 /home/hes/.ssh
chmod 0600 /home/hes/.ssh/authorized_keys
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i '/#ListenAddress 0.0.0.0/ListenAddress 88.85.89.70/' /etc/ssh/sshd_config
sed -i '/#PermitRootLogin yes/PermitRootLogin no' /etc/ssh/sshd_config
echo "alias s='sudo su -'" >> /home/hes/.bashrc
timedatectl set-timezone Europe/Amsterdam
reboot
