#!/usr/bin/env bash

# Main installation

# OS supported:
# Ubuntu

# Am I root?
# The $EUID env holds the current user's UID
[ "$EUID" -ne 0 ] && echo "You have to run this script only from sudo user." && exit 1

# Script can be executed only in linux
linux="$(echo "$OSTYPE" | grep "linux")"
[ -z "$linux" ] && echo "Script Cannot be executed on another operation system. Only Linux." && exit 1

# SETUP_LINUX_PATH env contains path to folder
folder_path="$(pwd)"
export SETUP_LINUX_PATH="$folder_path"

# What OS do I use?
os_name="$(cat /etc/issue | cut -d ' ' -f1)"
case $os_name in
  Ubuntu) type="ubuntu" ;;
  Debian) type="debian" ;;
  *) echo "Cannot get OS information" ;;
esac

# Output brief information before running the script
echo "/////////////////////////////////////////////////////////////////////////////"
echo "//////////////////////// Created by Witty Judge /////////////////////////////"
echo "/////////////// https://github.com/WIttyJudge/setup-linux ///////////////////"
echo "//////////////////////// Setup linux for ${type} ////////////////////////////"
echo "/////////////////////////////////////////////////////////////////////////////"
read -n 1 -r -s -p $'/////////////////////// Press any key to continue ///////////////////////////\n\n'

bash $type/install-$type.sh