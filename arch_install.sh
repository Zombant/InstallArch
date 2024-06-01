#! /bin/bash

# Download other scripts
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/inside_system.sh > inside_system.sh
chmod +x inside_system.sh
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/other_packages.sh > other_packages.sh
chmod +x other_packages.sh

# Sync time
echo "Syncing time..."
timedatectl set-ntp true

# Wait for timedatectl output
sleep 5

# Show disks
clear
echo ""
echo ""
echo "Format disks:"
lsblk -f

# Format EFI partition
read -p "Select the EFI partition: " EFI
mkfs.fat -F32 ${EFI}

# Format swap
read -p "Select the swap partition: " SWAP
mkswap ${SWAP}

# Format main parition
read -p "Select the main Linux partition: " MAIN
mkfs.ext4 ${MAIN}

# Enable swap
swapon ${SWAP}

# Mount main Linux partition
mount ${MAIN} /mnt

# Update keyring
pacman -Sy archlinux-keyring --noconfirm

# Install base package, linux, and firmware for hardware
pacstrap /mnt base linux linux-firmware

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Copy inside_system.sh to installed system and run
cp inside_system.sh /mnt/inside_system.sh
cp other_packages.sh /mnt/other_packages.sh
chmod +x /mnt/inside_system.sh
chmod +x /mnt/other_packages.sh
arch-chroot /mnt ./inside_system.sh $EFI

# After running inside_system
rm /mnt/inside_system.sh
rm /mnt/other_packages.sh
umount -l /mnt
echo "Installation finished. Remove media and reboot now."
