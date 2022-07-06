##########################################################
# Kubernetes Cluster installation #######################
############################################################

# on Worker NODE only
# This installs K8S 1.23 version for Ubuntu OS. 

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update ; clear

# Docker installation
sudo apt-get install -y docker-ce

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker
sudo systemctl restart docker.service
sudo service docker status

### INSTALL KUBEADM,KUBELET,KUBECTL

sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update ; clear
sudo apt-get install -y kubelet=1.23.6-00 kubeadm=1.23.6-00 kubectl=1.23.6-00

# Manually run join command to join the cluster on each worker node. 

# kubeadm token create --print-join-command
