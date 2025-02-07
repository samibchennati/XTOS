#!/bin/bash

pacman -S picom conky i3 alacritty polybar

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

