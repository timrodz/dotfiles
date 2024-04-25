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

## My apps

This setup is clearly opinionated, but I chose these apps + configs because they're lightweight and work across all platforms.

### Terminal

- Zsh: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
- Oh My Zsh: https://ohmyz.sh/
- Powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh
- zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
- tmux: https://github.com/tmux/tmux/wiki
  - My tmux config: https://github.com/gpakosz/.tmux

### WSL

- Github CLI: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- Docker CLI (No desktop): https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop
- Keychain (Remember SSH phrases): `sudo apt install keychain`