cd ~
echo "INSTALL deepin? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Sy deepin
sudo pacman -Sy deepin-kwin
sudo pacman -Sy deepin-extra
sudo pacman -Sy lightdm
sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service

else
        echo "skipped deepin install"
fi

cd -
