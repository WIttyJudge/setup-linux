#!/usr/bin/env bash

go_folder=go1.14.6

echo "Installing Golang"
wget https://github.com/golang/go/archive/$go_folder.tar.gz
sudo tar -xvf $go_folder.tar.gz
sudo mv go-$go_folder /usr/local/go

# export GOROOT=/usr/local/go
# export GOPATH=$HOME/golib
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

sudo mkdir -p $HOME/code/src/github.com/wittyjudge
sudo mkdir -p $HOME/golib

cat <<EOF >> ~/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/golib
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOPATH=$GOPATH:$HOME/code
EOF

source ~/.profile
