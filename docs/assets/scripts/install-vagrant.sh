#!/bin/bash

if ! command -v vagrant > /dev/null; then
    echo " - installation de vagrant"
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install vagrant

    if uname -a | grep WSL > /dev/null; then
        echo export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1" >> ~/.bashrc
        vagrant plugin install virtualbox_WSL2
    fi
fi