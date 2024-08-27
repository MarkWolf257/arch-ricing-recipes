#!/bin/bash

scheme=""
theme=""
color=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --scheme)
      scheme="$2"
      shift 2
      ;;
    --theme)
      theme="$2"
      shift 2
      ;;
    --color)
      color="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: $0 [--scheme <scheme>] [--theme <theme>] [--color <color>]"
      exit 0
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
      ;;
  esac
done

# Update and install packages
sudo pacman -Syu --noconfirm xorg-server gnome-shell gdm alacritty gnome-control-center gnome-shell-extensions gnome-tweaks gnome-shell-extension-caffeine gnome-shell-extension-vitals ttf-jetbrains-mono-nerd neovim starship nemo

# Clone AUR packages
mkdir AURs
cd AURs

aurs=("text-engine" "extension-manager" "gnome-shell-extension-blur-my-shell" "gnome-shell-extension-forge" "zen-browser-bin")

for aur in ${aurs[@]}; do
  git clone https://aur.archlinux.org/$aur.git
  cd $aur
  makepkg --noconfirm -si
  cd ..
done

# Install and configure Colloid themes
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
./install.sh --tweaks $scheme --theme $theme --color $color --size compact
cd ..

style=$(echo "Colloid $theme $color Compact $scheme" | sed -E -e 's/ {2,}/ /g' -e 's/\<(.)/\u\1/g' -e 's/^ //' -e 's/ $//' -e 's/ /-/g')
gsettings set org.gnome.desktop.interface gtk-theme "$style"
gsettings set org.gnome.shell.extensions.user-theme name "$style"

git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-icon-theme
./install.sh --scheme $scheme --theme $theme
cd ..

style=$(echo "Colloid $theme $scheme $color" | sed -E -e 's/ {2,}/ /g' -e 's/\<(.)/\u\1/g' -e 's/^ //' -e 's/ $//' -e 's/ /-/g')
gsettings set org.gnome.desktop.interface icon-theme "$style"

cd ..

# Enable dark mode if color is "dark"
if [[ "$color" == "dark" ]]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

# Enable gnome extensions
extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "caffeine@patapon.info" "Vitals@CoreCoding.com" "forge@jmmaranan.com")

for extension in ${extensions[@]}; do
  gnome-extensions enable $extension
done

# Configure Alacritty
mkdir ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty/alacritty.toml
cd AURs
git clone 

# Configure Starship
echo 'eval "$(starship init bash)"' >> ~/.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Configure Neovim
git clone https://github.com/NvChad/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Enable and reboot
sudo systemctl enable gdm.service
reboot
