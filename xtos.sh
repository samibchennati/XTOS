#!/bin/bash

pacman -Syu
pacman -S --needed git base-devel picom conky i3 alacritty polybar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox dmenu lxappearance ttf-font-awesome vim nemo feh blueman ibus

user=${SUDO_USER: -$USER}

mkdir -p /home/$user/.config/picom
mkdir -p /home/$user/.config/conky
mkdir -p /home/$user/.config/i3
mkdir -p /home/$user/.config/alacritty
mkdir -p /home/$user/.config/polybar
mkdir -p /home/$user/.config/screenlayout
mkdir -p /home/$user/.themes
mkdir -p /home/$user/Documents
mkdir -p /home/$user/Downloads
mkdir -p /home/$user/Pictures
mkdir -p /home/$user/Music
mkdir -p /home/$user/Videos

mv backgrounds/ /usr/share
mv picom.conf /home/$user/.config/picom
mv conky.conf /home/$user/.config/conky
mv config /home/$user/.config/i3
mv alacritty.toml /home/$user/.config/alacritty
mv config.ini /home/$user/.config/polybar
mv officelayout.sh /home/$user/.config/screenlayout
mv -f lightdm-gtk-greeter.conf /etc/lightdm

git clone https://github.com/dracula/gtk
mv gtk/ /home/$user/.themes
cp -r /home/$user/.themes/gtk/ /usr/share/themes

git clone https://github.com/Coopydood/HyperFluent-GRUB-Theme
cd HyperFluent-GRUB-Theme
mv arch/ /boot/grub/themes
cd

sed -i -e '$a\GRUB_THEME="/boot/grub/themes/arch/themes.txt"' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

feh --bg-scale /usr/share/backgrounds/XT_Wallpaper_001.jpg
sed -i -e '$a\background = /usr/share/backgrounds/XT_Wallpaper_001.jpg' /etc/lightdm/lightdm-gtk-greeter.conf

