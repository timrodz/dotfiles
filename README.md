# .timrodzrc

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

### Terminal

- Zsh: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
- Powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh
- tmux: https://github.com/tmux/tmux/wiki

### WSL

- Github CLI: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- Docker CLI (No desktop): https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop
- Keychain (Remember SSH phrases): `sudo apt install keychain`