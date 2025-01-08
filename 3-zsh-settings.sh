#! /bin/bash



grep 'alias vim' ~/.zshrc && echo "exists" || echo alias vim="nvim" >> ~/.zshrc
grep 'alias ll' ~/.zshrc && echo "exists" || echo alias ll="eza -lah" >> ~/.zshrc
grep 'alias eza' ~/.zshrc && echo "exits" || echo alias eza="eza --icons --git" >> ~/.zshrc
grep 'gca' ~/.zshrc && echo "exits" || echo alias gca="git add . --all && git commit"
grep 'gp' ~/.zshrc && echo "exits" || echo alias gp="git pull"
grep 'mcd ()' ~/.zshrc && echo "exits" || echo 'mcd () { [ ! -d $1 ] && mkdir -p $1; cd $1 }' >> ~/.zshrc
grep 'edit-zsh' ~/.zshrc && echo "exits" || echo "edit-zsh () { vim ~/.zshrc ; source ~/.zshrc }" >> ~/.zshrc
grep 'glog' ~/.zshrc && echo "exits" || echo 'alias glog="git log --oneline --graph"' >> ~/.zshrc

read -p "did you install the nerd font and set one one of them to the default font?(y/n)" NERD
[ $NERD != "y" ] && echo "nerd fonts are not installed" && exit 127 
[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] && rm -rf  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "installing syntax highlight"
[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i  's/plugins=(git/plugins=(git zsh-syntax-highlighting/g' ~/.zshrc

exec zsh
source ~/.zshrc
