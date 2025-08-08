#!/usr/bin/env bash

echo "Synchronizing machine to repository"

cp $HOME/.zshrc config/.zshrc
cp $HOME/.config/tmux/tmux.conf config/tmux.conf
cp $HOME/.config/alacritty/alacritty.toml config/alacritty.toml
cp $HOME/.config/ohmyposh/config.toml config/ohmyposh.toml
cp $HOME/.tool-versions config/.tool-versions
cp -a $HOME/.config/wezterm config

echo '\n> All done!'