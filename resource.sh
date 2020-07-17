#!/usr/bin/env bash

resource_folder="resources"
if [ ! -d "$resource_folder" ]; then
  mkdir $resource_folder
fi

install_resource() {
  # $1 - name of the installed file. $2 - resource to download
  wget -O $HOME/.dotfiles/$resource_folder/$1 "$2"
}

install_resource discord.deb https://discordapp.com/api/download?platform=linux&format=deb
