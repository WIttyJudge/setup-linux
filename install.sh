#!/usr/bin/env bash

# Main installation

# OS supported:
# Ubuntu

# Am I root?
# The $EUID env holds the current user's UID
[ "$EUID" -ne 0 ] && echo "You have to run this script only from sudo user." && exit 1

# Script can be executed only in linux
linux=$(echo "$OSTYPE" | grep "linux")
[ -z $linux ] && echo "Script Cannot be executed on another operation system. Only Linux." && exit 1

# What OS do I use?
os_name=$(cat /etc/issue | cut -d ' ' -f1)
case $os_name in
  Ubuntu) type="ubuntu" ;;
  Debian) type="debian" ;;
  *) echo "Cannot get OS information" ;;
esac

bash $type/install-$type.sh