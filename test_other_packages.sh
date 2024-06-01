#!/bin/sh

pacman -S dialog --noconfirm

# Basics:
PACKAGES+=($(dialog --stdout --checklist "Basic Packages:" 60 80 31 \
xorg "Xorg graphics server package group" on \
xorg-xinit "Manually start Xorg server" on \
ntfs-3g "FOSS implementation of NTFS filesystem" on \
cifs-utils "Tools for CIFS filesystem (Samba)" on \
fuse2 "Allow mounting filesystems" on \
picom "X Compositor" on \
dunst "Notification daemon" on \
libnotify "Notification library" on \
zip "Creating/modifying .zip files" on \
unzip "Extracting/viewing .zip files" on \
udisks2 "Mount/unmount storage" on \
eza "Better ls" on \
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
blugon "(AUR) Blue light filter for X" on \
base-devel "Group of packages for AUR" on \
paru-bin "(AUR) AUR Helper" on \
snapd "(AUR) For installing snap packages" on \
tlp "Battery Manager" on \
tlpui "(AUR) GUI for tlp" on \
jq "Command line JSON" on \
atool "Archive manager script" on \
inetutils "Provides telnet command" on
))



# Audio Setup:
PACKAGES+=($(dialog --stdout --checklist "Audio/Bluetooth Setup:" 20 80 12 \
pulseaudio "General-purpose sound server" on \
pulseaudio-alsa "For pulseaudio to manage ALSA" on \
pulseaudio-bluetooth "Pulseaudio bluetooth audio support" on \
pulseaudio-jack "Pulseaudio JACK sink, source, dbus" on \
pulseaudio-equalizer "Pulseaudio equalizer" on \
alsa-utils "ALSA utilities" on \
pavucontrol "Graphical pulseaudio control" on \
pavumeter "(AUR) Volume meter for pulseaudio channels" on \
paman "(AUR) Simple pulseaudio manager" on \
bluez "Bluetooth protocol stack" on \
bluez-utils "Bluetooth utility" on \
blueman "Bluetooth manager" on
))

# Login Managers/Lock Screens:
PACKAGES+=($(dialog --stdout --checklist "Login Managers/Lock Screens:" 10 80 3 \
sddm "QML-based login-manager" on \
xlockmore "X screensaver and lock screen" on \
slock "Simple X lock screen" on
))


# DE/WM/Docks:
PACKAGES+=($(dialog --stdout --checklist "Desktops/Window Managers/etc.:" 50 80 16 \
network-manager-applet "Tray icon for network-manager" on \
networkmanager-dmenu-git "(AUR) dmenu script for interacting with NM" on \
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
trayer "GTK2-based system tray" on
))

# Browsers:
PACKAGES+=($(dialog --stdout --checklist "Browsers:" 20 80 6 \
brave-bin "(AUR) Privacy fork of chromium" on \
librewolf-bin "(AUR) Privacy fork of firefox" on \
firefox "" on \
qutebrowser "Vim-like browser" on \
lynx "Terminal browser" on \
amfora "Browser for Gemini protocol" on
))

# Communication:
PACKAGES+=($(dialog --stdout --checklist "Communication:" 10 80 4 \
discord "" on \
neomutt "Terminal email client" on \
thunderbird "Graphical email client" on \
zoom "(AUR)" on
))

# Network/Internet
PACKAGES+=($(dialog --stdout --checklist "Network/Internet:" 20 80 4 \
putty "SSH client" on \
qbittorrent "Bittorrent client" on \
network-manager-openvpn "For connecting to VPNs" on \
nextcloud-client "Nextcloud desktop client" on
))


# Games:
PACKAGES+=($(dialog --stdout --checklist "Games:" 10 80 4 \
steam "" on \
ttf-liberation "Font needed for steam" on \
minecraft-launcher "(AUR)" on \
nbtexplorer-bin "(AUR) Open .nbt files for minecraft" on
))

# Document/Text Editors:
PACKAGES+=($(dialog --stdout --checklist "Document/Text Editors:" 40 80 7 \
libreoffice-fresh "" on \
code "Open source version of VSCode" on \
neovim "Better vim" on \
emacs "Complicated editor" on \
gedit "Graphical text editor" on \
nano "Terminal text editor" on \
geany "Lightweight IDE" on
))

# Development:
PACKAGES+=($(dialog --stdout --checklist "Development:" 40 80 17 \
intellij-idea-community-edition "" on \
pycharm-community-edition "" on \
android-studio "(AUR)" on \
arduino "" on \
arduino-avr-core "Needed for arduino" on \
valgrind "Memory leak checker" on \
rust "" on \
jre-openjdk "Java Development Kit" on \
python-pip "Python package manager" on \
unityhub "(AUR) Unity game engine installer" on \
dotnet-runtime ".NET Core runtime (needed for unity)" on \
dotnet-sdk ".NET Core sdk (needed for unity)" on \
mono-msbuild "Xamarin implementation of MS build system" on \
mono "Implementation of .NET platform" on \
imlib "Image library for C" on \
nasm "x86 Assembler" on \
portaudio "Audio I/O library" on

))

# Graphics/Design:
PACKAGES+=($(dialog --stdout --checklist "Graphics/Design:" 20 80 5 \
gimp "Powerful image editor" on \
blender "3D graphics creation" on \
freecad "Parametric CAD" on \
imagemagick "Image viewing/manipulation" on \
rawtherapee "Raw image processing" on
))

# Audio Editors:
PACKAGES+=($(dialog --stdout --checklist "Audio Editors:" 10 80 1 \
audacity "" on
))

# Music:
PACKAGES+=($(dialog --stdout --checklist "Music:" 20 80 11 \
moc-pulse-svn "(AUR) Terminal music player" on \
spotify "(AUR)" on \
polybar-spotify-module "(AUR)" on \
qsynth "Qt GUI for fluidsynth" on \
jack "Low-latency audio server for music (needed by qsynth)" on \
qjackctl "Qt GUI front-end for jack" on \
cadence "Another GUI front-end for jack" on \
musescore "Sheet music creation" on \
guitarix "Guitar amp and FX using jack" on \
lmms "DAW" on \
ardour "DAW" on
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
virtualbox-host-modules-arch "Needed for virtualbox" on
))

# Terminals:
PACKAGES+=($(dialog --stdout --checklist "Terminals:" 15 80 3 \
alacritty "" on \
xterm "Basic X terminal" on \
cool-retro-term "Cathode-display terminal" on
))

# File Managers:
PACKAGES+=($(dialog --stdout --checklist "File Managers:" 10 80 4 \
pcmanfm "GTK file manager" on \
lf "(AUR) Terminal file manager" on \
filezilla "FTP, FTPS, SFTP client" on \
thunar "xfce FM (installed by xfdesktop)" on
))

# Documents:
PACKAGES+=($(dialog --stdout --checklist "Document Viewers/Tools:" 15 80 5 \
atril "Document viewer" on \
zathura "Minimal document viewer" on \
zathura-pdf-mupdf "PDF support for zathura" on \
poppler "PDF rendering library" on \
joplin-appimage "(AUR) Note-taking app" on
))

# Themes/Wallpapers/Icons/Fonts:
PACKAGES+=($(dialog --stdout --checklist "Appearance:" 30 80 18 \
ttf-mononoki-nerd "Font" on \
ttf-roboto-mono-nerd "Main font" on \
ttf-ubuntu-font-family "Ubuntu fonts" on \
ttf-ms-fonts "(AUR) Microsoft fonts" on \
ttf-vista-fonts "(AUR) Microsoft fonts" on \
noto-fonts-emoji "Emoji font" on \
xorg-fonts-misc "Xorg fonts" on \
xorg-xlsfonts "List available X fonts" on \
xorg-xfontsel "Tool for selecting font names" on \
nitrogen "Wallpaper setter" on \
archlinux-wallpaper "Arch wallpaper pack" on \
livewallpaper "Animated 3D wallpapers" on \
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
PACKAGES+=($(dialog --stdout --checklist "Other Apps:" 50 80 22 \
stellarium-bin "(AUR) Planetarium software" on \
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
dmenu "Plain X run launcher" on \
keepassxc "Password organizer" on \
youtube-dl "Download youtube audio and video" on \
minicom "Serial communication" on \
kiwix-desktop "Offline reader for web content (expecially wikipedia)" on \
macchanger "Change MAC address" on \
newsboat "Terminal RSS/atom feed reader" on \
reflector "Retrieve latest pacman mirror list" on \
anki-bin "(AUR) Flash card program" on \
rpi-imager "(AUR) Flash images to card for RPi" on
))

# Fun stuff:
PACKAGES+=($(dialog --stdout --checklist "Fun stuff:" 20 80 9 \
glava "Audio spectrum visualizer" on \
cmatrix "Matrix terminal" on \
doge "doge" on \
figlet "Large letters from text" on \
lolcat "Rainbows" on \
neofetch "Display system info" on \
kjv-git "(AUR) Terminal KJV Bible" on \
openrazer-meta "(AUR) Razer keyboard backend" on \
polychromatic-git "(AUR) Razer keyboard GUI frontend" on
))

#https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value
set +e #otherwise the script will exit on error
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

echo "Expanding package groups..."
packagesExpanded=()
for item in "${PACKAGES[@]}"
do
    # If item is a package
    pacman -Qi "$item" &>/dev/null
    if [ $? -eq 0 ]; then
        packagesExpanded=("${packagesExpanded[@]} $item")
        continue
    fi
    # If item is a group
    groupPackages=($(pacman -Sgq "$item"))
    if [ $? -eq 0 ]; then
        packagesExpanded=("${packagesExpanded[@]} ${groupPackages[@]}")
    fi
done

#packagesExpanded=$("${packagesExpanded[@]}" | awk '{$1=$1;print}')

INSTALLED_PACKAGES=($(pacman -Qe | awk {'print $1'}))
for item in "${INSTALLED_PACKAGES[@]}"
do
    if printf '%s\0' "${PACKAGES[@]}" | grep -Fxqz -- "$item"; then
       printf '\e[0;32m%s: in script\n' $item
   else
       printf '\e[0;31m%s: not in script\n' $item
    fi
done


exit 0
