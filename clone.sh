#!/usr/bin/env bash

# Running the script only by root
if [ "$(whoami)" != "root" ]; then
  echo "You have to run this script with superuser"
  exit 1
fi

echo "\033[38;5;16m \033[48;5;174m**** CLONNING REPOSITORY FOR UBUNTU ****\n\033[0m"

apt install -y git

dir=$HOME/.dotfiles
if [ ! -d "$dir" ]; then 
  echo -e "\033[38;5;28m---- Clonning repository\033[0m\n"
  
  git clone -b Ubuntu https://github.com/WittyJudge/dotfiles $dir
fi

chown -R $(echo $USERNAME) $dir
