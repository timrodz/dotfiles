#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc-wsl $HOME/.zshrc
cp .tmux.conf.local $HOME/.tmux.conf.local
cp .alacritty.yml $HOME/.alacritty.yml

echo "done!"