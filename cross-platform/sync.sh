#!/bin/zsh

echo "synchronizing settings"

cp .zshrc $HOME/.zshrc
cp .kitty.conf $HOME/.config/kitty/kitty.conf

echo "done!"