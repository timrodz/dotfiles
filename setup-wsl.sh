#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

cd $HOME

echo '\nWelcome to the setup wizard! You will be up and running in a few minutes'

echo '\n> Setting up the git config'
git config --global user.name 'Juan Morais'
git config --global user.email 'timrodz@icloud.com'
git config --global pull.rebase true

echo '\n> Installing the GitHub CLI'
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

echo '\n> Installing tmux'
apt install tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo '\n> Installing an SSH keychain'
apt install keychain

echo '\n> Installing Volta (Package manager)'
curl https://get.volta.sh | bash

echo '\n> Installing Make
apt install -y make

echo '\n> Zsh'
apt install zsh

echo '\n> Updating packages'
apt update

echo '\n> Almost done! Please run the following commands manually (Installing Oh My Zsh will cause you to switch shells)\n'
echo '$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
echo '\n> Run these inside the zsh shell'
echo '$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
echo '$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'
echo '$cd cross-platform && sh sync-to-machine-wsl.sh'
echo '\n> All done! Please restart your terminal app'