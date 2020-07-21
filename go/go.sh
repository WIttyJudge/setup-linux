#!/usr/bin/env bash

go_folder=go1.14.6.linux-amd64.tar.gz

echo "Installing Golang"
wget https://golang.org/dl/$go_folder
sudo tar -C /usr/local -xzf $go_folder

# export GOROOT=/usr/local/go
# export GOPATH=$HOME/golib
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

sudo mkdir -p $HOME/code/src/github.com/wittyjudge
sudo mkdir -p $HOME/golib

cat <<EOF >> ~/.profile
# root
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# libs from golang
export GOPATH=$HOME/golib
export PATH=$PATH:$GOPATH/bin

# my folder
export GOPATH=$GOPATH:/home/witty/code
EOF

source ~/.profile
