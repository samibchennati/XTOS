#!/bin/bash

pacman -S picom conky i3 alacritty polybar

mkdir /usr/share/backgrounds
mkdir /home/sami/.config/picom
mkdir /home/sami/.config/conky
mkdir /home/sami/.config/i3
mkdir /home/sami/.config/alacritty
mkdir /home/sami/.config/polybar

mv conky.conf /home/sami/.config/conky
mv config /home/sami/.config/i3
mv alacritty.toml /home/sami/.config/alacritty
mv config.ini /home/sami/.config/polybar
