#!/bin/bash

pacman -S picom conky i3 alacritty polybar nitrogen lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings gedit firefox git dmenu lxappearance ttf-font-awesome vim nemo

mkdir /usr/share/backgrounds
mkdir /home/sami/.config/picom
mkdir /home/sami/.config/conky
mkdir /home/sami/.config/i3
mkdir /home/sami/.config/alacritty
mkdir /home/sami/.config/polybar
mkdir /home/sami/.config/screenlayout

mv picom.conf /home/sami/.config/picom
mv conky.conf /home/sami/.config/conky
mv config /home/sami/.config/i3
mv alacritty.toml /home/sami/.config/alacritty
mv config.ini /home/sami/.config/polybar
mv officelayout.sh /home/sami/.config/screenlayout

git clone https://github.com/Coopydood/HyperFluent-GRUB-Theme
cd HyperFluent-GRUB-Theme
mv /arch /boot/grub/themes
cd

lineNumber=$(grep --line-number "GRUB_THEME=" /etc/default/grub.txt | cut -f1 -d:)
replacedLine="GRUB_THEME="/boot/grub/themes/hyperfluent-arch/theme.txt"
sed -i "$lineNumber s/.*/'$replacedLine'/" /etc/default/grub.txt

grub-mkconfig -o /boot/grub/grub.cfg
