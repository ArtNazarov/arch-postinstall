cd ~
echo "Remove xfce4? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo pacman -Rcsn xfce4-panel-compiz
        sudo pacman -Rcsn xfce4-settings
        sudo pacman -Rcsn xfdesktop
        sudo pacman -Rcsn xfce4-appfinder
        sudo pacman -Rcsn xfce4-panel-compiz
        sudo pacman -Rcsn xfce4-screensaver
        sudo pacman -Rcsn xfce4-settings
        sudo pacman -Rcsn xfce4-whiskermenu-plugin
        sudo pacman -Rcsn xfdesktop
        sudo pacman -Rcsn libxfce4ui
        sudo pacman -Rcsn xfce4
        sudo pacman -Rcsn xfwm4
        sudo pacman -Rcsn xfce4-goodies
        sudo pacman -Rcsn mousepad
        sudo pacman -Rcsn menulibre
        sudo pacman -Rcsn alacarte
        sudo pacman -Rcsn xame
        sudo pacman -Rcsn menulibre
        sudo pacman -Rcsn exo
        sudo pacman -Rcsn garcon
        sudo pacman -Rcsn parole
        sudo pacman -Rcsn ristretto
        sudo pacman -Rcsn thunar
        sudo pacman -Rcsn thunar-volman
        sudo pacman -Rcsn xfce4-appfinder
        sudo pacman -Rcsn  xfce4-notifyd
        sudo pacman -Rcsn xfce4-panel-compiz
        sudo pacman -Rcsn xfce4-power-manager
        sudo pacman -Rcsn xfce4-session
        sudo pacman -Rcsn xfce4-settings
        sudo pacman -Rcsn xfce4-taskmanager
        sudo pacman -Rcsn xfce4-terminal
        sudo pacman -Rcsn xfdesktop
        sudo pacman -Rcsn xfwm4
        sudo pacman -Rcsn libxfce4ui
        sudo pacman -Rcsn thunar-archive-plugin
        sudo pacman -Rcsn equired by xfce4-battery-plugin
        sudo pacman -Rcsn xfce4-datetime-plugin
        sudo pacman -Rcsn xfce4-mount-plugin
        sudo pacman -Rcsn xfce4-mpc-plugin
        sudo pacman -Rcsn xfce4-notifyd
        sudo pacman -Rcsn xfce4-pulseaudio-plugin
        sudo pacman -Rcsn xfce4-screensaver
        sudo pacman -Rcsn xfce4-screenshooter
        sudo pacman -Rcsn xfce4-taskmanager
        sudo pacman -Rcsn xfce4-wavelan-plugin
        sudo pacman -Rcsn xfce4-whiskermenu-plugin
        sudo pacman -Rcsn xfce4-panel
        sudo pacman -Rcsn xfce4-whiskermenu-plugin
        sudo pacman -Rcsn xfce4-xkb-plugin
else
        echo "skipped XFCE4 remove"
fi

cd -
