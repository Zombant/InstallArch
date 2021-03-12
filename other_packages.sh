#! /bin/bash

# Setup environment with xorg, plasma, and lightdm with a theme
pacman -S xorg xorg-xinit plasma-meta lightdm lightdm-gtk-greeter lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm
echo "exec startplasma-x11" >> ~/.xinitrc
systemctl enable lightdm

sed -i '/#user-session=/ c user-session=plasma' /etc/lightdm/lightdm.conf
sed -i '/#greeter-session=/ c greeter-session=lightdm-webkit2-greeter' /etc/lightdm/lightdm.conf

sed -i '/^webkit_theme/ c webkit_theme = litarvan' /etc/lightdm/lightdm-webkit-greeter.conf

# Other stuff
pacman -S dolphin firefox termite --noconfirm

# Update
pacman -Syu