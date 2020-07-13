#!/bin/bash

sudo apt install -y git

dir=$HOME/.dotfiles
if [ ! -d "$dir" ]; then 
  git clone -b Ubuntu https://github.com/WittyJudge/dotfiles $dir
fi