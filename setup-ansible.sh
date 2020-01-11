#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

while true; do
    read -p "Do you wish to install Anisble? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer Yes or No.";;
    esac
done

ANSIBLE_VERSION=2.9.2-1

apt-mark unhold ansible
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible=${ANSIBLE_VERSION}ppa~$(lsb_release -cs) -y
apt-mark hold ansible
