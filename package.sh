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
install_package ruby-full

# Remove downloaded by apt trash
apt autoremove
