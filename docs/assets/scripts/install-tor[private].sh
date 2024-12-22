#!/bin/bash

if ! command -v torify > /dev/null; then
    sudo apt update
    sudo apt install -y tor
fi

sudo sed -i 's/#ControlPort 9051/ControlPort 9051/g' /etc/tor/torrc
sudo sed -i 's/#CookieAuthentication 1/CookieAuthentication 1/g' /etc/tor/torrc

sudo service tor restart