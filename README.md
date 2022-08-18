1. Check OS family:
    a) redhat;
    b) debian.
2. Create user 'hes'
3. if OS redhat add user 'hes' to group wheel
    else add user 'hes' to group sudoers
4. if OS redhat disable selinux
    sed -i 's/SELINUX=enabled/SELINUX=disabled/' /etc/sysconfig/selinux    
5. add user 'hes' to sudoers with NOPASSWD
6. mkdir .ssh in ~hes
7. download public-key
8. permissions and owner\group of .ssh and files
9. configure ssh (password, listen, root)
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config