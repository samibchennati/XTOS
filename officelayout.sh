#!/bin/sh
xrandr --output HDMI-1 --primary --mode 2560x1600 --pos 1050x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --mode 1680x1050 --pos 0x0 --rotate left

killall conky
conky
nitrogen --restore
