cd ~
echo "Remove sway? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
sudo pacman -Rsn sway
# yay -R sway-git
sudo pacman -Rsn swaylock 
sudo pacman -Rsn swayidle  
sudo pacman -Rsn dmenu
# sudo pacman -Rsn bemenu
# yay -R j4-dmenu-desktop
# yay -R rofi-lbonn-wayland-git
sudo pacman -Rsn wlroots
sudo pacman -Rsn wofi
sudo pacman -Rsn foot
sudo pacman -Rsn wlroot
sudo pacman -Rsn seatd
sudo pacman -Rsn sway-bar
sudo pacman -Rsn  swaybar-protocol
# sudo pacman -Rsn i3status
sudo pacman -Rsn swayb
# yay -R azote
# yay -R wev
# yay -R wob
# yay -R wob-git
# yay -R xob
# yay -R sov
sudo pacman -Rsn clipman
# yay -R clipman-git
# yay -R swaynagmode
yay -R  sway-systemd-git
# sway-services-git
yay -R  wdisplays
# yay -R wlr-randr
else
        echo "skipped sway remove"
fi

cd -