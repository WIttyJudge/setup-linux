#!/usr/bin/env bash

# Running the script only by root
if [ "$(whoami)" != "root" ]; then
  echo "You have to run the script with sudo"
  exit 1
fi

echo "\033[38;5;16m \033[48;5;174m**** CLONNING REPOSITORY FOR UBUNTU ****\n\033[0m"

apt install -y git

dir=$HOME/setup-linux
if [ ! -d "$dir" ]; then 
  echo -e "\033[38;5;28m---- Clonning repository\033[0m\n"
  
  git clone -b Ubuntu https://github.com/WittyJudge/setup-linux $dir
fi

user=$(who | cut -d ' ' -f1)
echo "Sets chown for $user"
chown -R $user $dir

