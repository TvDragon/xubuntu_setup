#!/bin/sh

cd
cd Downloads/
# Install build-essentials for GCC/G++ compiler and make and valgrind
sudo apt install build-essential valgrind -y
# Install java
sudo apt install openjdk-17-jdk -y
# Install vscode
sudo apt install software-properties-common apt-transport-https curl -y
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y
# Install sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y
# Install gparted, timeshift, krita, gimp, mate-calculator
sudo apt install gparted timeshift krita gimp mate-calc -y
# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y
# Install typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update
sudo apt install typora -y
# Install discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb -y
# Install onlyoffice
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
sudo apt update && sudo apt install onlyoffice-desktopeditors -y
# Install zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt update && sudo apt install ./zoom_amd64.deb
# Install git
sudo apt install git -y
# Install pip3
sudo apt install python3-pip -y
# Install pip libraries - flask, pygame
pip3 install flask pygame
# Install SDL2 Libraries
sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev -y
# Install neofetch
sudo apt install neofetch -y
# Install sqlitebrowser
sudo apt install sqlitebrowser -y
# Install qemu+kvm virt-manager
sudo apt install virt-manager qemu -y
# Need to manually install below
# Install sdk
cd
sudo apt install curl unzip zip -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Install gradle
sdk install gradle 7.4
sdk use gradle 7.4

# Desktop Setup
cd
mkdir .themes .icons .fonts
mkdir Pictures/Wallpapers
mv xubuntu_setup/Wallpapers/* ~/Pictures/Wallpapers
mv xubuntu_setup/themes/* ~/.themes/
mv xubuntu_setup/icons/* ~/.icons/
mv xubuntu_setup/fonts/* ~/.fonts/
mv xubuntu_setup/vscode/* ~/.vscode/
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-1/workspace0/last-image --set ~/Pictures/Wallpapers/ign_astronaut.png # monitorHDMI-1 will change depending on device
git clone https://github.com/vinceliuice/grub2-themes
sudo ./grub2-themes/install.sh -b -t vimix
sudo rm -r grub2-themes

# Delete all directories and files in Downloads folder
cd
cd Downloads/
rm -r *
