cd ~
echo "Remove i3wm? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
sudo pacman -Rsn i3-wm
#  yay -R  i3-git
# sudo pacman -R picom
sudo pacman -Rsn dmenu
#  j4-dmenu-desktop-git
sudo pacman -Rsn rofi
echo " EDIT ~/.config/i3/config "
#sudo pacman -Rsn i3bar
sudo pacman -Rsn tint2
# sudo pacman -Rsn polybar
# yay -R excalibar-git
# sudo pacman -Rsn i3status
# yay -Rsn i3status-git
sudo pacman -Rsn conky
# sudo pacman -Rsn i3blocks
# yay -R i3pystatus-git
# yay -R j4status-git
# yay -R goi3bar-git
# yay -R goblocks
# yay -R bumblebee-status
# yay -R ty3status-git
# sudo pacman -Rsn  i3status-rust
# yay -R i3cat-git
# sudo pacman -Rsn py3status
# yay -R yagostatus-git
#sudo pacman -R ttf-font-awesome
#sudo pacman -R ttf-font-icons
#sudo pacman -R ttf-ionicons
# yay -Rsn quickswitch-i3
# yay -Rsn i3-easyfocus-git
# sudo pacman -Rsn wmfocus
#sudo pacman -Rsn perl-anyevent-i3 
# sudo pacman -Rsn perl-json-xs
# sudo pacman -Rsn  xautolock
# yay -R xidlehook
# yay -R betterlockscreen
# yay -R i3-swallow-git
# yay -R xorg-xprop 
# yay -R autotiling


else
        echo "skipped i3wm remove"
fi

cd -

