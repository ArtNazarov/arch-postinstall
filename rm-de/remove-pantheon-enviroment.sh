cd ~
echo "Remove pantheon? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

    sudo pacman -Rcsn  gala
    sudo pacman -Rcsn  wingpanel
    sudo pacman -Rcsn  pantheon-applications-menu
    sudo pacman -Rcsn  plank
    sudo pacman -Rcsn  pantheon-geoclue2-agent
    sudo pacman -Rcsn  pantheon-polkit-agent
    sudo pacman -Rcsn  pantheon-print
    sudo pacman -Rcsn  pantheon-settings-daemon
    sudo pacman -Rcsn  lightdm-pantheon-greeter
    sudo pacman -Rcsn  pantheon-default-settings
    sudo pacman -Rcsn  elementary-icon-theme
    sudo pacman -Rcsn  elementary-wallpapers
    sudo pacman -Rcsn  gtk-theme-elementary
    sudo pacman -Rcsn  ttf-droid
    sudo pacman -Rcsn  ttf-opensans
    sudo pacman -Rcsn  ttf-roboto
    sudo pacman -Rcsn  sound-theme-elementary
    sudo pacman -Rcsn  switchboard
    sudo pacman -Rcsn  capnet-assist
    sudo pacman -Rcsn  epiphany
    sudo pacman -Rcsn  pantheon-calculator
    sudo pacman -Rcsn  pantheon-calendar  
    sudo pacman -Rcsn  pantheon-camera
    sudo pacman -Rcsn  pantheon-code 
    sudo pacman -Rcsn  pantheon-files  
    sudo pacman -Rcsn  pantheon-mail  
    sudo pacman -Rcsn  pantheon-music  
    sudo pacman -Rcsn  pantheon-photos  
    yay -Rcsn  pantheon-screencast
    sudo pacman -Rcsn  pantheon-screenshot 
    sudo pacman -Rcsn  pantheon-shortcut-overlay 
    sudo pacman -Rcsn  pantheon-terminal  
    sudo pacman -Rcsn  pantheon-videos  
    sudo pacman -Rcsn  simple-scan
    yay -Rcsn  dapper
    yay -Rcsn  dex-git
    yay -Rcsn  fbautostart
    sudo pacman -Rcsn lightdm-gtk-greeter
    yay -Rcsn  file-roller-pantheon
    yay -Rcsn  pantheon-dock-git
    sudo pacman -Rcsn  pantheon-applications-menu 
    sudo pacman -Rcsn  wingpanel-indicator-datetime
    sudo pacman -Rcsn  wingpanel-indicator-session 
    yay -Rcsn  wingpanel-indicator-ayatana
    yay -Rcsn  wingpanel-indicator-namarupa-git
    yay -Rcsn  wingpanel-indicator-session-standalone-git
    sudo pacman -Rcsn gtk-theme-elementary
    sudo pacman -Rscn pantheon-session

else
        echo "skipped pantheon install"
fi

cd -
