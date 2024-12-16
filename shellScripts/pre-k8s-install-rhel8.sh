#!/bin/bash

sudo swapoff -a
#permanenetly disable swap in /fstab
sudo sed -i '/swap/ s/^/#/' /etc/fstab

#disable selinux
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/; s/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config

#
cat <<EOF | sudo tee -a /etc/hosts

#kubernetes nodes
10.10.1.158 k8s-rhel-master1.sriauronet.lan k8s-rhel-master1
10.10.1.243 k8s-rhel-wn1.sriauronet.lan k8s-rhel-wn1
EOF

sudo dnf install -y iproute-tc

sudo firewall-cmd --add-masquerade --permanent

if [ $HOSTNAME == "k8s-rhel-master1.sriauronet.lan" ]; then
    sudo firewall-cmd --permanent --add-port=6443/tcp
    sudo firewall-cmd --permanent --add-port=2379-2380/tcp
    sudo firewall-cmd --permanent --add-port=10250/tcp
    sudo firewall-cmd --permanent --add-port=10251/tcp
    sudo firewall-cmd --permanent --add-port=10252/tcp
else
    sudo firewall-cmd --permanent --add-port=10250/tcp
    sudo firewall-cmd --permanent --add-port=30000-32767/tcp  
fi

sudo firewall-cmd --reload

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee -a /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

export VERSION=1.26
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_8/devel:kubic:libcontainers:stable.repo
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/CentOS_8/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo

sudo dnf install -y cri-o

sudo systemctl enable crio

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable kubelet

echo "Rebooting in 10 secs"
sleep 10
sudo reboot