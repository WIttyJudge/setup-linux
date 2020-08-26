#!/usr/bin/env bash

# Load helper functions
source $SETUP_LINUX_PATH/functions/installer.sh

#Install packages
apt_installer fonts-firacode
apt_installer synaptic
apt_installer pass
apt_installer htop
apt_installer vim
apt_installer gparted
apt_installer net-tools
apt_installer nmap
apt_installer terminator
apt_installer ripgrep
apt_installer httpie
apt_installer chromium-browser
apt_installer neofetch
apt_installer nitroshare
apt_installer hardinfo

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt_installer yarn

# Remove downloaded by apt trash
apt autoremove
