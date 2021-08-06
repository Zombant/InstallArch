#! /bin/bash

# Download pacman.conf (enables mirrors)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/pacman.conf > /etc/pacman.conf

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
pacman -S vifm pcmanfm ntfs-3g cifs-utils --noconfirm

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

# Graphics and Appearance stuff
pacman -S nitrogen lxappearance qt5ct picom arandr breeze-gtk breeze-icons arc-gtk-theme ttf-ubuntu-font-family noto-fonts-emoji scrot --noconfirm

# Notifications
pacman -S dunst libnotify

# Other programs
pacman -S udisks2 xdotool xorg-xclock xorg-xfontsel xlockmore atril feh zip unzip fuse gpick --noconfirm	

# Changing brightness
# For intel
# mkdir -p /etc/udev/rules.d
# touch /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness\"" > /etc/udev/rules.d/backlight.rules
# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness\"" >> /etc/udev/rules.d/backlight.rules


clear

read -p "Install XMonad with xmobar? [y/n]" XMONAD
case $XMONAD in
    y|Y)
	# XMonad and xmobar
	pacman -S xmonad xmonad-contrib xmobar cabal-install --noconfirm
	
	;;
    
    n|N)
	echo ""
	
	;;

    *)
	# XMonad and xmobar
	pacman -S xmonad xmonad-contrib xmobar cabal-install --noconfirm
	
	;;
esac

read -p "Install openbox with tint2 panel? [y/n]" OPENBOX
case $OPENBOX in
    y|Y)
	# Openbox and tint2
	pacman -S openbox tint2 obconf --noconfirm
	
	;;
    
    n|N)
	echo ""

	;;
    
    *)
	# Openbox and tint2
	pacman -S openbox tint2 obconf --noconfirm
	
	;;

## Stuff for any system ##
# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S alacritty xterm intellij-idea-community-edition pycharm-community-edition code gedit anki arduino arduino-avr-core blender cmatrix gimp grub-customizer libreoffice-fresh jre-openjdk neofetch steam ttf-liberation java-runtime discord stellarium putty wireshark-qt virtualbox virtualbox-host-modules-arch doge iftop vlc vim emacs qutebrowser amfora audacity doge macchanger calcurse exa bat ripgrep tokei procs figlet prettyping dvdstyler newsflash nmap youtube-dl neomutt


# KVM Virtual Machines
pacman -S qemu virt-manager ebtables dnsmasq --noconfirm
systemctl enable libvirtd
systemctl start libvirtd
sudo usermod -G libvirt -a ${1}

# Install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install .NET Core and mono
pacman -S dotnet-runtime dotnet-sdk mono-msbuild mono --noconfirm

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
# openrazer-driver-dkms
# paru
# python-spotdl
# shell-color-scripts
# snapd
# ttf-ms-fonts
# ttf-vista-fonts
# unityhub
# zoom


###

# Run as user
su $1 <<EOF


EOF

# Set up snaps
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
