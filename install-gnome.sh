#!/bin/bash

sudo pacman -Syu --noconfirm xorg-server gnome-shell gdm alacritty gnome-control-center gnome-shell-extensions gnome-tweaks gnome-shell-extension-caffeine gnome-shell-extension-vitals ttf-jetbrains-mono-nerd neovim starship nemo

mkdir AURs
cd AURs

aurs=("text-engine" "extension-manager" "gnome-shell-extension-blur-my-shell" "gnome-shell-extension-forge" "zen-browser-bin")

for aur in ${aurs[@]}
do
	git clone https://aur.archlinux.org/$aur.git
	cd $aur
	makepkg --noconfirm -si
	cd ..
done

git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
./install.sh --tweaks $1 --theme $2 --color $3
cd ..

git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-icon-theme
./install.sh --scheme $1 --theme $2
cd ..

cd ..

extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "caffeine@patapon.info" "Vitals@CoreCoding.com" "forge@jmmaranan.com") 

for extension in ${extensions[@]}
do
	gnome-extensions enable $extension
done

mkdir ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty/alacritty.toml

echo 'eval "$(starship init bash)"' >> ~/.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

git clone https://github.com/NvChad/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

sudo systemctl enable gdm.service
reboot
