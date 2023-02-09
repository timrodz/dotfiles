#!/bin/zsh

echo "synchronizing settings (local to repo)"

cp $HOME/.zshrc .zshrc
cp $HOME/.tmux.conf.local .tmux.conf.local
cp $HOME/.alacritty.yml .alacritty.yml
cp $HOME/.gnupg/gpg-agent.conf gpg-agent.conf
sudo /etc/wsl.conf cp wsl.conf

echo "done!"