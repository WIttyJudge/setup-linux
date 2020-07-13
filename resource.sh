#!/bin/sh

install_resource() {
  # $1 - name of the installed file. $2 - resource to download
  wget -O ~/.dotfiles/$1 "$2"
}

install_resource discord.deb https://discord.com/api/download?platform=linux&format=deb
dpkg -i discord.deb

install_resource virtualbox https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~bionic_amd64.deb
apt install ./virtualbox