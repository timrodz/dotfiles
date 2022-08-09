#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc $HOME/.zshrc
cp .tmux.conf $HOME/.tmux.conf
cp .alacritty.yml $HOME/.alacritty.yml

echo "done!"