#!/bin/sh

install_package() {
  # Some colors and formatting to output :)
  NO_FORMAT="\033[0m"
  C_GREEN4="\033[38;5;28m"

  echo -e "${C_GREEN4}---- Installing package:${NO_FORMAT} $1"
  apt install -y $1
  echo "\n"
}

#Install packages
install_package fonts-firacode
install_package synaptic
install_package pass
install_package htop
install_package gparted
install_package net-tools
install_package nmap
install_package terminator
install_package ripgrep
install_package httpie
install_package chromium-browser
