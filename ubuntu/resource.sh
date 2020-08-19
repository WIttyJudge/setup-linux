#!/usr/bin/env bash

# if folder doesn't exist, it will create
resource_folder="resources"
[ ! -d "$resource_folder" ] && mkdir "$resource_folder"

install_resource() {
  # $1 - name of the installed file. $2 - resource to download
  wget -O $HOME/.dotfiles/$resource_folder/$1 "$2"
}

# install_resource discord.deb https://discordapp.com/api/download?platform=linux&format=deb
