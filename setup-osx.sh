#!/usr/bin/env bash

# NOTE: All sources for relevant commands are listed above the download commands, just in case you're wondering where they came from

if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run by root" >&2
        exit 1
fi

cd $HOME

echo "\nWelcome to the setup wizard! You will be up and running in a few minutes"

echo "\n> Setting up the git config"
git config --global user.name "Juan Morais"
git config --global user.email "timrodz@icloud.com"
git config --global pull.rebase true
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/github.pub

echo "\n> Installing Homebrew"

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n> Installing the GitHub CLI"

brew install gh

echo "\n> Terminal fun: Installing Alacritty + Tmux + NeoVim + FZF (Better fuzzy finder) + Zoxide (Better cd) + Eza (Better ls) + Ranger (Folder navigation) + Glow (Markdown files)"

brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install --cask alacritty
brew install neovim fzf zoxide tmux asdf eza ranger glow

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git config --global core.editor nvim

echo "\n> Installing Node 22 + Bun"

brew install nvm

nvm install 22
nvm use 22

curl -fsSL https://bun.sh/install | bash

echo "\n> Installing Mos for mouse movement. Recommended setup: Smooth Scrolling (On) / Step (45.00) / Speed (3.50) / Duration (3.90)"

brew install --cask mos

echo "\n> Cleaning up installs"

brew cleanup

echo "\n> You're all done! Few more manual tasks:
\n* Login with the GitHub CLI via 'gh auth login'
\n* Sync the configs from your devices by running 'sh sync-to-machine.sh'
\n* Install OrbStack: https://orbstack.dev/dashboard
\n* Install Raycast: https://www.raycast.com/"
