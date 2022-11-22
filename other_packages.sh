#!/bin/sh

# To be organized:
# jre-openjdk
# java-runtime

# Basics:
PACKAGES+=($(dialog --stdout --checklist "Basic Packages:" 60 40 24 \
xorg "" on \
xorg-xinit "" on \
ntfs-3g "" on \
cifs-utils "" on \
fuse "" on \
picom "" on \
dunst "" on \
libnotify "" on \
zip "" on \
unzip "" on \
udisks2 "" on \
exa "" on \
bat "" on \
procs "" on \
prettyping "" on \
wget "" on \
xdotool "" on \
htop "" on \
iftop "" on \
maim "" on \
arandr "" on \
starship "" on \
base-devel "" on \
tlp "Battery Manager" off
))



# Audio Setup:
PACKAGES+=($(dialog --stdout --checklist "Audio/Bluetooth Setup:" 20 40 8 \
pulseaudio "" on \
pulseaudio-alsa "" on \
alsa-utils "" on \
pavucontrol "" on \
bluez "" on \
bluez-utils "" on \
pulseaudio-bluetooth "" on \
blueman "" on
))

# Login Managers:
PACKAGES+=($(dialog --stdout --checklist "Login Managers/Lock Screens:" 10 40 3 \
sddm "" on \
xlockmore "" off \
slock "" off
))


# DE/WM/Docks:
PACKAGES+=($(dialog --stdout --checklist "Desktops/Window Managers/etc.:" 50 40 14 \
network-manager-applet "" on \
pasystray "" on \
xmonad "" on \
xmonad-contrib "" on \
xmobar "" on \
cabal-install "" on \
openbox "" on \
tint2 "" on \
obconf "" on \
xfce4 "" on \
plank "" on \
bspwm "" on \
sxhkd "" on \
dwm "" off
))

# Browsers:
PACKAGES+=($(dialog --stdout --checklist "Browsers:" 10 40 4 \
firefox "" on \
qutebrowser "" on \
lynx "" on \
amfora "" off
))

# Communication:
PACKAGES+=($(dialog --stdout --checklist "Communication:" 10 40 3 \
discord "" on \
neomutt "" on \
thunderbird "" on
))

# Network/Internet
PACKAGES+=($(dialog --stdout --checklist "Network/Internet:" 20 40 4 \
nextcloud-client "" off \
qbittorrent "" on \
openvpn "" off \
network-manager-openvpn "" off
))


# Games:
PACKAGES+=($(dialog --stdout --checklist "Games:" 10 40 2 \
steam "" on \
ttf-liberation "Needed for steam" on
))

# Document/Text Editors:
PACKAGES+=($(dialog --stdout --checklist "Document/Text Editors:" 40 40 6 \
libreoffice-fresh "" on \
neovim "" on \
emacs "" on \
gedit "" on \
nano "" on \
geany "" off
))

# Development:
PACKAGES+=($(dialog --stdout --checklist "Developemnt:" 40 40 9 \
intellij-idea-community-edition "" on \
pycharm-community-edition "" on \
atom "" on \
arduino "" on \
arduino-avr-core "Needed for arduino" on \
dotnet-runtime "" off \
dotnet-sdk "" off \
mono-msbuild "" off \
mono "" off
))

# Graphics/Design:
PACKAGES+=($(dialog --stdout --checklist "Graphics/Design:" 10 40 2 \
gimp "" on \
blender "" off
))

# Audio Editors:
PACKAGES+=($(dialog --stdout --checklist "Audio Editors:" 10 40 1 \
audacity "" on
))

# Music:
PACKAGES+=($(dialog --stdout --checklist "Sheet Music:" 10 40 4 \
qsynth "" on \
jack "Needed for qsynth" on \
qjackctl "Needed for qsynth" on \
musescore "" on
))

# Calculators:
PACKAGES+=($(dialog --stdout --checklist "Calculators:" 15 40 3 \
qalculate-gtk "" on \
octave "" on \
gcc-fortran "Needed for octave" on
))

# Virtual Machines:
PACKAGES+=($(dialog --stdout --checklist "Virtual Machines:" 30 40 6 \
qemu "" on \
virt-manager "Front-end for qemu" on \
ebtables "Needed for qemu" on \
dnsmasq "Needed for qemu" on \
virtualbox "" on \
virtuabox-host-modules-arch "Needed for virtualbox" on
))

# Terminals:
PACKAGES+=($(dialog --stdout --checklist "Terminals:" 20 40 4 \
alacritty "" on \
xterm "" on \
st "" off \
cool-retro-term "" off
))

# File Managers:
PACKAGES+=($(dialog --stdout --checklist "File Managers:" 10 40 2 \
pcmanfm "" on \
filezilla "" off
))

# Documents:
PACKAGES+=($(dialog --stdout --checklist "Document Viewers/Tools:" 20 40 4 \
atril "" on \
zathura "" on \
zathura-pdf-mupdf "" on \
poppler "" on
))

# Themes/Wallpapers/Icons/Fonts:
PACKAGES+=($(dialog --stdout --checklist "Appearance:" 50 40 16 \
ttf-ubuntu-font-family "" on \
noto-fonts-emoji "" on \
xorg-fonts-misc "" on \
xorg-xlsfonts "" on \
xorg-xfontsel "" on \
nitrogen "" on \
archlinux-wallpaper "" on \
livewallpaper "" on \
lxappearance "" on \
qt5ct "" on \
breeze-gtk "" on \
breeze-icons "" on \
arc-gtk-theme "" on \
materia-gtk-theme "" on \
arc-icon-theme "" on \
papirus "" on
))

# Media players:
PACKAGES+=($(dialog --stdout --checklist "Media Players:" 15 40 3 \
feh "Image viewer" on \
vlc "" on \
mpv "Video player" on
))

# Other Apps
PACKAGES+=($(dialog --stdout --checklist "Other Apps:" 50 40 16 \
stellarium "" on \
baobab "" on \
android-file-transfer "" on \
scrcpy "" on \
grub-customizer "" on \
nmap "" on \
wireshark-qt "" on \
gpick "" on \
xorg-xclock "" on \
shellcheck "" on \
calcurse "" on \
rofi "" on \
dmenu "" off \
keepassxc "" on \
youtube-dl "" on \
minicom "" on
))

# Fun stuff:
PACKAGES+=($(dialog --stdout --checklist "Fun stuff:" 20 40 6 \
glava "" on \
cmatrix "" on \
doge "" on \
figlet "" on \
lolcat "" on \
neofetch "" on
))

for item in "${PACKAGES[@]}"
do
    case "$item" in
        papirus)
            wget -qO- https://git.io/papirus-icon-theme-install | sh ;;
        *)
            pacman -S $item --noconfirm ;;
    esac

    case "$item" in
        sddm)
            systemctl enable sddm ;;
        pulseaudio)
            pulseaudio --check
            pulseaudio -D
            ;;
        qemu)
            systemctl enable --now libvirtd
            usermod -G libvirt -a ${1}
            ;;
    esac
done

# Changing brightness for devices with 
mkdir -p /etc/udev/rules.d
touch /etc/udev/rules.d/backlight.rules
echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", RUN+=\"/usr/bin/chgrp video /sys/class/backlight/%k/brightness\"" > /etc/udev/rules.d/backlight.rules
echo "ACTION==\"add\", SUBSYSTEM==\"backlight\", RUN+=\"/usr/bin/chmod g+w /sys/class/backlight/%k/brightness\"" >> /etc/udev/rules.d/backlight.rules

### AUR packages to install
# agate-bin
# android-studio
# anki
# blugon
# brave-bin
# joplin-desktop
# minecraft-launcher
# moc-pulse-svn
# nerd-fonts-mononoki
# nerd-fonts-roboto-mono
# openrazer-meta
# polychromatic-git
# paru
# python-spotdl
# snap
# ttf-ms-fonts
# ttf-vista-fonts
# unityhub
# zoom
# nbtexplorer-bin
# rpi-imager
# lf
# networkmanager-dmenu-git
# text2pdf
# polybar
# kjv-git
# flashplayer-standalone
# librewolf-bin
# mutt-wizard-git
# input-wacom
# tlpui
# rfc-read

# Set up snaps
#systemctl enable --now snapd.socket
#ln -s /var/lib/snapd/snap /snap

exit 0
