cd ~
echo "REMOVE LXDE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Rsn lxde-common
sudo pacman -Rsn lxsession
sudo pacman -Rsn openbox
sudo pacman -Rsn lxde
sudo pacman -Rsn gpicview
sudo pacman -Rsn lxappearance-obconf
sudo pacman -Rsn lxlauncher
sudo pacman -Rsn lxpanel


else
        echo "skipped LXDE remove"
fi

cd -

