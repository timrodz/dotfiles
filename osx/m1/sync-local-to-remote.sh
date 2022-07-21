#!/bin/zsh

echo "synchronizing OSX settings (local to remote)"

cp $HOME/.skhdrc .skhdrc
cp $HOME/.yabairc m1/.yabairc
cp $HOME/.spacebarrc m1/.spacebarrc

echo "done!"