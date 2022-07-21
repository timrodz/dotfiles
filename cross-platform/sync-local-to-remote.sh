#!/bin/zsh

echo "synchronizing settings (local to remote)"

cp $HOME/.zshrc .zshrc
cp $HOME/.config/kitty/kitty.conf .kitty.conf

echo "done!"