#!/usr/bin/env bash

source $(dirname "$(pwd)")/functions/installer.sh

# Update the system's packages to the latest version before installing new
apt update && sudo apt upgrade -y

# Install media codecs
apt_installer ubuntu-restricted-extras
apt_installer ttf-mscorefonts-installer
# Clean cache
fc-cache -f -v

#Install preload that runs in the background and analyzes user behavior and frequently run applications.
install_package preload