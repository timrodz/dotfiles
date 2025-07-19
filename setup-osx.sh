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

echo "\n> Terminal fun: Installing Alacritty + Tmux + NeoVim + FZF + Zoxide"

brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install --cask alacritty
brew install neovim fzf zoxide tmux asdf duti

echo "\n> Setting default apps to be VScode"
duti -s com.microsoft.VSCode .c all
duti -s com.microsoft.VSCode .cpp all
duti -s com.microsoft.VSCode .cs all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .go all
duti -s com.microsoft.VSCode .java all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .sass all
duti -s com.microsoft.VSCode .scss all
duti -s com.microsoft.VSCode .less all
duti -s com.microsoft.VSCode .vue all
duti -s com.microsoft.VSCode .cfg all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .lua all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .php all
duti -s com.microsoft.VSCode .pl all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .rb all
duti -s com.microsoft.VSCode .rs all
duti -s com.microsoft.VSCode .sh all
duti -s com.microsoft.VSCode .swift all
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .conf all

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

