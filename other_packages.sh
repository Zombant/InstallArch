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
pacman -S dolphin firefox termite intellij-idea-community-edition anki arduino blender cmatrix gimp grub-customizer libreoffice-still jre-openjdk neofetch steam ttf-liberation

# Install yay
pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay.git /home/${1}/yay
chown ${1} /home/${1}/yay
su $1 <<EOF
	cd /home/${1}/yay
	makepkg -sri --noconfirm
	# Sync AUR
	yay -Syu	

	# Install AUR packages
	yay -S android-studio
	yay -S  zoom
	yay -S minecraft-launcher
EOF