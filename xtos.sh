#!/bin/bash

pacman -S --needed git base-devel picom conky i3 alacritty polybar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox dmenu lxappearance ttf-font-awesome vim nemo feh blueman ibus

mkdir ~/.config/picom
mkdir ~/.config/conky
mkdir ~/.config/i3
mkdir ~/.config/alacritty
mkdir ~/.config/polybar
mkdir ~/.config/screenlayout
mkdir ~/.themes
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Pictures
mkdir ~/Music
mkdir ~/Videos

mv backgrounds/ /usr/share
mv picom.conf ~/.config/picom
mv conky.conf ~/.config/conky
mv config ~/.config/i3
mv alacritty.toml ~/.config/alacritty
mv config.ini ~/.config/polybar
mv officelayout.sh ~/.config/screenlayout
mv -f lightdm-gtk-greeter.conf /etc/lightdm

git clone https://github.com/dracula/gtk
mv gtk/ ~/.themes
cp -r ~/.themes/gtk/ /usr/share/themes

git clone https://github.com/Coopydood/HyperFluent-GRUB-Theme
cd HyperFluent-GRUB-Theme
mv arch/ /boot/grub/themes
cd

sed -i -e '$a\GRUB_THEME="/boot/grub/themes/arch/themes.txt"' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

feh --bg-scale /usr/share/backgrounds/XT_Wallpaper_001.jpg
sed -i -e '$a\background = /usr/share/backgrounds/XT_Wallpaper_001.jpg' /etc/lightdm/lightdm-gtk-greeter.conf

systemctl restart lightdm
