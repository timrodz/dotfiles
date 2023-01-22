#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc $HOME/.zshrc
cp .tmux.conf.local $HOME/.tmux.conf.local
cp .alacritty.yml $HOME/.alacritty.yml
cp .config/regolith/Xresources $HOME/.config/regolith/Xresources

echo "done!"