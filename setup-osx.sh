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

echo "\n> Installing Homebrew"

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n> Installing the GitHub CLI + gnupg"

brew install gh gnupg

echo "\n> Terminal fun: Installing Alacritty + Tmux + NeoVim + FZF + Zoxide"

brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install --cask alacritty
brew install neovim fzf zoxide tmux

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git config --global core.editor nvim

echo "\n> Installing Node + dependencies"

brew install nvm

nvm install 18

echo "\n> Installing Mos for mouse movement. Recommended setup: Smooth Scrolling (On) / Step (45.00) / Speed (3.50) / Duration (3.90)"

brew install mos

echo "\n> Cleaning up installs"

brew cleanup

echo "\n> You're all done! Few more manual tasks:
\n* Login with the GitHub CLI via 'gh auth login'
\n* Sync the configs from your devices by running 'sh sync-to-machine.sh'
\n* Setup your GPG key to sign commits: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
\n* Install VS Code: https://code.visualstudio.com/download
\n* Install Docker: https://www.docker.com/products/docker-desktop/
\n* Install Raycast: https://www.raycast.com/"

