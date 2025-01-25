#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

cd $HOME

echo '\nWelcome to the setup wizard! You will be up and running in a few minutes'

echo '\n> Setting up the git config'
git config --global user.name 'Juan Morais'

git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global pull.rebase true

echo '\n> Installing zsh and setting zsh as the default shell'

sudo apt install zsh
chsh /bin/zsh
zsh

echo '\n> Installing oh-my-posh + fzf + zoxide'

# Required to install oh-my-posh
sudo apt install unzip
curl -s https://ohmyposh.dev/install.sh | bash -s

curl -sSFfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo '\n> Installing tmux'
apt install tmux

echo '\n> Installing Make
apt install -y make

echo '\n> Generating locales for en_US.UTF-8'
sudo locale-gen "en_US.UTF-8"
locale

echo '\n> Installing the GitHub CLI'

type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

echo '\n> Updating packages'

sudo apt install && sudo apt upgrade

echo '\n> All done! Please copy .zshrc to your home directory and run the following commands:'

echo 'exec zsh'

echo '\n> Please run the following commands to finish the setup:'
echo 'git config --global user.email <email>'
echo 'git config --global user.signingkey ~/.ssh/<key>.pub'