#!/usr/bin/env bash

install_package() {
	# Some colors and formatting to output :)
	NO_FORMAT="\033[0m"
	C_GREEN4="\033[38;5;28m"

	echo -e "${C_GREEN4}----Installing package:${NO_FORMAT} $1"
	apt install -y $1
  echo "\n"
}

# Update the system's packages to the latest version before installing new
apt update && sudo apt upgrade -y

# Install media codecs
install_package ubuntu-restricted-extras
install_package ttf-mscorefonts-installer
# Clean cache
fc-cache -f -v

#Install preload that runs in the background and analyzes user behavior and frequently run applications.
install_package preload