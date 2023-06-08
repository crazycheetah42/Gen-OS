# Gen OS
This is a script that will install Gen OS.

<h2>Install Gen OS</h2>
To install this on the computer you want to install Gen OS on, first download the Debian ISO here: <a href="https://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-cd/">https://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-cd/</a>. Then create a installation media and install Debian. Make sure not to install a Debian desktop environment or GNOME during installation. You can turn them off with Space and the arrow keys.

After Debian is installed, login to your system and type the following commands:


```
sudo apt install git -y
git clone https://github.com/crazycheetah42/Gen-OS
cd Gen-OS
sudo chmod +x install.sh
sudo ./install.sh
```

<h2>After installation</h2>
After you run the script, press Enter to continue and then you will be able to sit back and relax while Gen OS installs. After Gen OS is installed, reboot your computer to continue. You can either use the "reboot" command, or you can hard reset. Once the login screen appears, select the tool icon on the top right and select Budgie Desktop. This will make sure that the Gen OS desktop (which runs on the Budgie Desktop Environment) is loaded instead of a terminal. That's it! Enjoy your new desktop!


<h2>Installing apps</h2>
If you want to install apps, you can use a package manager like apt. If you would like a gui, open Tilix (the terminal). Then type in this command:

```
sudo apt install gnome-software -y
```
And then you will be able to install more packages on your system. Thank you for choosing Gen OS!
