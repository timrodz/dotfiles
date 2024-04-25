#!/bin/zsh

echo "synchronizing settings (remote to local)"

cp .zshrc $HOME/.zshrc
cp .tmux.conf.local $HOME/.tmux.conf.local
cp .alacritty.toml $HOME/.alacritty.toml
cp .p10k.zsh $HOME/.p10k.zsh

echo '\n> All done! Please restart your terminal app'