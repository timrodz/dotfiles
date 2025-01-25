#!/usr/bin/env bash

echo "Synchronizing settings to your machine"

cp config/zshrc $HOME/.zshrc
cp config/tmux.conf $HOME/.config/tmux/tmux.conf
cp config/alacritty.toml $HOME/.config/alacritty/alacritty.toml
cp config/ohmyposh.toml $HOME/.config/ohmyposh/config.toml
cp config/.tool-versions $HOME/.tool-versions

cd $HOME
exec zsh

echo '\n> All done!'