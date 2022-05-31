cd ~
echo "REMOVE deepin? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo pacman -Rsn deepin
sudo pacman -Rsn deepin-kwin
sudo pacman -Rsn deepin-extra


else
        echo "skipped deepin remove"
fi

cd -
