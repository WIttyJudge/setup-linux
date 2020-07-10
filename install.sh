#!/bin/sh

# Running the script only by root
if [ "$(whoami)" != "root" ]
then
  echo "You have to run this script with superuser"
  exit 1
fi

echo Hello From Installer

sh ./packages.sh
