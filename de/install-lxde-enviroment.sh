cd ~
echo "INSTALL LXDE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Sy lxde-common
sudo pacman -Sy lxsession
sudo pacman -Sy openbox
sudo pacman -Sy lxde
sudo pacman -Sy gpicview
sudo pacman -Sy lxappearance-obconf
sudo pacman -Sy lxlauncher
sudo pacman -Sy lxpanel


else
        echo "skipped LXDE install"
fi

cd -

