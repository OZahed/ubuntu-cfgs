#! /bin/zsh

sudo apt install -y fzf tldr eza bat htop btop tmux
sudo snap install vlc --classic
sudo snap install spotify

# Download and install nvm:
which node && echo "node is already installed"  || {
	 which curl &&  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	[ $? -ne 0 ] && echo "could not install nvm" && exit 127
	source ~/.zshrc
	# Download and install Node.js:
	nvm install 22
	source ~/.zshrc
}


which go && echo "go is installed"  || {
	# install golang
	cd ~/Downloads
	curl -LO https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
	grep 'export PATH=$PATH:/usr/local/go/bin' ~/.zshrc ||  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
	grep 'export PATH=$PATH:$HOME/go/bin' ~/.zshrc  echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.zshrc
}

# installing rust

which g++ || sudo apt install -y gcc g++

which cargo || {
	echo "cargo not found going to install it ..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	grep '/.cargo/bin:' ~/.zshrc &&  { echo 'cargo added to zsh' } || { echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc }
	source ~/.zshrc
	}

cargo install bat
