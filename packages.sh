#!/bin/sh

NO_FORMAT="\033[0m"
F_UNDERLINED="\033[4m"
C_GREEN4="\033[38;5;28m"

install_package()
{
  echo -e "${F_UNDERLINED}${C_GREEN4}--- Installing package: $1${NO_FORMAT}"
  sudo apt install -y $1
}

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
