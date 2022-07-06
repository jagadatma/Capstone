#!/bin/bash

# Instalation of Ansible
sudo apt-get update -y
sudo apt install ansible


# Installation of PIP and Boto
sudo apt-get update -y
sudo apt install python3-pip
pip install boto


# Installation of Ansible AWS EC2 module since it is not part of Ansible core installation. 

#ansible-galaxy collection install amazon.aws


# Creating ID RSA key pair for Ansible use. 

echo "Creating RSA Key Pair"
ssh-keygen -t rsa
echo "Adding Public key to Authorized keys"
cat $HOME/.ssh/id_rsa.pub >> authorized_keys

echo "Creating a var file.But add the access key and secret to it manually."
mkdir -p $HOME/capstone
cd $HOME/capstone
touch vars

# Create inventory files for ansible
echo "Creating inventory file for ansible"
sudo mkdir -p /etc/ansible
sudo touch /etc/ansible/hosts
#sudo echo "[webserver]" >> /etc/ansible/hosts
#sudo echo "localhost"   >> /etc/ansible/hosts
