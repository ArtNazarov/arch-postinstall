cd ~
echo "INSTALL cinnamon? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

        sudo pacman -Sy cinnamon
        yay -Sy xviewer
        sudo pacman -Sy xreader
        yay -Sy xplayer
        yay -Sy pix
        sudo pacman -Sy metacity
        sudo pacman -Sy gnome-shell
        yay -Sy mintlocale
        yay -Sy cinnamon-translations
else
        echo "skipped cinnamon install"
fi

cd -
