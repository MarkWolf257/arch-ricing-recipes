# Arch Ricing Recipes
This repository hosts my recipe for setting up a fresh install of arch linux with a themed rice along with installing my favorite packages and configuring them. I am dividing the recipes by desktop environment or window manager installed.

Regardless of the desktop environment, the first step is to install git, so that you can clone this repo!
```
sudo pacman -S git
git clone https://github.com/MarkWolf257/arch-ricing-recipes.git
cd arch-ricing-recipes
```

<br />

## Gnome (minimal)
This script installs the gnome desktop environment (only gnome-shell and necessary gnome apps) along with some of my favorite packages and extensions some of which are needed for the ricing. The script also installs the Colloid theme while allowing you to choose between different themes and colors.

https://github.com/vinceliuice/Colloid-gtk-theme

https://github.com/vinceliuice/Colloid-icon-theme

<br />

To install the rice, run the script
```
./install-gnome
```

<br />

Following arguments can be provided that are passed to Colloid
```
[--scheme <scheme>]  nord|dracula|gruvbox|everforest|catppuccin
[--theme <theme>]    purple|pink|red|orange|yellow|green|teal|grey
[--color <color>]    light|dark
```

<br />

After this everything will be installed and configured, and the system will reboot. After reboot you can enter your new desktop. There are some manual changes that needs to be done like setting up a wallpaper, and adding color scheme to the terminal (for alacritty a basic toml file is provided which can be extended by themes from: https://github.com/alacritty/alacritty-theme)
