#!/bin/bash

# Checking if is running in Repo Folder
if [[ "$(basename "$(pwd)" | tr '[:upper:]' '[:lower:]')" =~ ^scripts$ ]]; then
    echo "You are running this in XTOS Folder."
    echo "Please use ./xtos.sh instead"
    exit
fi

# Installing git

echo "Installing git."
pacman -Sy --noconfirm --needed git glibc

echo "Cloning the XTOS Project"
git clone https://github.com/samibchennati/XTOS

echo "Executing XTOS Script"

cd $HOME/XTOS

exec ./xtos.sh
