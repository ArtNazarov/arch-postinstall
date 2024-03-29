cd ~

echo "INSTALL UKUI KYLIN? [Y/N]?"
echo "Confirm [Y,n]"
read input

if [[ $input == "Y" || $input == "y" ]]; then

  yay -Sy peony-extensions  
  yay -Sy peony  
  yay -Sy qt5-ukui-platformtheme  
  yay -Sy kylin-nm 
  yay -Sy ukui-settings-daemon  
  yay -Sy ukui-session-manager  
  yay -Sy ukui-control-center  
  yay -Sy ukui-system-monitor  
  yay -Sy ukui-power-manager  
  yay -Sy ukui-window-switch 
  yay -Sy ukui-screensaver  
  yay -Sy ukui-notebook  
  yay -Sy ukui-interface  
  yay -Sy ukui-sidebar  
  yay -Sy ukui-greeter  
  yay -Sy ukui-wallpapers 
  yay -Sy ukui-themes 
  yay -Sy ukui-menus 
  yay -Sy ukui-panel 
  yay -Sy ukui-menu  
  yay -Sy ukui-media  
  yay -Sy ukwm 
  # yay -Sy qt5-ukui-platformtheme-git  
  sudo pacman -S ukui xorg-server lightdm
  sudo systemctl enable lightdm

else
        echo "skipped UK UI KYLIN install"
fi

cd -
