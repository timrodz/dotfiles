# .timrodzrc

A list of all configuration files for all my OS combinations!

Every folder contains a shell script that synchronizes the settings from this repo to your local machine. They just need permissions to run:

```shell
chmod +x dir/sync.sh
```

It's highly recommended to run all commands from the directory they're stored in.

```shell
cd dir
./sync.sh
```

## Apps

### Terminal

- Zsh: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
- Oh My Zsh: https://ohmyz.sh/
- Powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh
- zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
- Tmux: `sudo apt install tmux`
- Custom tmux: https://github.com/gpakosz/.tmux
- git config --global pull.rebase true

### WSL

- Github CLI: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- Docker CLI (No desktop): https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop
- Keychain (Remember SSH phrases): `sudo apt install keychain`