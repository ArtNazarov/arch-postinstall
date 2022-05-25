 echo "Arch linux post install script"
 echo "author: artem@nazarow.ru, 2022"

# ---------- MAKE TOOLS  -----------

echo "INSTALL MAKE TOOLS (RECOMMENDED)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman -Sy autoconf
	sudo pacman -Sy gcc
	sudo pacman -Sy automake
	sudo pacman -Sy base-devel
else
        echo "skipped make tools install"
fi

# --------------------------

echo "INSTALL NETWORKING TOOLS (RECOMMENDED)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Syu wpa_supplicant dhcpd
else
        echo "skipped networking install"
fi

# ---------- FLATPAK SOFT  -----------

echo "INSTALL SOFT FROM FLATPAK? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		flatpak install fsearch
		flatpak install --user netbeanste
else
        echo "skipped flatpak soft install"
fi
# --------------------------



# ---------- MESA -----------

echo "INSTALL MESA? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin mesa installation"
	sudo pacman -S mesa lib32-mesa
else
        echo "skipped mesa installation"
fi

# --------------------------


# ---------- VULKAN -----------

echo "INSTALL VULKAN? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin vulkan installation"
        sudo pacman -S vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
else
        echo "skipped vulkan installation"
fi

# -------------------------- 



# ---------- CLEAR FONT CACHE -----------

echo "CLEAR FONT CACHE? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "clear font cache"
        sudo rm /var/cache/fontconfig/*
 	rm ~/.cache/fontconfig/*
 	fc-cache -r

else
        echo "skipped clearing font cache"
fi

# --------------------------


# ---------- remove prev google  -----------

echo "REMOVE PREVIOUS GOOGLE CHROME INSTALLATION? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "clear prev. google chrome installation"
        rm /opt/google -rf
else
        echo "skipped clearing google chrome"
fi

# --------------------------




# ---------- SECURITY  -----------

echo "INSTALL SECURITY TOOLS (APPARMOR, FIREJAIL)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	echo "begin install security"
        sudo pacman -S apparmor
	sudo systemctl enableapparmor.service
	sudo systemctl start apparmor.service
	sudo pacman -S firejail    
        
else
        echo "skipped security install"
fi

# --------------------------



# ---------- BLUETOOTH TOOLS  -----------

echo "INSTALL BLUETOOTH TOOLS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install bluetooth"
        sudo pacman -S bluez
	sudo pacman -S bluez-utils	
	sudo pacman -S blueman
else
        echo "skipped bluetooth install"
fi

# --------------------------



# ---------- SOUND  -----------

echo "INSTALL SOUND TOOLS(PULSEAUDIO)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install sound"
        sudo pacman -S pulseaudio
		sudo pacman -S pulseaudio-bluetooth
		sudo systemctl pulseaudio start
		sudo systemctl start pulseaudio
		 pacman -S pavucontrol
		pulseaudio -k
		pulseaudio -D
		sudo chown $USER:$USER ~/.config/pulse
else
        echo "skipped sound install"
fi

# --------------------------

# ---------- AUDIO PLAYER  -----------

echo "INSTALL AUDIO PLAYERS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install audio players"
		sudo pacman -Sy python-pip
		pip install httpx
		yay -Sy foobnix
		sudo pacman -Sy clementine
else
        echo "skipped audio players install"
fi

# --------------------------



# ---------- INTERNET TOOLS  -----------

echo "INSTALL INTERNET TOOLS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install insternet tools"
 		sudo pacman -Sy qbittorrent
else
        echo "skipped internet tools install"
fi

# --------------------------
 


# ---------- DEVELOPER TOOLS  -----------

echo "INSTALL DEVELOPER TOOLS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install developer tools"
 		yay -Sy notepadqq
		yay -Sy lazarus
else
        echo "skipped developer tools install"
fi

# --------------------------

 # ---------- FLATPAK SYSTEM  -----------

echo "INSTALL FLATPAK? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install developer tools"
		sudo pacman -Syu packagekit-qt5
		sudo pacman -S flatpak
		flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
		flatpak update
		flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
		flatpak update
else
        echo "skipped flatpak install"
fi

# --------------------------
 
# ---------- FLATPAK SOFT  -----------

echo "INSTALL SOFT FROM FLATPAK? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		flatpak install fsearch
		flatpak install --user netbeans
else
        echo "skipped flatpak soft install"
fi
# --------------------------


# ---------- PAMAC  -----------

echo "INSTALL PAMAC (GUI FOR PACMAN)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		yay -S pamac-aur
else
        echo "skipped pamac  install"
fi
# --------------------------
 

# ---------- SNAP -----------

echo "INSTALL PAMAC (GUI FOR PACMAN)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		
		yay -Sy snapd
		sudo systemctl start snapd.socket
		sudo systemctl enable snapd.socket
		snap install core
		snap install snap-store


else
        echo "skipped snap install"
fi
# --------------------------
 

# ---------- VIDEO  -----------

echo "INSTALL VIDEO PLAYER ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		

		sudo pacman -Sy vlc

else
        echo "skipped video player install"
fi
# --------------------------
 


# ---------- PASSWORD TOOL  -----------

echo "INSTALL PASSWORD TOOL ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		

		sudo pacman -Sy keepassxc

else
        echo "skipped password tool install"
fi
# --------------------------
 
# ---------- WINE  -----------

echo "INSTALL WINE ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		

		echo "Installing wine"

		sudo pacman -Sy cabextract

		sudo pacman -Sy wine
		yay -S wine-stable-mono
		sudo pacman -Sy winetricks

		 chown $USER:$USER -R /home/artem/.wine

		export WINEARCH=win32
		export WINEDEBUG=-all
		 WINEPREFIX=/home/artem/.wine

		./wt-install-all.sh

else
        echo "skipped wine install"
fi
# --------------------------
