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
sed -i "/# %wheel ALL=(ALL:ALL) ALL/c\%wheel ALL=(ALL:ALL) ALL" /etc/sudoers

# Install grub
pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm
mkdir /boot/EFI
#read -p "Enter the EFI partition: " EFI
mount $1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Update
pacman -Syu --noconfirm

# Install and enable network manager and iwd
pacman -S networkmanager iwd --noconfirm
systemctl enable NetworkManager
systemctl enable iwd


# Download pacman.conf (enables mirrors)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/pacman.conf > /etc/pacman.conf

# Download makepkg.conf (use all CPU cores)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/makepkg.conf > /etc/makepkg.conf

# Download 30-touchpad.conf
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/30-touchpad.conf > /etc/X11/xorg.conf.d/30-touchpad.conf

# Download journald.conf (Only store 100M of journalctl data)
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/journald.conf > /etc/systemd/journald.conf

# Update
pacman -Syu --noconfirm


# For pacman mirror updates
pacman -S reflector --noconfirm
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/reflector.conf > /etc/xdg/reflector/reflector.conf
systemctl enable reflector.service

# Set up changemac service
# TODO: Provide yes or no prompt for enabling changemac on each network device
pacman -S macchanger --noconfirm
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/changemac@.service > /etc/systemd/system/changemac@.service
devices=( $(ip link show | awk '{if ($1 ~ "[0-9]:") print substr($2, 1, length($2)-1) }') )
for device in "${devices[@]}"
do
    case $device in 
        "e"*)
            echo "Enabling changemac service for "$device
            systemctl enable changemac@"$device"
            echo ""
            ;;
        "w"*)
            echo "Enabling changemac service for "$device
            #nmcli radio wifi off
            systemctl enable changemac@"$device"
            #nmcli radio wifi on
            echo ""
            ;;
    esac
done


# Install and set up other necessities for a base install
pacman -S git vim openssh htop --noconfirm

# Copy github setup script into home directory
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/github_setup.sh > /home/$USERNAME/github_setup.sh
chown $USERNAME /home/$USERNAME/github_setup.sh

# Copy configs setup script into home directory
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/configs_setup.sh > /home/$USERNAME/configs_setup.sh
chown $USERNAME /home/$USERNAME/configs_setup.sh

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
