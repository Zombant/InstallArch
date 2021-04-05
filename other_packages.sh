#! /bin/bash

# Download pacman.conf (enables mirrors)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/pacman.conf > /etc/pacman.conf

# Setup environment
pacman -Syu --noconfirm
pacman -S xorg xorg-xinit --noconfirm

read -n1 -p "Install plasma? [y/n]" PLASMA
case $PLASMA in
	y|Y)
	echo "Installing plasma..."
	pacman -S plasma-meta --noconfirm
	echo "exec startplasma-x11" >> ~/.xinitrc
	systemctl enable sddm.service
	;;
	n|N)
	echo ""
	;;
	*)
	echo "Installing plasma..."
	pacman -S plasma-meta --noconfirm
	echo "exec startplasma-x11" >> ~/.xinitrc
	systemctl enable sddm.service
	;;
esac
clear
read -n1 -p "Install XMonad with xmobar? [y/n]" XMONAD
case $XMONAD in
	y|Y)
	# XMonad and xmobar
	echo "Installing XMonad and xmobar..."
	pacman -S xmonad xmonad-contrib dmenu nitrogen xmobar cabal-install xdotool lxappearance pulseaudio pulseaudio-alsa alsa-utils picom --noconfirm

	# Copy xmonad config
	mkdir /home/${1}/.xmonad
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.xmonad/xmonad.hs >> /home/${1}/.xmonad/xmonadtemp.hs
	cat /home/${1}/.xmonad/xmonadtemp.hs > /home/${1}/.xmonad/xmonad.hs
	rm /home/${1}/.xmonad/xmonadtemp.hs
	xmonad --recompile

	mkdir /home/${1}/.config
	mkdir /home/${1}/.config/xmobar
	# curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/xmobar/xmobarrc0 >> /home/${1}/.config/xmobar/xmobarrc0
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/xmobar/xmobarrc0.hs >> /home/${1}/.config/xmobar/xmobarrc0temp.hs
	cat /home/${1}/.config/xmobar/xmobarrc0temp.hs > /home/${1}/.config/xmobar/xmobarrc0.hs
	rm /home/${1}/.config/xmobar/xmobarrc0temp.hs

	ghc --make -threaded -dynamic /home/${1}/.config/xmobar/xmobarrc0.hs -package xmobar
	

	# Audio
	pulseaudio --check
	pulseaudio -D

	# Bluetooth stuff
	pacman -S bluez bluez-utils pulseaudio-bluetooth blueman --noconfirm
	modprobe btusb
	systemctl enable bluetooth

	# Allow user to change brightness
	# For intel
	# mkdir -p /etc/udev/rules.d
	# touch /etc/udev/rules.d/backlight.rules
	# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness\"" > /etc/udev/rules.d/backlight.rules
	# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness\"" >> /etc/udev/rules.d/backlight.rules
	
	;;
	n|N)
	echo ""
	;;
	*)
	# XMonad and xmobar
	echo "Installing XMonad and xmobar..."
	pacman -S xmonad xmonad-contrib dmenu nitrogen xmobar cabal-install xdotool lxappearance pulseaudio pulseaudio-alsa alsa-utils picom ttf-ubuntu-font-family --noconfirm
	mkdir /home/${1}/.xmonad
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.xmonad/xmonad.hs >> /home/${1}/.xmonad/xmonadtemp.hs
	cat /home/${1}/.xmonad/xmonadtemp.hs > /home/${1}/.xmonad/xmonad.hs
	rm /home/${1}/.xmonad/xmonadtemp.hs
	xmonad --recompile
	mkdir /home/${1}/.config
	mkdir /home/${1}/.config/xmobar
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/xmobar/xmobarrc0 >> /home/${1}/.config/xmobar/xmobarrc0

	# Audio
	pulseaudio --check
	pulseaudio -D

	# Bluetooth stuff
	pacman -S bluez bluez-utils pulseaudio-bluetooth blueman --noconfirm
	modprobe btusb
	systemctl enable bluetooth

	# Allow user to change brightness
	# For intel
	# mkdir -p /etc/udev/rules.d
	# touch /etc/udev/rules.d/backlight.rules
	# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness\"" > /etc/udev/rules.d/backlight.rules
	# echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"intel_backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness\"" >> /etc/udev/rules.d/backlight.rules
	
	;;
esac

# Other stuff
# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S pcmanfm termite intellij-idea-community-edition anki arduino blender cmatrix gimp grub-customizer libreoffice-still jre-openjdk neofetch steam ttf-liberation java-runtime discord stellarium putty wireshark-qt virtualbox virtualbox-host-modules-arch arandr pavucontrol doge

# Download .bashrc
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.bashrc > /home/${1}/.bashrc

# Download termite config
mkdir /home/${1}/.config/termite
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/termite/config > /home/${1}/.config/termite/config

### This section downloads from the AUR

# Download paru
#git clone https://aur.archlinux.org/paru.git /home/${1}/paru
#chown ${1} /home/${1}/paru

# Download shell-color-scripts
git clone https://aur.archlinux.org/shell-color-scripts.git /home/${1}/shell-color-scripts
chown ${1} /home/${1}/shell-color-scripts

# Download android-studio
git clone https://aur.archlinux.org/android-studio.git /home/${1}/android-studio
chown ${1} /home/${1}/android-studio

# Download zoom
git clone https://aur.archlinux.org/zoom.git /home/${1}/zoom
chown ${1} /home/${1}/zoom

# Download minecraft-launcher
git clone https://aur.archlinux.org/minecraft-launcher.git /home/${1}/minecraft-launcher
chown ${1} /home/${1}/minecraft-launcher

# Download chrome-remote-desktop
git clone https://aur.archlinux.org/chrome-remote-desktop.git /home/${1}/chrome-remote-desktop
chown ${1} /home/${1}/chrome-remote-desktop

# Download brave-bin
git clone https://aur.archlinux.org/brave-bin.git /home/${1}/brave-bin
chown ${1} /home/${1}/brave-bin

# Download chrome-remote-desktop
git clone https://aur.archlinux.org/chrome-remote-desktop.git /home/${1}/chrome-remote-desktop
chown ${1} /home/${1}/brave-bin

# Download nerd-fonts-mononoki
git clone https://aur.archlinux.org/nerd-fonts-mononoki.git /home/${1}/nerd-fonts-mononoki
chown ${1} /home/${1}/nerd-fonts-mononoki

###

# Run as user
su $1 <<EOF

	### This section installs downloaded AUR packages
	# Install paru
	#cd /home/${1}/paru
	#makepkg -sri --noconfirm
	# Sync AUR
	#paru -Syu
	
	# Install shell-color-scripts
	cd /home/${1}/shell-color-scripts
	makepkg -sri --noconfirm

	# Install android-studio
	cd /home/${1}/android-studio
	makepkg -sri --noconfirm

	# Install zoom
	cd /home/${1}/zoom
	makepkg -sri --noconfirm
	
	# Install minecraft-launcher
	cd /home/${1}/minecraft-launcher
	makepkg -sri --noconfirm

	# Install chrome-remote-desktop
	cd /home/${1}/chrome-remote-desktop
	makepkg -sri --noconfirm

	# Install brave-bin
	cd /home/${1}/brave-bin
	makepkg -sri --noconfirm

	# Install chrome-remote-desktop
	cd /home/${1}/chrome-remote-desktop
	makepkg -sri --noconfirm

	# Install nerd-fonts-mononoki
	cd /home/${1}/nerd-fonts-mononoki
	makepkg -sri --noconfirm


	# Clean up home directory
	cd /home/${1}
	rm -rf paru
	rm -rf shell-color-scripts
	rm -rf android-studio
	rm -rf zoom
	rm -rf minecraft-launcher
	rm -rf chrome-remote-desktop
	rm -rf brave-bin
	rm -rf nerd-fonts-mononoki

	###

EOF