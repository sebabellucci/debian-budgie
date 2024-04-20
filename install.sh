#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

echo "Instalar y configurar budgie"
echo "partiendo de una instalación mínima de"
echo "Debian GNU/Linux 12 - Bookworm - 64 bits"


username=$(id -u -n 1000)
builddir=$(pwd)

sudo apt update
sudo apt upgrade -y


sudo apt install xorg x11-utils budgie-desktop budgie-extras-common budgie-extras-deamon network-manager-gnome connman connman-gtk slim thunar 
sudo apt install xinput xinit xdg-user-dirs policykit-1 blueman pulseaudio pavucontrol wget curl build-essential devscripts software-properties-common
sudo apt install obsidian-icon-theme adwaita-icon-theme papirus-icon-theme papirus-icon-theme fonts-noto-color-emoji picom rofi
sudo apt install htop neofetch screenfetch mintstick chromium mplayer mpv unzip flameshot ranger check nala nmap arandr alacritty gdebi


xdg-user-dirs-update
sudo systemctl enable enable lightdm.service

cd $builddir
mkdir -p ~/.config
mkdir -p ~/.fonts
mkdir -p ~/Pictures/Backgrounds
mkdir -p ~/Pictures/Screenshots
cp -R dotfiles/* ~/.config/
cp wallpapers/* ~/Pictures/Backgrounds/
sudo cp fonts/* /usr/share/fonts/truetype/
sudo cp dotfiles/slim/slim.conf /etc
sudo cp -r dotfiles/slim/blue-sky /usr/share/slim/themes
chown -R $username:$username ~/
rm -r -d ~/.config/slim


cd /tmp
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
/tmp/nerd-fonts/install.sh 
