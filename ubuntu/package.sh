#!/usr/bin/env bash

install_package() {
  echo -e "\033[38;5;28m---- Installing package:\033[0m $1"
  
  apt install -y $1
}

#Install packages
install_package fonts-firacode
install_package synaptic
install_package pass
install_package htop
install_package vim
install_package gparted
install_package net-tools
install_package nmap
install_package terminator
install_package ripgrep
install_package httpie
install_package chromium-browser
install_package neofetch
install_package nitroshare

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
install_package yarn

# Remove downloaded by apt trash
apt autoremove
