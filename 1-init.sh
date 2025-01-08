#! /bin/bash

read -p  "did you by pass the IRGW?(y/n) " BYPASS 
[ "$BYPASS" != "y" ] && echo "install an anti filter  or use the  proxies to  by pass the filering" && exit 1

sudo apt update && sudo apt full-upgrade -y 

sudo apt install -y zsh curl git make build-essential

echo "give password to change  the zsh as default shell"
chsh -s $(which zsh)
[ "$?" != "0" ] && echo "could not change chsh" && exit 127 


# echo going to install oh my zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

[ "$?" -ne "0" ] && echo "oh my zsh is not insatlled" && exit 1

exec zsh
