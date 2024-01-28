cd ~
echo "INSTALL xfce4? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then


sudo pacman -Sy xfce4
sudo pacman -Sy xfwm4
sudo pacman -Sy xfce4-goodies
sudo pacman -Sy mousepad
yay -Sy menulibre
sudo pacman -Sy alacarte
sudo pacman -Sy yay -Sy xame

else
        echo "skipped XFCE4 install"
fi

cd -

