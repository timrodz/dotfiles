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

echo "\n> Installing the GitHub CLI"

# https://cli.github.com/
brew install gh

echo "\n> Installing gnupg (GPG client)"

brew install gnupg

echo "\n> Terminal fun: Installing Alacritty + NeoVim + FZF + Zoxide"

brew install --cask alacritty
brew install neovim fzf zoxide

git config --global core.editor nvim

echo "\n> Installing NVM (Node Version Manager)"

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "\n> Installing TMUX with a nice config"

brew install tmux

echo "\n> (Optional) Installing UnnaturalScrollWheels (Makes mouse scrolling great again)"

brew install --cask unnaturalscrollwheels

echo "\n> Cleaning up installs"

brew cleanup

echo "\n> You're all done! Few more manual tasks:\n* Login with the GitHub CLI via 'gh auth login'\n* Sync the configs from /cross-platform + /osx\n* Setup your GPG key to sign commits (https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key) \n* (Optional) Install the Alacritty terminal: https://alacritty.org/\n* (Optional) Install VS Code: https://code.visualstudio.com/download\n* Install Docker: https://www.docker.com/products/docker-desktop/\n* (Optional) Install Raycast: https://www.raycast.com/"

