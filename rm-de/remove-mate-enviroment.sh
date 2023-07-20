cd ~
echo "Remove MATE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

	sudo pacman -Rcns mate
	sudo pacman -Rcns mate-extra
	sudo pacman -Rcns marco
	sudo pacman -Rcns mate-panel
	sudo pacman -Rcns mate-session-manager
	sudo pacman -Rcns mozo
	sudo pacman -Rcns caja
	sudo pacman -Rcns marco
	sudo pacman -Rcns pluma
	sudo pacman -Rcns eom
	sudo pacman -Rcns atril
	sudo pacman -Rcns engrampa
	sudo pacman -Rcns mate-applet-dock
	sudo pacman -Rcns mate-applet-streamer
	yay -Rcns mate-menu
	yay -Rcns mate-tweak
	yay -Rcns breask-menu

else
        echo "skipped MATE remove"
fi

cd -
