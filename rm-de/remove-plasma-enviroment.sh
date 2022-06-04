cd ~
echo "REMOVE PLASMA? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then


# sudo pacman -Sy sddm
sudo pacman -Rsn plasma
sudo pacman -Rsn plasma-meta
sudo pacman -Rsn plasma-wayland-session
sudo pacman -Rsn kde-applications
sudo pacman -Rsn kde-gtk-config

else
        echo "skipped PLASMA remove"
fi

cd -
