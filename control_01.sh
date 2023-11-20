#!/bin/bash

# set hostname of control node 
sudo hostnamectl set-hostname "control"
# update packages
sudo apt update
# Install dependencies
sudo apt install software-properties-common -y
# Add Ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible
# Install Ansible
sudo apt install ansible -y
# Create user ansible with password ansible and give sudo permission
sudo useradd -m -s /bin/bash -c "ansible" ansible
sudo echo "ansible:ansible" | sudo chpasswd
sudo echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
# Create SSH keys for user ansible
sudo -u ansible ssh-keygen -t rsa -N "" -f /home/ansible/.ssh/id_rsa
# Create SSH config file
sudo cat <<EOF > /home/ansible/.ssh/config
Host node01
    HostName node01
    User ansible
    IdentityFile /home/ansible/.ssh/id_rsa
    StrictHostKeyChecking no
EOF

# if you have more than one node :

# cat <<EOF > /home/ansible/.ssh/config
# Host node01
#     HostName node02
#     User ansible
#     IdentityFile /home/ansible/.ssh/id_rsa
#     StrictHostKeyChecking no
# EOF

 



