#!/bin/bash

pacman -S --needed git base-devel picom conky i3 alacritty polybar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox dmenu lxappearance ttf-font-awesome vim nemo feh blueman ibus

user = $(whoami)

mkdir /home/$user/.config/picom
mkdir /home/$user/.config/conky
mkdir /home/$user/.config/i3
mkdir /home/$user/.config/alacritty
mkdir /home/$user/.config/polybar
mkdir /home/$user/.config/screenlayout
mkdir /home/$user/.themes
mkdir /home/$user/Documents
mkdir /home/$user/Downloads
mkdir /home/$user/Pictures
mkdir /home/$user/Music
mkdir /home/$user/Videos

mv backgrounds/ /usr/share
mv picom.conf /home/$user/.config/picom
mv conky.conf /home/$user/.config/conky
mv config /home/$user/.config/i3
mv alacritty.toml /home/$user/.config/alacritty
mv config.ini /home/$user/.config/polybar
mv officelayout.sh /home/$user/.config/screenlayout
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
