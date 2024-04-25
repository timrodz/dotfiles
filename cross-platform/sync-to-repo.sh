#!/bin/zsh

echo "synchronizing settings (local to repo)"

cp $HOME/.zshrc .zshrc
cp $HOME/.tmux.conf.local .tmux.conf.local
cp $HOME/.alacritty.toml .alacritty.toml
cp $HOME/.gnupg/gpg-agent.conf gpg-agent.conf
sudo /etc/wsl.conf cp wsl.conf
cp $HOME/.p10k.zsh .p10k.zsh

echo "done!"