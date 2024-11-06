# dotfiles AKA configs

A handy tool set for setting up my computers, featuring OSX + Ubuntu + Windows (WSL)

Every folder contains a shell script that synchronizes the settings from this repo to your local machine. If you need permissions to run them:

```shell
chmod +x dir/sync.sh
```

You need to run all commands from the directory they're stored in. Otherwise you'll get undesired results.

```shell
cd dir
./sync.sh
```

## Setup

This setup is clearly opinionated, but I chose these apps + configs because they're lightweight and work across all platforms.

Font: `JetBrainsMono Nerd Font` (found in https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#patched-fonts)

### Terminal + Shell config

- Alacritty: https://alacritty.org/
- Zsh: https://www.zsh.org/
- Oh My Posh: https://ohmyposh.dev/
- tmux: https://github.com/tmux/tmux/wiki
- fzf: https://github.com/junegunn/fzf
- zoxide: https://github.com/ajeetdsouza/zoxide

### Default file config with duti

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
