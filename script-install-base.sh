#!/bin/bash
sudo apt-get -y install git iptables net-tools openssh-client openssh-server sudo
# Agrego user linux a sudoers
sudo usermod -a -G sudo linux
