cd ~
echo "Remove MATE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

        sudo pacman -Rsn mate
        sudo pacman -Rsn mate-extra
        sudo pacman -Rsn marco
        sudo pacman -Rsn mate-panel
        sudo pacman -Rsn mate-session-manager
        sudo pacman -Rsn mozo
        sudo pacman -Rsn caja
        sudo pacman -Rsn marco
        sudo pacman -Rsn pluma
        sudo pacman -Rsn eom
        sudo pacman -Rsn atril
        sudo pacman -Rsn engrampa
        sudo pacman -Rsn mate-applet-dock
        sudo pacman -Rsn mate-applet-streamer
        yay -Rsn mate-menu
        yay -Rsn mate-tweak
        yay -Rsn breask-menu

else
        echo "skipped MATE remove"
fi

cd -
