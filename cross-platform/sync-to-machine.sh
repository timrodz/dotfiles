#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc $HOME/.zshrc
cp .tmux.conf $HOME/.tmux.conf
cp .alacritty.toml $HOME/.alacritty.toml

echo '\n> All done! Please restart your terminal app'