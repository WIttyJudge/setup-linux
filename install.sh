#!/usr/bin/env bash

# Main installation

# OS supported:
# Ubuntu

# Am I root?
# The $EUID env holds the current user's UID
if [ "$EUID" != 0 ]; then
  echo "only from sudo"
  exit 1
fi

# What OS do I use?
case $(cat /etc/issue | cut -d ' ' -f1) in
  Ubuntu) 
    type="ubuntu"
    ;;
  Debian)
    type="debian"
    ;;
  *)
    echo "cannot get OS information"
  ;;
esac

bash $type/install-$type.sh