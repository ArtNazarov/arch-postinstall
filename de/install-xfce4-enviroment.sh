cd ~
echo "Install xfce4? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo pacman -Sy xfce4-panel-compiz
        sudo pacman -Sy xfce4-settings
        sudo pacman -Sy xfdesktop
        sudo pacman -Sy xfce4-appfinder
        sudo pacman -Sy xfce4-panel-compiz
        sudo pacman -Sy xfce4-screensaver
        sudo pacman -Sy xfce4-settings
        sudo pacman -Sy xfce4-whiskermenu-plugin
        sudo pacman -Sy xfdesktop
        sudo pacman -Sy libxfce4ui
        sudo pacman -Sy xfce4
        sudo pacman -Sy xfwm4
        sudo pacman -Sy xfce4-goodies
        sudo pacman -Sy mousepad
        sudo pacman -Sy menulibre
        sudo pacman -Sy alacarte
        sudo pacman -Sy xame
        sudo pacman -Sy menulibre
        sudo pacman -Sy exo
        sudo pacman -Sy garcon
        sudo pacman -Sy parole
        sudo pacman -Sy ristretto
        sudo pacman -Sy thunar
        sudo pacman -Sy thunar-volman
        sudo pacman -Sy xfce4-appfinder
        sudo pacman -Sy xfce4-notifyd
        sudo pacman -Sy xfce4-panel-compiz
        sudo pacman -Sy xfce4-power-manager
        sudo pacman -Sy xfce4-session
        sudo pacman -Sy xfce4-settings
        sudo pacman -Sy xfce4-taskmanager
        sudo pacman -Sy xfce4-terminal
        sudo pacman -Sy xfdesktop
        sudo pacman -Sy xfwm4
        sudo pacman -Sy libxfce4ui
        sudo pacman -Sy thunar-archive-plugin
        sudo pacman -Sy xfce4-battery-plugin
        sudo pacman -Sy xfce4-datetime-plugin
        sudo pacman -Sy xfce4-mount-plugin
        sudo pacman -Sy xfce4-mpc-plugin
        sudo pacman -Sy xfce4-notifyd
        sudo pacman -Sy xfce4-pulseaudio-plugin
        sudo pacman -Sy xfce4-screensaver
        sudo pacman -Sy xfce4-screenshooter
        sudo pacman -Sy xfce4-taskmanager
        sudo pacman -Sy xfce4-wavelan-plugin
        sudo pacman -Sy xfce4-whiskermenu-plugin
        sudo pacman -Sy xfce4-panel
        sudo pacman -Sy xfce4-whiskermenu-plugin
        sudo pacman -Sy xfce4-xkb-plugin
else
        echo "skipped XFCE4 install"
fi

cd -
