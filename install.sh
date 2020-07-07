#!/bin/sh

if [ "$(whoami)" != "root"]
then 
  echo "You have to run this script as Superuser!"
  exit 1
fi

echo Hello From Installer

install_package()
{
  echo "--- Installing package: $1"
  sudo apt 
}

sudo apt-get update

install_package privet
install_package kakdela
