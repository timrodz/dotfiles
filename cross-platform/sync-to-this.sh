#!/bin/zsh

echo "synchronizing settings (local to remote)"

cp $HOME/.zshrc .zshrc
cp $HOME/.tmux.conf.local .tmux.conf.local
cp $HOME/.alacritty.yml .alacritty.yml
cp $HOME/.config/regolith/Xresources .config/regolith/Xresources

echo "done!"