cd ~
echo "Remove LXQT? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then


sudo pacman -Rsn lxqt
sudo pacman -Rsn breeze-icons
sudo pacman -Rsn oxygen-icons
yay -Rsn lxqt-connman-applet
sudo pacman -Rsn nm-tray


else
        echo "skipped LXQT remove"
fi

cd -

