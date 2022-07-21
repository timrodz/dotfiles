#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc $HOME/.zshrc
cp .kitty.conf $HOME/.config/kitty/kitty.conf

echo "done!"