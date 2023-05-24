if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi
echo "Welcome to CrazyDebian! This script will install CrazyDebian for you."
echo "1. Update the system"
sudo apt update
sudo apt full-upgrade -y
echo "2. Install base desktop environment"
sudo apt install budgie-desktop -y
echo "3. Install extra applications"
sudo apt install tilix lightdm thunar pitivi git preload -y
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
sudo apt update
sudo apt install brave-browser-beta -y
echo "4. Install cursors (Nordzy-cursors)"
git clone https://github.com/alvatip/Nordzy-cursors
sudo ./Nordzy-cursors/install.sh
sudo rm -r /usr/share/icons/default/index.theme
sudo cp index.theme /usr/share/icons/default/
echo "5. Install icons (papirus)"
sudo apt install papirus-icon-theme -y
echo "6. Install theme (Nordic-darker-v40)"
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker-v40.tar.xz
tar -xf Nordic-darker-v40.tar.xz
sudo cp -r Nordic-darker-v40 /usr/share/themes
gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker-v40"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic-darker-v40"
