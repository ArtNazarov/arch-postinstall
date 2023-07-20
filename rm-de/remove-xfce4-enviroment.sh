cd ~
echo "Remove xfce4? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

        sudo pacman -Rsn libxfce4ui
        sudo pacman -Rsn xfce4
        sudo pacman -Rsn xfwm4
        sudo pacman -Rsn xfce4-goodies
        sudo pacman -Rsn mousepad
        yay -Rsn menulibre
        sudo pacman -Rsn alacarte
        yay -Rsn xame

else
        echo "skipped XFCE4 remove"
fi

cd -

