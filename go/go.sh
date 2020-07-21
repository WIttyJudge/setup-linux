#!/usr/bin/env bash

go_folder=go1.14.6.tar.gz

echo "Installing Golang"
wget -O  https://github.com/golang/go/archive/$go_folder
sudo tar -xvf $go_folder
sudo mv go /usr/local

# export GOROOT=/usr/local/go
# export GOPATH=$HOME/golib
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

cat <<EOF >> ~/Desktop/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/golib
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOPATH=$GOPATH:$HOME/code
EOF

source ~/.profile