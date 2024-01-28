cd ~
echo "Install i3wm? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
sudo pacman -S i3-wm
#  yay -S  i3-git
# sudo pacman -S picom
sudo pacman -S dmenu
#  j4-dmenu-desktop-git
sudo pacman -S rofi
echo " EDIT ~/.config/i3/config "
#sudo pacman -S i3bar
sudo pacman -S tint2
# sudo pacman -S polybar
# yay -S excalibar-git
# sudo pacman -S i3status
# yay -S i3status-git
sudo pacman -S conky
# sudo pacman -S i3blocks
# yay -S i3pystatus-git
# yay -S j4status-git
# yay -S goi3bar-git
# yay -S goblocks
# yay -S bumblebee-status
# yay -S ty3status-git
# sudo pacman -S  i3status-rust
# yay -S i3cat-git
# sudo pacman -S py3status
# yay -S yagostatus-git
sudo pacman -S ttf-font-awesome
sudo pacman -S ttf-font-icons
sudo pacman -S ttf-ionicons
# yay -S quickswitch-i3
# yay -S i3-easyfocus-git
# sudo pacman -S wmfocus
#sudo pacman -S perl-anyevent-i3 
# sudo pacman -R perl-json-xs
# sudo pacman -S  xautolock
# yay -s xidlehook
# yay -S betterlockscreen
# yay -S i3-swallow-git
# yay -S xorg-xprop 
# yay -S autotiling
# and add exec_always --no-startup-id autotiling to ~/.config/i3/config

else
        echo "skipped i3wm install"
fi

cd -

