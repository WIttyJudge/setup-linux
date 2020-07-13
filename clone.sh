#!/bin/bash

# Running the script only by root
if [ "$(whoami)" != "root" ]; then
  echo "You have to run this script with superuser"
  exit 1
fi

apt install -y git

dir=$HOME/.dotfiles
if [ ! -d "$dir" ]; then 
  git clone -b Ubuntu https://github.com/WittyJudge/dotfiles $dir
fi

chown -R $(whoami) $dir/.dotfiles