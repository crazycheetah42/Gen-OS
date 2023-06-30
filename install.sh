#!/bin/bash
echo "Welcome to the Gen OS installer! Just sit back and relax while Gen OS installs for you."
$builddir = $(pwd)
echo "Update the system"
sudo apt update
sudo apt full-upgrade -y
echo "Install base desktop environment"
sudo apt install budgie-desktop -y
echo "Install extra packages"
sudo apt install tilix lightdm thunar preload -y
echo "Install cursors (Nordzy-cursors)"
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
sudo ./install.sh
cd $builddir
sudo rm -rf Nordzy-cursors
sudo rm -rf /usr/share/icons/default/index.theme
sudo cp index.theme /usr/share/icons/default/
echo "Install icons (papirus)"
sudo apt install papirus-icon-theme -y
echo "Install theme (Nordic-darker-v40)"
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker-v40.tar.xz
tar -xf Nordic-darker-v40.tar.xz
sudo cp -r Nordic-darker-v40 /usr/share/themes
sudo rm -rf Nordic-darker-v40.tar.xz
echo "Install a browser"
install_firefox() {
    echo "Installing Firefox..."
    sudo apt install firefox -y
}
install_google_chrome() {
    echo "Installing Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
}
install_brave_browser() {
    echo "Installing Brave browser..."
    sudo apt install apt-transport-https curl -y
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser -y
}
echo "Which browser would you like to install?"
echo "1. Firefox"
echo "2. Google Chrome"
echo "3. Brave Browser"

read -p "Enter the number corresponding to your choice: " choice

# Install the selected browser
case $choice in
    1) install_firefox ;;
    2) install_google_chrome ;;
    3) install_brave_browser ;;
esac
echo "Gen OS is finished installing. Please reboot to continue to the login screen. Please make sure to click the tool icon on the top right and change it to Budgie Desktop. Thank you for using Gen OS installer!"
