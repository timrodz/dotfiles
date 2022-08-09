#!/bin/zsh

echo "synchronizing settings (local to remote)"

cp $HOME/.zshrc .zshrc
cp $HOME/.tmux.conf .tmux.conf
cp $HOME/.alacritty.yml .alacritty.yml

echo "done!"