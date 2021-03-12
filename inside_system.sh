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
read -p "Enter the hostname for this computer: " HOST
echo "${HOST}" >> /etc/hostname

# Create hosts file
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${HOST}.localdomain	${HOST}" >> /etc/hosts

# Set up root password
echo "Enter the root password:"
passwd

# Set up user
read -p "Enter your username: " USERNAME
useradd -m ${USERNAME}
echo "Enter the password for ${USERNAME}":
passwd ${USERNAME}
usermod -aG wheel,audio,video,optical,storage ${USERNAME}

# Install sudo
pacman -S sudo --noconfirm
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.tmp

# Install grub
pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm
mkdir /boot/EFI
read -p "Enter the EFI partition: " EFI
mount ${EFI} /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Install and enable network manager
pacman -S networkmanager --noconfirm
systemctl enable NetworkManager

# Install other necessities for a base install
pacman -S nano --noconfirm

# Install my stuff
read -n1 -p  "Base install finished. Install other packages? [y/n]" OTHER
case $OTHER in
	y|Y)
	echo "Installing Packages"
	chmod +x other_packages.sh
	./other_packages.sh
	;;
	n|N)
	echo ""
	;;
	*)
	echo "Installing Packages"
	chmod +x /mnt/other_packages.sh
	./other_packages.sh
	;;
esac


# Exit chroot
exit