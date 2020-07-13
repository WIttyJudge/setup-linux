#!/usr/bin/env bash

# Running the script only by root
if [ "$(whoami)" != "root" ]; then
  echo "You have to run this script with superuser"
  exit 1
fi

# Some of the style and formats for the output
echo "\033[38;5;16m \033[48;5;174m**** HELLO FROM INSTALLER FOR UBUNTU ****\n\033[0m"

# Setup the configuration for speed up system
sh ./setup.sh

# Install a packages I used by apt package manager
sh ./package.sh

# Install programs I used from another resource.
sh ./resource.sh
