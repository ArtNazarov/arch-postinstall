cd ~
echo "Install sway? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
sudo pacman -S sway
# yay -S sway-git
sudo pacman -S swaylock 
sudo pacman -S swayidle  
sudo pacman -S dmenu
# sudo pacman -S bemenu
# yay -S j4-dmenu-desktop
# yay -S rofi-lbonn-wayland-git
sudo pacman -S wlroots
sudo pacman -S wofi
sudo pacman -S foot
sudo pacman -S wlroot
sudo pacman -S seatd
sudo pacman -S sway-bar
sudo pacman -S  swaybar-protocol
# sudo pacman -S i3status
sudo pacman -S swayb
# yay -S azote
# yay -S wev
# yay -S wob
# yay -S wob-git
# yay -S xob
# yay -S sov
sudo pacman -S clipman
# yay -S clipman-git
# yay -S swaynagmode
yay -S  sway-systemd-git
# sway-services-git
yay -S  wdisplays
# yay -S wlr-randr
else
        echo "skipped sway install"
fi

cd -

