#!/bin/bash

pacman -S --needed git base-devel picom conky i3 alacritty polybar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox git dmenu lxappearance ttf-font-awesome vim nemo feh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay install brave-bin

mkdir /usr/share/backgrounds
mkdir /home/sami/.config/picom
mkdir /home/sami/.config/conky
mkdir /home/sami/.config/i3
mkdir /home/sami/.config/alacritty
mkdir /home/sami/.config/polybar
mkdir /home/sami/.config/screenlayout
mkdir /home/sami/.themes

mv backgrounds/ /usr/share/
mv picom.conf /home/sami/.config/picom
mv conky.conf /home/sami/.config/conky
mv config /home/sami/.config/i3
mv alacritty.toml /home/sami/.config/alacritty
mv config.ini /home/sami/.config/polybar
mv officelayout.sh /home/sami/.config/screenlayout

feh --bg-scale /usr/share/backgrounds/XT_Wallpaper_001.jpg
sed -i -e '$a\background = /usr/share/backgrounds/XT_Wallpaper_001.jpg' /etc/lightdm/lightdm-gtk-greeter.conf

git clone https://github.com/dracula/gtk
mv gtk/ /home/sami/.themes
cp -r /home/sami/.themes/gtk/ /usr/share/themes/ 
mv -f lightdm-gtk-greeter.conf /etc/lightdm
systemctl restart lightdm

git clone https://github.com/Coopydood/HyperFluent-GRUB-Theme
cd HyperFluent-GRUB-Theme
mv arch/ /boot/grub/themes
cd

sed -i -e '$a\GRUB_THEME="/boot/grub/themes/arch/themes.txt"' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

 
