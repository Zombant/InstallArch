#! /bin/bash

# Download pacman.conf (enables mirrors)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/pacman.conf > /etc/pacman.conf

# Download makepkg.conf (use all CPU cores)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/makepkg.conf > /etc/makepkg.conf

# Download 30-touchpad.conf
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/30-touchpad.conf > /etc/X11/xorg.conf.d/30-touchpad.conf

# Setup xorg
pacman -Syu --noconfirm
pacman -S xorg xorg-xinit --noconfirm


## Stuff for all window managers ##

# SDDM
pacman -S sddm --noconfirm
systemctl enable sddm

# Lock screen
pacman -S xlockmore --noconfirm

# File managers/File systems
pacman -S pcmanfm ntfs-3g cifs-utils fuse --noconfirm

# Policy Kit
pacman -S lxsession --noconfirm

# Audio stuff
pacman -S pulseaudio pulseaudio-alsa alsa-utils pavucontrol --noconfirm
pulseaudio --check
pulseaudio -D

# Bluetooth stuff
pacman -S bluez bluez-utils pulseaudio-bluetooth blueman --noconfirm
modprobe btusb
systemctl enable bluetooth
systemctl start bluetooth

# Appearance
pacman -S nitrogen picom arandr scrot --noconfirm

# Fonts
pacman -S ttf-ubuntu-font-family noto-fonts-emoji xorg-fonts-misc xorg-xlsfonts xorg-xfontsel --noconfirm

# Themes and icons
pacman -S lxappearance qt5ct breeze-gtk breeze-icons arc-gtk-theme arc-icon-theme --noconfirm

# Notifications
pacman -S dunst libnotify --noconfirm

# System tray
pacman -S stalonetray --noconfirm

# Network applet
pacman -S network-manager-applet --noconfirm

# Compression
pacman -S zip unzip atool --noconfirm

# Android phone
pacman -S android-file-transfer --noconfirm

# KVM Virtual Machines
pacman -S qemu virt-manager ebtables dnsmasq --noconfirm
systemctl enable libvirtd
systemctl start libvirtd
sudo usermod -G libvirt -a ${1}

# Other programs
pacman -S udisks2 xdotool xorg-xclock xlockmore gpick --noconfirm

# Changing brightness
# For intel
# mkdir -p /etc/udev/rules.d
# touch /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness\"" > /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness\"" >> /etc/udev/rules.d/backlight.rules

# Window managers
# XMonad and xmobar
pacman -S xmonad xmonad-contrib xmobar cabal-install --noconfirm

# After installing dotfiles:
# ghc --make -threaded -dynamic $HOME/.config/xmobar/xmobarrc0.hs -package xmobar

# Openbox and tint2
pacman -S openbox tint2 obconf --noconfirm


# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S  anki grub-customizer libreoffice-fresh jre-openjdk steam ttf-liberation java-runtime discord stellarium wireshark-qt virtualbox virtualbox-host-modules-arch iftop macchanger calcurse exa bat ripgrep tokei procs prettyping dvdstyler nmap youtube-dl --noconfirm

# Terminals
pacman -S alacritty xterm --noconfirm

# Text editors
pacman -S neovim emacs gedit --noconfirm

# Document viewers
pacman -S atril zathura zathura-pdf-mupdf --noconfirm

# Image viewers
pacman -S feh --noconfirm

# Media players
pacman -S vlc mpv --noconfirm

# Browsers
pacman -S qutebrowser amfora --noconfirm

# Email
pacman -S isync neomutt --noconfirm

# Programming/IDEs
pacman -S intellij-idea-community-edition pycharm-community-edition code arduino arduino-avr-core --noconfirm

# Graphics/design
pacman -S gimp blender imagemagick --noconfirm

# Audio editors
pacman -S audacity mpg123 --noconfirm

# Calculators
pacman -S qalculate-gtk --noconfirm

# Install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# .NET Core and mono
pacman -S dotnet-runtime dotnet-sdk mono-msbuild mono --noconfirm

# Fun stuff
pacman -S cmatrix doge figlet lolcat neofetch --noconfirm

# AUR
pacman -S base-devel --noconfirm

### AUR packages to install
# agate-bin
# android-studio
# balena-etcher
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
# scrcpy
# lf
# networkmanager-dmenu-git

# Set up snaps
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
