#!/bin/zsh

echo "synchronizing settings (local to repo)"

cp $HOME/.zshrc .zshrc
cp $HOME/.tmux.conf .tmux.conf
cp $HOME/.alacritty.toml .alacritty.toml

echo "done!"