#!/bin/bash

pacman -S --needed git base-devel picom conky i3 alacritty polybar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox dmenu lxappearance ttf-font-awesome vim nemo feh blueman ibus

USER = $(whoami)

mkdir /home/$USER/.config/picom
mkdir /home/$USER/.config/conky
mkdir /home/$USER/.config/i3
mkdir /home/$USER/.config/alacritty
mkdir /home/$USER/.config/polybar
mkdir /home/$USER/.config/screenlayout
mkdir /home/$USER/.themes
mkdir /home/$USER/Documents
mkdir /home/$USER/Downloads
mkdir /home/$USER/Pictures
mkdir /home/$USER/Music
mkdir /home/$USER/Videos

mv backgrounds/ /usr/share
mv picom.conf /home/$USER/.config/picom
mv conky.conf /home/$USER/.config/conky
mv config /home/$USER/.config/i3
mv alacritty.toml /home/$USER/.config/alacritty
mv config.ini /home/$USER/.config/polybar
mv officelayout.sh /home/$USER/.config/screenlayout
mv -f lightdm-gtk-greeter.conf /etc/lightdm

git clone https://github.com/dracula/gtk
mv gtk/ /home/$USER/.themes
cp -r /home/$USER/.themes/gtk/ /usr/share/themes

git clone https://github.com/Coopydood/HyperFluent-GRUB-Theme
cd HyperFluent-GRUB-Theme
mv arch/ /boot/grub/themes
cd

sed -i -e '$a\GRUB_THEME="/boot/grub/themes/arch/themes.txt"' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

feh --bg-scale /usr/share/backgrounds/XT_Wallpaper_001.jpg
sed -i -e '$a\background = /usr/share/backgrounds/XT_Wallpaper_001.jpg' /etc/lightdm/lightdm-gtk-greeter.conf
systemctl restart lightdm
