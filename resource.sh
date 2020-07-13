#!/usr/bin/env bash

install_resource() {
  # $1 - name of the installed file. $2 - resource to download
  wget -O $HOME/.dotfiles/$1 "$2"
}

install_resource discord.deb https://discord.com/api/download?platform=linux&format=deb
dpkg -i discord.deb
