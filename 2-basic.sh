#! /bin/zsh

sudo apt install -y fzf tldr eza bat htop btop tmux
sudo snap install vlc --classic
sudo snap install spotify

# Download and install nvm:
which node || which curl &&  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
[ $? -ne 0 ] && echo "could not install nvm" && exit 127

source ~/.zshrc
# Download and install Node.js:
which node || nvm install 22


# install golang
cd ~/Downloads
curl -LO https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.zshrc

# installing rust

which g++ || sudo apt install -y gcc g++
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
grep '/.cargo/bin:' ~/.zshrc && echo cargo added to zsh || ehco 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

cargo install bat