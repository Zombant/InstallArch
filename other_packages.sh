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
pacman -S vifm pcmanfm ntfs-3g --noconfirm

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
pacman -S nitrogen lxappearance qt5ct picom arandr breeze-gtk breeze-icons arc-gtk-theme ttf-ubuntu-font-family scrot --noconfirm

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

## Stuff for any system ##
# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S alacritty xterm intellij-idea-community-edition pycharm-community-edition code gedit anki arduino arduino-avr-core blender cmatrix gimp grub-customizer libreoffice-fresh jre-openjdk neofetch steam ttf-liberation java-runtime discord stellarium putty wireshark-qt virtualbox virtualbox-host-modules-arch doge iftop vlc vim emacs qutebrowser amfora audacity doge macchanger calcurse exa bat ripgrep tokei procs figlet


# KVM Virtual Machines
pacman -S qemu virt-manager ebtables dnsmasq --noconfirm
systemctl enable libvirtd
systemctl start libvirtd
sudo usermod -G libvirt -a ${1}

# Install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install .NET Core and mono
pacman -S dotnet-runtime dotnet-sdk mono-msbuild mono --noconfirm

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

# Download nerd-fonts-roboto-mono
git clone https://aur.archlinux.org/nerd-fonts-roboto-mono.git /home/${1}/nerd-fonts-roboto-mono
chown ${1} /home/${1}/nerd-fonts-roboto-mono

# Download joplin-desktop
git clone https://aur.archlinux.org/joplin.git /home/${1}/joplin
chown ${1} /home/${1}/joplin

# Download openrazer-driver-dkms
git clone https://aur.archlinux.org/openrazer.git
chown ${1} /home/${1}/openrazer

# Download balena-etcher
git clone https://aur.archlinux.org/balena-etcher.git
chown ${1} /home/${1}/balena-etcher

# Download unityhub
git clone https://aur.archlinux.org/unityhub.git
chown ${1} /home/${1}/unityhub

# Download microsoft fonts
git clone https://aur.archlinux.org/ttf-ms-fonts.git
git clone https://aur.archlinux.org/ttf-vista-fonts.git
chown ${1} /home/${1}/ttf-ms-fonts
chown ${1} /home/${1}/ttf-vista-fonts

# Download snapd
git clone https://aur.archlinux.org/snapd.git
chown ${1} /home/${1}/snapd

# Download blugon
git clone https://aur.archlinux.org/blugon.git
chown ${1} /home/${1}/blugon

# Download gmi2html
git clone https://aur.archlinux.org/gmi2html.git /home/${1}/gmi2html
chown ${1} /home/${1}/gmi2html

git clone https://aur.archlinux.org/newsflash.git /home/${1}/newsflash
chown ${1} /home/${1}/newsflash

git clone https://aur.archlinux.org/shortwave.git /home/${1}/shortwave
chown ${1} /home/${1}/shortwave

chown ${1} -R /home/${1}

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

	# Install nerd-fonts-mononoki
	cd /home/${1}/nerd-fonts-mononoki
	makepkg -sri --noconfirm

	# Install nerd-fonts-roboto-mono
	cd /home/${1}/nerd-fonts-roboto-mono
	makepkg -sri --noconfirm

	# Install joplin
	cd /home/${1}/joplin
	makepkg -sri --noconfirm

   	# Install openrazer-driver-dkms
    	cd /home/${1}/openrazer
    	makepkg -sri --noconfirm

    	# Install balena-etcher
    	cd /home/${1}/balena-etcher
    	makepkg -sri --noconfirm
    	
    	# Install unityhub
    	cd /home/${1}/unityhub
    	makepkg -sri --noconfirm

    	# Install microsoft fonts
    	cd /home/${1}/ttf-ms-fonts
    	makepkg -sri --noconfirm
    	cd /home/${1}/ttf-vista-fonts
    	makepkg -sri --noconfirm
    
    	# Install snapd
    	cd /home/${1}/snapd
    	makepkg -sri --noconfirm

        # Install blugon
    	cd /home/${1}/blugon
    	makepkg -sri --noconfirm

        # Install gmi2html
    	cd /home/${1}/gmi2html
    	makepkg -sri --noconfirm

	# Install newsflash
    	cd /home/${1}/newsflash
    	makepkg -sri --noconfirm

	# Install shortwave
    	cd /home/${1}/shortwave
    	makepkg -sri --noconfirm

	# Clean up home directory
	cd /home/${1}
	rm -rf paru/
	rm -rf shell-color-scripts/
	rm -rf android-studio/
	rm -rf zoom/
	rm -rf minecraft-launcher/
	rm -rf chrome-remote-desktop/
	rm -rf brave-bin/
	rm -rf nerd-fonts-mononoki/
	rm -rf nerd-fonts-roboto-mono/
	rm -rf joplin/
   	rm -rf openrazer/
    	rm -rf balena-etcher/
    	rm -rf ttf-ms-fonts/
    	rm -rf ttf-vista-fonts
    	rm -rf snapd/
    	rm -rf blugon/
    	rm -rf gmi2html/
	rm -rf newsflash/
	rm -rf shortwave/
	###

EOF

# Set up snaps
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
