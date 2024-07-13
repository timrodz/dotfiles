#!/usr/bin/env bash

echo "Synchronizing settings to your machine"

cp config/zshrc $HOME/.zshrc
cp config/tmux.conf $HOME/.tmux.conf
cp config/alacritty.toml $HOME/.config/alacritty/alacritty.toml
cp config/ohmyposh.toml $HOME/.config/ohmyposh/config.toml

cd $HOME
source .zshrc

echo '\n> All done!'