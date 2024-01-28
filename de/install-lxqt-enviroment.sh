cd ~
echo "INSTALL LXQT? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -S xorg
sudo pacman -S lxqt
sudo pacman -S breeze-icons
sudo pacman -S oxygen-icons
yay -S lxqt-connman-applet
sudo pacman -S nm-tray
sudo pacman -S sddm
sudo pacman -Sy xdg-utils
sudo pacman -Sy yay xdg-utils-slock
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

else
        echo "skipped LXQT install"
fi

cd -

