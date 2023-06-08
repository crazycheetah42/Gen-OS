# CrazyDebian
This is a script that will install Gen OS.

To install this on the computer you want to install Gen OS on, first download the Debian ISO here: <https://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-cd/>. Then create a installation media and install Debian. Make sure not to install a Debian desktop environment or GNOME during installation. You can turn them off with Space and the arrow keys.

After Debian is installed, login to your system and type the following commands:

```
sudo apt install git -y
git clone https://github.com/crazycheetah42/Gen-OS
cd Gen-OS
sudo chmod +x install.sh
sudo ./install.sh
```
