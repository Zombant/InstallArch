#! /bin/bash

# Xorg
pacman -S xorg xorg-xinit --noconfirm

# SDDM
pacman -S sddm --noconfirm
systemctl enable sddm

# Lock screen
pacman -S xlockmore --noconfirm
# slock

# File systems
pacman -S ntfs-3g cifs-utils fuse --noconfirm

# Set up pulseaudio
pacman -S pulseaudio pulseaudio-alsa alsa-utils pavucontrol --noconfirm
pulseaudio --check
pulseaudio -D

# Set up Bluetooth
pacman -S bluez bluez-utils pulseaudio-bluetooth blueman --noconfirm
modprobe btusb
systemctl enable bluetooth
systemctl start bluetooth

# Compositor
pacman -S picom --noconfirm

# Screenshot utility
pacman -S maim --noconfirm

# Fonts
pacman -S ttf-ubuntu-font-family noto-fonts-emoji xorg-fonts-misc xorg-xlsfonts xorg-xfontsel --noconfirm

# Wallpapers
pacman -S nitrogen archlinux-wallpaper livewallpaper --noconfirm

# Notifications
pacman -S dunst libnotify --noconfirm

# Applets applet
pacman -S network-manager-applet pasystray --noconfirm

# Compression
pacman -S zip unzip --noconfirm

# Android phone
pacman -S android-file-transfer scrcpy --noconfirm

## Virtual Machines
# KVM
pacman -S qemu virt-manager ebtables dnsmasq --noconfirm
systemctl enable libvirtd
systemctl start libvirtd
sudo usermod -G libvirt -a ${1}

# Virtualbox
pacman -S virtualbox virtualbox-host-modules-arch --noconfirm

# Easy management of drives
pacman -S udisks2 --noconfirm

# Changing brightness
# For HP Pavilion
# mkdir -p /etc/udev/rules.d
# touch /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness\"" > /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness\"" >> /etc/udev/rules.d/backlight.rules

# For Lenovo Flex
#mkdir -p /etc/udev/rules.d
#touch /etc/udev/rules.d/backlight.rules
#echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"amdgpu_b10\", RUN+=\"/usr/bin/chrgrp video /sys/class/backlight/amdgpu_b10/brightness\"" > /etc/udev/rules.d/backlight.rules
#echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"amdgpu_b10\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/amdgpu_b10/brightness\"" >> /etc/udev/rules.d/backlight.rules


## Window managers

# XMonad and xmobar
pacman -S xmonad xmonad-contrib xmobar cabal-install --noconfirm
# After installing dotfiles:
# ghc --make -threaded -dynamic $HOME/.config/xmobar/xmobarrc0.hs -package xmobar

# Openbox and tint2
pacman -S openbox tint2 obconf --noconfirm

# XFCE
pacman -S xfce4 --noconfirm

# Bspwm
pacman -S bspwm sxhkd --noconfirm

# dwm

# Docks
pacman -S plank --noconfirm

# Misc.
# ttf-liberation is a font for steam
#dvdstyler
pacman -Syu --noconfirm
pacman -S grub-customizer libreoffice-fresh jre-openjdk steam ttf-liberation java-runtime discord stellarium wireshark-qt iftop macchanger calcurse exa bat procs prettyping nmap youtube-dl shellcheck wget gpick xorg-xclock xdotool arandr --noconfirm

# Themes and icons
pacman -S lxappearance qt5ct breeze-gtk breeze-icons arc-gtk-theme arc-icon-theme --noconfirm
wget -qO- https://git.io/papirus-icon-theme-install | sh

# Terminals
pacman -S alacritty xterm --noconfirm

# File manager
pacman -S pcmanfm filezilla --noconfirm

# Run launcher
pacman -S rofi --noconfirm
#dmenu

# Graphical storage viewer
pacman -S baobab --noconfirm

# System monitor
pacman -S htop --noconfirm

# Text editors
pacman -S neovim emacs gedit nano geany --noconfirm

# Document viewers
pacman -S atril zathura zathura-pdf-mupdf --noconfirm

# Document mergers
pacman -S poppler --noconfirm

# Image viewers
pacman -S feh --noconfirm

# Media players
#mplayer
pacman -S vlc mpv --noconfirm

# Audio visualizer
pacman -S glava --noconfirm

# Browsers
#firefox lynx
pacman -S qutebrowser amfora --noconfirm

# Email
pacman -S neomutt --noconfirm

# Programming/IDEs
# pacman -S nasm --noconfirm
pacman -S intellij-idea-community-edition pycharm-community-edition atom arduino arduino-avr-core --noconfirm

# Graphics/design
pacman -S gimp blender --noconfirm

# Audio editors
pacman -S audacity --noconfirm

# Calculators
# gcc-fortran is for octave packages
pacman -S qalculate-gtk octave gcc-fortran --noconfirm

# Install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# .NET Core and mono
# pacman -S dotnet-runtime dotnet-sdk mono-msbuild mono --noconfirm

# Torrent clients
pacman -S qbittorrent --noconfirm

# VPN
# pacman -S openvpn networkmanager-openvpn --noconfirm

# Password manager
pacman -S keepassxc --noconfirm

# Cloud sync
pacman -S nextcloud-client --noconfirm

# Fun stuff
pacman -S cmatrix doge figlet lolcat neofetch --noconfirm

# AUR
pacman -S base-devel --noconfirm


### AUR packages to install
# agate-bin
# android-studio
# anki
# blugon
# brave-bin
# joplin-desktop
# minecraft-launcher
# moc-pulse-svn
# nerd-fonts-mononoki
# nerd-fonts-roboto-mono
# openrazer-meta
# polychromatic-git
# paru
# python-spotdl
# snap
# ttf-ms-fonts
# ttf-vista-fonts
# unityhub
# zoom
# nbtexplorer-bin
# rpi-imager
# lf
# networkmanager-dmenu-git
# text2pdf
# polybar
# kjv-git
# flashplayer-standalone
# librewolf-bin
# mutt-wizard-git

# Set up snaps
#systemctl enable --now snapd.socket
#ln -s /var/lib/snapd/snap /snap
