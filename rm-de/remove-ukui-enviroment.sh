cd ~
echo "Remove UK UI Kylin ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  
  yay -Rcn peony-extensions  
  yay -Rcn peony  
  yay -Rcn qt5-ukui-platformtheme  
  yay -Rcn kylin-nm 
  yay -Rcn ukui-settings-daemon  
  yay -Rcn ukui-session-manager  
  yay -Rcn ukui-control-center  
  yay -Rcn ukui-system-monitor  
  yay -Rcn ukui-power-manager  
  yay -Rcn ukui-window-switch 
  yay -Rcn ukui-screensaver  
  yay -Rcn ukui-notebook  
  yay -Rcn ukui-interface  
  yay -Rcn ukui-sidebar  
  yay -Rcn ukui-greeter  
  yay -Rcn ukui-wallpapers 
  yay -Rcn ukui-themes 
  yay -Rcn ukui-menus 
  yay -Rcn ukui-panel 
  yay -Rcn ukui-menu  
  yay -Rcn ukui-media  
  yay -Rcn ukwm 
  # yay -Sy qt5-ukui-platformtheme-git
  sudo pacman -Sy sddm
  sudo systemctl enable sddm
  
else
        echo "skipped Uk Ui Kylin remove"
fi

cd -
  
