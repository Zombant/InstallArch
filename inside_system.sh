#! /bin/bash

# Set the time zone
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Set hardware clock
hwclock --systohc

# Put locale in /etc/locale.gen and generate locales
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Set lanuguage
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Set hostname and save to /etc/hostname
clear
read -p "Enter the hostname for this computer: " HOST
echo "${HOST}" >> /etc/hostname

# Create hosts file
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${HOST}.localdomain	${HOST}" >> /etc/hosts

# Set up root password
echo ""
echo "Set up root password..."
passwd

# Set up user
echo ""
echo ""
echo "Set up user..."
read -p "Enter your username: " USERNAME
useradd -m ${USERNAME}
echo "Enter the password for ${USERNAME}":
passwd ${USERNAME}
usermod -aG wheel,audio,video,optical,storage ${USERNAME}

# Install sudo
pacman -S sudo --noconfirm
#echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
sed -i '/#\s*%wheel ALL=(ALL) ALL$/ c %wheel ALL=(ALL) ALL' /etc/sudoers

# Install grub
pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm
mkdir /boot/EFI
#read -p "Enter the EFI partition: " EFI
mount $1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Update
pacman -Syu --noconfirm

# Install and enable network manager
pacman -S networkmanager --noconfirm
systemctl enable NetworkManager

## Install and set up other necessities for a base install
pacman -S nano git base-devel iwd openssh htop --noconfirm
systemctl enable iwd


# Install DE and other packages
clear
read -n1 -p  "Base install finished. Install other packages? [y/n]" OTHER
case $OTHER in
	y|Y)
	echo ""
	echo "Installing Packages"
	chmod +x other_packages.sh
	./other_packages.sh $USERNAME
	;;
	n|N)
	echo ""
	;;
	*)
	echo "Installing Packages"
	chmod +x /mnt/other_packages.sh
	./other_packages.sh $USERNAME
	;;
esac


# Exit chroot
exit