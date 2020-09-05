#!/usr/bin/env bash

source "$SETUP_LINUX_PATH/color.sh"

apt_installer() {
	echo -e "${green}----Installing package:${no_color} $1"
	apt install -y $1

	echo "\n"
}

pacman_installer() {
	echo -e "${green}----Installing package:${no_color} $1"

	pacman -Sy $1
}