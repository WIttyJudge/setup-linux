#!/usr/bin/env bash

# Some colors and formatting to output :)
green="\033[38;5;28m"
no_color="\033[0m"

apt_installer() {
	echo -e "${green}----Installing package:${no_color} $1"

	apt install -y $1
  
  echo "\n"
}