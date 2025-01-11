#! /bin/bash

which rgrep || sudo apt install ripgrep
which ipython3 || sudo apt install ipython3
which code || sudo snap install code
which zig || snap install zig --classic --beta
which zed || curl -f https://zed.dev/install.sh | sh
which nvim && [ ! -d ~/.config/nvim ] && git clone https://github.com/NvChad/starter ~/.config/nvim

which ollama || read -p "install ollama?(y/n) " OLLAMA
[ $OLLAMA == "y" ] && curl -fsSL https://ollama.com/install.sh | sh

which docker && exit 0
# installing docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER 
newgrp docker
echo "log out and log in again to see the effects"
