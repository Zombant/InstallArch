#! /bin/bash

# Setup environment
pacman -S xorg xorg-xinit plasma-meta --noconfirm

# pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm

echo "exec startplasma-x11" >> ~/.xinitrc
systemctl enable sddm.service

#sed -i '/#user-session=/ c user-session=plasma' /etc/lightdm/lightdm.conf
#sed -i '/#greeter-session=/ c greeter-session=lightdm-webkit2-greeter' /etc/lightdm/lightdm.conf
#sed -i '/^webkit_theme/ c webkit_theme = litarvan' /etc/lightdm/lightdm-webkit-greeter.conf

# Enable multilib
sed -i 's/#\[multilib\]/[multilib]\n\Include = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

# Other stuff
# ttf-liberation is a font for steam
pacman -Syu --noconfirm
pacman -S dolphin termite intellij-idea-community-edition anki arduino blender cmatrix gimp grub-customizer libreoffice-still jre-openjdk neofetch steam ttf-liberation java-runtime

### This section downloads from the AUR

# Download paru
git clone https://aur.archlinux.org/paru.git /home/${1}/paru
chown ${1} /home/${1}/paru

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

###

# Run as user
su $1 <<EOF
	# Add neofetch to .bashrc
	echo neofetch >> /home/${1}/.bashrc

	### This section installs downloaded AUR packages
	# Install paru
	cd /home/${1}/paru
	makepkg -sri --noconfirm
	# Sync AUR
	paru -Syu
	
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