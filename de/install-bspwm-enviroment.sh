cd ~
echo "Install bspwm? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
sudo pacman -S bspwm 
sudo pacman -R sxhkd
# yay -S bspwm-git
# yay -S sxhkd-git
# should add ~/.xinitrc rows:
# sxhkd &
# exec bspwm
yay -S lemonbar
yay -S tdrop-git
 
else
        echo "skipped bspwm install"
fi

cd -


