#!/bin/zsh

echo "synchronizing OSX settings (local to remote)"

cp $HOME/.skhdrc .skhdrc
cp $HOME/.yabairc intel/.yabairc
cp $HOME/.spacebarrc intel/.spacebarrc

echo "done!"