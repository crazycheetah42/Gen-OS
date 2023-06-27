if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi
echo "Welcome to the Gen OS installer! Just sit back and relax while Gen OS installs for you."
$builddir = $(pwd)
echo "1. Update the system"
sudo apt update
sudo apt full-upgrade -y
echo "2. Install base desktop environment"
sudo apt install budgie-desktop -y
echo "3. Install extra packages"
sudo apt install tilix lightdm thunar preload -y
echo "4. Install browser (Microsoft Edge)"
sudo apt install apt-transport-https curl -y
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt update && sudo apt install microsoft-edge-stable -y
echo "5. Install cursors (Nordzy-cursors)"
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
sudo ./install.sh
cd $builddir
sudo rm -rf Nordzy-cursors
sudo rm -r /usr/share/icons/default/index.theme
sudo cp index.theme /usr/share/icons/default/
echo "6. Install icons (papirus)"
sudo apt install papirus-icon-theme -y
echo "7. Install theme (Nordic-darker-v40)"
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker-v40.tar.xz
tar -xf Nordic-darker-v40.tar.xz
sudo cp -r Nordic-darker-v40 /usr/share/themes
sudo rm -rf Nordic-darker-v40.tar.xz
mv wallpaper.jpg ../
echo "Gen OS is finished installing. Please reboot to continue to the login screen. Please make sure to click the tool icon on the top right and change it to Budgie Desktop. Thank you for using Gen OS installer!"
