#!/bin/zsh

echo "synchronizing OSX settings (remote to local)"

cp .skhdrc $HOME/.skhrdc
cp .yabairc $HOME/.yabairc
cp .spacebarrc $HOME/.spacebarrc

echo "restarting brew"

brew services restart spacebar
brew services restart yabai
brew services restart skhd

echo "done!"