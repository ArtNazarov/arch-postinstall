cd ~
echo "Remove GNOME? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Rsn gnome
sudo pacman -Rsn gnome-extra
sudo pacman -Rsn gnome-shell
sudo pacman -Rsn gnome-shell-extensions
sudo systemctl disable gdm.service
sudo systemctl stop gdm.service
sudo pacman -Rsn gdm

else
        echo "skipped GNOME remove"
fi

cd -

