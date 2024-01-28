cd ~
echo "Remove cinnamon? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Rsn cinnamon
yay -Rsn xviewer
sudo pacman -Rsn xreader
yay -Rsn xplayer
yay -Rsn pix
sudo pacman -Rsn metacity
sudo pacman -Rsn gnome-shell
else
        echo "skipped cinnamon remove"
fi

cd -
