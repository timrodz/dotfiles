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

echo "\n> Installing Oh My Zsh (Mac already comes with ZSH as the default shell) + Plugins"

# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "\n> Installing ZSH theme Powerlevel10k (OPTIONAL)"

# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "\n> If you installed Powerlevel10k, it's recommended you install these fonts too: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k"

echo "\n> Installing NVM (Node Version Manager)"

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "\n> Installing TMUX with a nice config"

brew install tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

echo "\n> (Optional) Installing UnnaturalScrollWheels (Makes mouse scrolling great again)"

brew install --cask unnaturalscrollwheels

echo "\n> Cleaning up installs"

brew cleanup

echo "\n> You're all done! Few more manual tasks:\n1. Login with the GitHub CLI via 'gh auth login'\n2. Sync the configs from /cross-platform + /osx\n3. (Optional) Install the Alacritty terminal: https://alacritty.org/\n4. (Optional) Install VS Code: https://code.visualstudio.com/download\n5. Install Docker: https://www.docker.com/products/docker-desktop/\n6. (Optional) Install Raycast: https://www.raycast.com/"

