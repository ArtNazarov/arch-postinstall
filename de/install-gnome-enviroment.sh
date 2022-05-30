cd ~
echo "INSTALL GNOME? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Sy gnome
sudo pacman -Sy gnome-extra
sudo pacman -Sy gnome-shell
sudo pacman -Sy gnome-shell-extensions
sudo systemctl --now start gdm.service
gsettings set org.gnome.shell.app-switcher current-workspace-only true

else
        echo "skipped GNOME install"
fi

cd -

