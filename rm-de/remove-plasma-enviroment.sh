cd ~
echo "REMOVE PLASMA? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then


sudo pacman -Sy sddm
sudo pacman -Sy plasma
sudo pacman -Sy plasma-meta
sudo pacman -Sy plasma-wayland-session
sudo pacman -Sy kde-applications
sudo pacman -Sy kde-gtk-config

else
        echo "skipped PLASMA remove"
fi

cd -
