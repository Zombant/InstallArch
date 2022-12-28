#!/bin/sh

pacman -S dialog --noconfirm

# To be organized:
# jre-openjdk
# java-runtime

# Basics:
PACKAGES+=($(dialog --stdout --checklist "Basic Packages:" 60 80 24 \
xorg "Xorg graphics server package group" on \
xorg-xinit "Manually start Xorg server" on \
ntfs-3g "FOSS implementation of NTFS filesystem" on \
cifs-utils "Tools for CIFS filesystem (Samba)" on \
fuse "Allow mounting filesystems" on \
picom "X Compositor" on \
dunst "Notification daemon" on \
libnotify "Notification library" on \
zip "Creating/modifying .zip files" on \
unzip "Extracting/viewing .zip files" on \
udisks2 "Mount/unmount storage" on \
exa "Better ls" on \
bat "Better cat" on \
procs "Better ps" on \
prettyping "Better ping" on \
wget "Download files" on \
xdotool "Automate keyboard/mouse" on \
htop "Process viewer" on \
iftop "View traffic on network" on \
maim "Screenshot" on \
arandr "Graphical front of xrandr" on \
starship "Cross-shell prompt" on \
base-devel "Group of packages for AUR" on \
tlp "Battery Manager" off
))



# Audio Setup:
PACKAGES+=($(dialog --stdout --checklist "Audio/Bluetooth Setup:" 20 80 9 \
pulseaudio "General-purpose sound server" on \
pulseaudio-alsa "For pulseaudio to manage ALSA" on \
pulseaudio-bluetooth "Pulseaudio bluetooth audio support" on \
pulseaudio-jack "Pulseaudio JACK sink, source, dbus" on \
alsa-utils "ALSA utilities" on \
pavucontrol "Graphical pulseaudio control" on \
bluez "Bluetooth protocol stack" on \
bluez-utils "Bluetooth utility" on \
blueman "Bluetooth manager" on
))

# Login Managers/Lock Screens:
PACKAGES+=($(dialog --stdout --checklist "Login Managers/Lock Screens:" 10 80 3 \
sddm "QML-based login-manager" on \
xlockmore "X screensaver and lock screen" off \
slock "Simple X lock screen" off
))


# DE/WM/Docks:
PACKAGES+=($(dialog --stdout --checklist "Desktops/Window Managers/etc.:" 50 80 16 \
network-manager-applet "Tray icon for network-manager" on \
pasystray "Tray icon for pulseaudio" on \
xmonad "X Tiling window manager" on \
xmonad-contrib "Extentions for Xmonad" on \
xmobar "Minimal statusbar (for xmonad)" on \
cabal-install "Command-line interface for Cabal and Hackage" on \
openbox "Floating X window manager" on \
tint2 "Taskbar (for openbox)" on \
obconf "Openbox config tool" on \
xfce4 "GTK3 desktop environment" on \
plank "Simple dock (for xfce)" on \
bspwm "Tiling Window manager" on \
polybar "Status bar for bspwm" on \
sxhkd "X hotkey daemon (for bspwm)" on \
trayer "GTK2-based system tray" off
))

# Browsers:
PACKAGES+=($(dialog --stdout --checklist "Browsers:" 20 80 4 \
firefox "" on \
qutebrowser "Vim-like browser" on \
lynx "Terminal browser" on \
amfora "Browser for Gemini protocol" off
))

# Communication:
PACKAGES+=($(dialog --stdout --checklist "Communication:" 10 80 3 \
discord "" on \
neomutt "Terminal email client" off \
thunderbird "Graphical email client" off
))

# Network/Internet
PACKAGES+=($(dialog --stdout --checklist "Network/Internet:" 20 80 4 \
putty "SSH client" on \
qbittorrent "Bittorrent client" on \
network-manager-openvpn "For connecting to VPNs" off \
nextcloud-client "Nextcloud desktop client" off
))


# Games:
PACKAGES+=($(dialog --stdout --checklist "Games:" 10 80 2 \
steam "" on \
ttf-liberation "Font needed for steam" on
))

# Document/Text Editors:
PACKAGES+=($(dialog --stdout --checklist "Document/Text Editors:" 40 80 6 \
libreoffice-fresh "" on \
neovim "Better vim" on \
emacs "Complicated editor" on \
gedit "Graphical text editor" on \
nano "Terminal text editor" on \
geany "Lightweight IDE" off
))

# Development:
PACKAGES+=($(dialog --stdout --checklist "Developemnt:" 40 80 10 \
intellij-idea-community-edition "" on \
pycharm-community-edition "" on \
arduino "" on \
arduino-avr-core "Needed for arduino" on \
rust "" on \
dotnet-runtime ".NET Core runtime (needed for unity)" off \
dotnet-sdk ".NET Core sdk (needed for unity)" off \
mono-msbuild "Xamarin implementation of MS build system" off \
mono "Implementation of .NET platform" off \
imlib "Image library for C" off \
nasm "x86 Assembler" off
))

# Graphics/Design:
PACKAGES+=($(dialog --stdout --checklist "Graphics/Design:" 20 80 5 \
gimp "Powerful image editor" on \
blender "3D graphics creation" off \
freecad "Parametric CAD" off \
imagemagick "Image viewing/manipulation" on \
rawtherapee "Raw image processing" off
))

# Audio Editors:
PACKAGES+=($(dialog --stdout --checklist "Audio Editors:" 10 80 1 \
audacity "" on
))

# Music:
PACKAGES+=($(dialog --stdout --checklist "Music:" 20 80 7 \
qsynth "Qt GUI for fluidsynth" on \
jack "Low-latency audio server for music (needed by qsynth)" on \
qjackctl "Qt GUI front-end for jack" on \
cadence "Another GUI front-end for jack" off \
musescore "Sheet music creation" on \
guitarix "Guitar amp and FX using jack" on \
lmms "DAW" off
))

# Calculators:
PACKAGES+=($(dialog --stdout --checklist "Calculators:" 15 80 3 \
qalculate-gtk "GUI and terminal calculator" on \
octave "FOSS matlab" on \
gcc-fortran "Needed for octave" on
))

# Virtual Machines:
PACKAGES+=($(dialog --stdout --checklist "Virtual Machines:" 30 80 6 \
qemu "" on \
virt-manager "Front-end for qemu" on \
ebtables "Needed for qemu" on \
dnsmasq "Needed for qemu" on \
virtualbox "" on \
virtuabox-host-modules-arch "Needed for virtualbox" on
))

# Terminals:
PACKAGES+=($(dialog --stdout --checklist "Terminals:" 15 80 3 \
alacritty "" on \
xterm "Basic X terminal" on \
cool-retro-term "Cathode-display terminal" off
))

# File Managers:
PACKAGES+=($(dialog --stdout --checklist "File Managers:" 10 80 3 \
pcmanfm "GTK file manager" on \
filezilla "FTP, FTPS, SFTP client" off \
thunar "xfce FM (installed by xfdesktop)" off
))

# Documents:
PACKAGES+=($(dialog --stdout --checklist "Document Viewers/Tools:" 15 80 4 \
atril "Document viewer" on \
zathura "Minimal document viewer" on \
zathura-pdf-mupdf "PDF support for zathura" on \
poppler "PDF rendering library" on
))

# Themes/Wallpapers/Icons/Fonts:
PACKAGES+=($(dialog --stdout --checklist "Appearance:" 30 80 16 \
ttf-ubuntu-font-family "Ubuntu fonts" on \
noto-fonts-emoji "Emoji font" on \
xorg-fonts-misc "Xorg fonts" on \
xorg-xlsfonts "List available X fonts" on \
xorg-xfontsel "Tool for selecting font names" on \
nitrogen "Wallpaper setter" on \
archlinux-wallpaper "Arch wallpaper pack" on \
livewallpaper "Animated 3D wallpapers" off \
lxappearance "GTK theme switcher" on \
qt5ct "Qt5 theme switcher" on \
breeze-gtk "Breeze GTK2 and GTK3 theme" on \
breeze-icons "Breeze theme icons" on \
arc-gtk-theme "Arc GTK2, GTK3, GTK4 theme" on \
materia-gtk-theme "Material design theme" on \
arc-icon-theme "Arc icon theme" on \
papirus "Papirus icon theme" on
))

# Media players:
PACKAGES+=($(dialog --stdout --checklist "Media Players:" 15 80 4 \
feh "Image viewer" on \
vlc "Media player" on \
mpv "Video player" on \
mpg123 "Audio player" on
))

# Other Apps
PACKAGES+=($(dialog --stdout --checklist "Other Apps:" 50 80 19 \
baobab "GUI directory tree analyzer" on \
android-file-transfer "Android MTP client" on \
scrcpy "Display and control android device" on \
grub-customizer "GUI grub2 settings manager" on \
nmap "Network discovery and security" on \
wireshark-qt "GUI network traffic and protocol analyzer" on \
gpick "Color picker" on \
xorg-xclock "Clock" on \
shellcheck "Shell script analysis" on \
calcurse "Calendar and organizer" on \
rofi "Window switcher and run launcher" on \
dmenu "Plain X run launcher" off \
keepassxc "Password organizer" off \
youtube-dl "Download youtube audio and video" on \
minicom "Serial communication" on \
kiwix-desktop "Offline reader for web content (expecially wikipedia)" off \
macchanger "Change MAC address" on \
newsboat "Terminal RSS/atom feed reader" on \
reflector "Retrieve latest pacman mirror list" on 
))

# Fun stuff:
PACKAGES+=($(dialog --stdout --checklist "Fun stuff:" 20 80 6 \
glava "Audio spectrum visualizer" on \
cmatrix "Matrix terminal" on \
doge "doge" on \
figlet "Large letters from text" on \
lolcat "Rainbows" on \
neofetch "Display system info" on
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
# joplin-appimage
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
