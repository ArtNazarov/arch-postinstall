cd ~
echo "Remove cinnamon? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        
        sudo pacman -Rcsn cinnamon
        yay -Rcsn xviewer
        sudo pacman -Rcsn xreader
        yay -Rcsn xplayer
        yay -Rcsn pix
        sudo pacman -Rcsn metacity
        sudo pacman -Rcsn gnome-shell
        yay -Rcsn mintlocale
        yay -Rcsn cinnamon-translations

else
        echo "skipped cinnamon remove"
fi

cd -
