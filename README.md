# Gnome Recipe
This is a recipe to setup my gnome desktop environment from scratch with minimum bloat and a consistent theme.
Install all the packages in order. Use commands to set default gui mode.

On Arch:
```
sudo systemctl enable gdm.service
```

On Debian:
```
sudo service gdm start
```

Then install all extensions through extension manager and follow the github link for desired theme configuration

<br />

## Ingredients (Download from the distro's package manager)
- xorg
- gnome-shell
- gdm3
- gnome-control-center
- gnome-extensions-manager
- gnome-extensions-app
- gnome-tweaks
- terminal emulator (alacritty)
- shell (zsh)
- browser (librewolf or firefox)
- file manager (nemo)
- code editor (neovim or vscode)

<br />

## Gnome Extensions (Download using the extension manager)
- blur my shell
- user themes
- forge
- vitals
- caffeine
- simple net speed

<br />

## Dracula Config (Follow their respective instructions)

<img src="dracula-screenshot-1.png" />

<img src="dracula-screenshot-2.png" />

- oh-my-zsh (agnoster theme) - https://github.com/ohmyzsh/ohmyzsh
- dracula-gtk - https://github.com/dracula/gtk
- dracula-icons - https://draculatheme.com/gtk
- dracula-walls - https://github.com/dracula/wallpaper
- terminal colors (dracula) - https://github.com/mbadolato/iTerm2-Color-Schemes
- neovim (nvchad, requires latest version nvim) - https://github.com/NvChad/NvChad
- vscode (dracula extension)
