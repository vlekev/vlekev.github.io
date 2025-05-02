#!/bin/bash

sudo apt-get update -y

echo Installation des bases
sudo apt-get install -y gnupg apt-transport-https lsb-release ca-certificates make git curl vim wget bash-completion zip cron


echo Installation/Mise à jour de nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

echo Installation/Mise à jour de node
nvm install --reinstall-packages-from=node --latest-npm 'lts/*'
