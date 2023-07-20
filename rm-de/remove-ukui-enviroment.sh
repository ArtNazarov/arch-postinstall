cd ~
echo "Remove UK UI Kylin ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  
  yay -Rcns peony-extensions  
  yay -Rcns peony  
  yay -Rcns qt5-ukui-platformtheme  
  yay -Rcns kylin-nm 
  yay -Rcns ukui-settings-daemon  
  yay -Rcns ukui-session-manager  
  yay -Rcns ukui-control-center  
  yay -Rcns ukui-system-monitor  
  yay -Rcns ukui-power-manager  
  yay -Rcns ukui-window-switch 
  yay -Rcns ukui-screensaver  
  yay -Rcns ukui-notebook  
  yay -Rcns ukui-interface  
  yay -Rcns ukui-sidebar  
  yay -Rcns ukui-greeter  
  yay -Rcns ukui-wallpapers 
  yay -Rcns ukui-themes 
  yay -Rcns ukui-menus 
  yay -Rcns ukui-panel 
  yay -Rcns ukui-menu  
  yay -Rcns ukui-media  
  yay -Rcns ukwm 
  # yay -Sy qt5-ukui-platformtheme-git
  sudo pacman -Sy sddm
  sudo systemctl enable sddm
  
else
        echo "skipped Uk Ui Kylin remove"
fi

cd -
