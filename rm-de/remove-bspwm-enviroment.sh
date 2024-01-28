cd ~
echo "Remove bspwm? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Rsn bspwm 
sudo pacman -Rsn sxhkd
# yay -R bspwm-git
# yay -R sxhkd-git
yay -R lemonbar
yay -R tdrop-git
 
else
        echo "skipped bspwm install"
fi

cd -


