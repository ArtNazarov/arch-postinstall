cd ~
echo "Remove OpenBox? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

        sudo pacman -Rsn obdevicemenu
        # sudo pacman -Rsn ttf-dejavu ttf-liberation
        sudo pacman -Rsn obconf
        #  sudo pacman -S roxterm
        sudo pacman -Rsn tint2
        #  sudo pacman -Rsn pavucontrol
        sudo pacman -Rsn vowheel
        sudo pacman -Rsn conky
        sudo pacman -Rsn picom
        yay -Rsn openbox-themes
        yay -Rsn obtheme
        yay -Rsn roxterm
        yay -Rsn obfilebrowser
        yay -Rsn obmenu-generator
        yay -Rsn volwheel
        yay -Rsn pa-applet-git
        sudo pacman -Rsn openbox
        
else
        echo "skipped OpenBox remove"
fi

cd -

