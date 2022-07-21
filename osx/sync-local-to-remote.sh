#!/bin/zsh

echo "synchronizing OSX settings (local to remote)"

cp $HOME/.skhrdc .skhdrc
cp $HOME/.yabairc .yabairc
cp $HOME/.spacebarrc .spacebarrc

echo "done!"