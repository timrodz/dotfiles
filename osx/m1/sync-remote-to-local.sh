#!/bin/zsh

echo "synchronizing OSX settings (remote to local)"

cp .skhdrc $HOME/.skhrdc
cp m1/.yabairc $HOME/.yabairc
cp m1/.spacebarrc $HOME/.spacebarrc

echo "restarting brew"

brew services restart spacebar
brew services restart yabai
brew services restart skhd

echo "done!"