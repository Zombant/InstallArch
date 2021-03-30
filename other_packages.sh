#! /bin/bash

# Setup environment
pacman -Syu
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
	echo "Installing XMonad and xmobar..."
	pacman -S xmonad xmonad-contrib dmenu nitrogen xmobar xdotool lxappearance pulseaudio pulseaudio-alsa alsa-utils --noconfirm
	pulseaudio --check
	pulseaudio -D
	mkdir /home/${1}/.xmonad
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.xmonad/xmonad.hs >> /home/${1}/.xmonad/xmonad.hs
	mkdir /home/${1}/.config/xmobar
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/xmobar/xmobarrc0 >> /home/${1}/.config/xmobar/xmobarrc0
	;;
	n|N)
	echo ""
	;;
	*)
	echo "Installing XMonad and xmobar..."
	pacman -S xmonad xmonad-contrib dmenu nitrogen xmobar xdotool lxappearance pulseaudio pulseaudio-alsa alsa-utils--noconfirm
	pulseaudio --check
	pulseaudio -D
	mkdir /home/${1}/.xmonad
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.xmonad/xmonad.hs >> /home/${1}/.xmonad/xmonad.hs
	mkdir /home/${1}/.config/xmobar
	curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/home/.config/xmobar/xmobarrc0 >> /home/${1}/.config/xmobar/xmobarrc0
	;;
esac

# Other stuff
# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S dolphin termite intellij-idea-community-edition anki arduino blender cmatrix gimp grub-customizer libreoffice-still jre-openjdk neofetch steam ttf-liberation java-runtime discord stellarium putty wireshark-qt virtualbox virtualbox-host-modules-arch arandr pavucontrol doge


# Download pacman.conf
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/pacman.conf > /etc/pacman.conf

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


	# Clean up home directory
	cd /home/${1}
	rm -rf paru
	rm -rf shell-color-scripts
	rm -rf android-studio
	rm -rf zoom
	rm -rf minecraft-launcher
	rm -rf chrome-remote-desktop
	rm -rf brave-bin

	###

EOF