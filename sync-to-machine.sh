#!/usr/bin/env bash

echo "synchronizing settings (remote to local)"

cp config/zshrc $HOME/.zshrc
cp config/tmux.conf $HOME/.tmux.conf
cp config/alacritty.toml $HOME/.config/alacritty/alacritty.toml
cp config/ohmyposh.toml $HOME/.config/ohmyposh/config.toml

echo '\n> All done! Please restart your terminal app'