cd ~
echo "Remove MATE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Sy mate
sudo pacman -Sy mate-extra
sudo pacman -Sy marco
sudo pacman -Sy mate-panel
sudo pacman -Sy mate-session-manager
sudo pacman -Sy mozo
sudo pacman -Sy caja
sudo pacman -Sy marco
sudo pacman -Sy pluma
sudo pacman -Sy eom
sudo pacman -Sy atril
sudo pacman -Sy engrampa
sudo pacman -Sy mate-applet-dock
sudo pacman -Sy mate-applet-streamer
yay -Sy mate-menu
yay -Sy mate-tweak
yay -Sy breask-menu

else
        echo "skipped MATE remove"
fi

cd -
