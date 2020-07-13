#!/bin/sh

# Running the script only by root
if [ "$(whoami)" != "root" ]
then
  echo "You have to run this script with superuser"
  exit 1
fi

# Some of the style and formats for the output
NO_FORMAT="\033[0m"
C_GREY0="\033[38;5;16m"
C_LIGHTPINK3="\033[48;5;174m"
echo "${C_GREY0}${C_LIGHTPINK3}**** HELLO FROM INSTALLER FOR UBUNTU ****\n${NO_FORMAT}"

dir=$HOME/dotfiles
if [ ! -d "$dir" ]; then
  git clone -b Ubuntu https://github.com/WIttyJudge/dotfiles "$dir"
fi

# Setup the configuration for speed up system
sh ./setup.sh

# Install a packages I used by apt package manager
sh ./package.sh

# Install programs I used from another resource.
sh ./resource
