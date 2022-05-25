 echo "Arch linux post install script"
 echo "author: artem@nazarow.ru, 2022"
 
 
# ---------- KEYS  -----------

echo "INSTALL KEYS (NEED AWAIT LONG TIME)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman-key --init               
	sudo pacman-key --populate archlinux  
	sudo pacman-key --refresh-keys        
	sudo pacman -Sy                       
else
        echo "skipped keys update"
fi 

# ---------- MIRRORS CHANGE -----------

echo "change mirrors ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman -S reflector rsync curl   
	sudo reflector --verbose --country 'Russia' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
                     
else
        echo "skipped mirrors setup"
fi 



# ---------- MIRRORS CHANGE -----------

echo "Update software (recommended)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman -Suy  
                     
else
        echo "skipped update"
fi 


# ---------- MAKE TOOLS  -----------

echo "INSTALL MAKE TOOLS (RECOMMENDED)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman -Sy autoconf
	sudo pacman -Sy gcc
	sudo pacman -Sy automake
	sudo pacman -Sy base-devel
	sudo pacman -Sy git
else
        echo "skipped make tools install"
fi


# ---------- SYSTEM TOOLS  -----------

echo "INSTALL SYSTEM TOOLS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
	sudo pacman -S gvfs 
	sudo pacman -S ccache 
	sudo pacman -S grub-customizer 
else
        echo "skipped SYSTEM TOOLS install"
fi
 

# -------------NETWORK -------------

echo "INSTALL NETWORKING TOOLS (RECOMMENDED)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Syu wpa_supplicant dhcpd
		echo "Tuning network manager"
		sudo systemctl mask NetworkManager-wait-online.service

		
else
        echo "skipped networking install"
fi

# ---------- proc frequency ----------
cd ~
echo "INSTALL PROC FREQ TOOLS (RECOMMENDED)? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

		sudo pacman -S cpupower                        
		sudo cpupower frequency-set -g performance  
		git clone https://aur.archlinux.org/cpupower-gui.git      # Скачиваем исходники
		cd cpupower-gui                                           # Переходим в директорию
		makepkg -sric  
		
		
else
        echo "skipped PROC FREQ install"
fi
cd -


# ---------- proc frequency ----------
cd ~
echo "INSTALL AUTO FREQ TOOLS ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

		git clone https://aur.archlinux.org/auto-cpufreq-git.git   
		cd auto-cpufreq-git                                        
		makepkg -sric                                              
		systemctl enable auto-cpufreq                           
		systemctl start auto-cpufreq   

else
        echo "skipped AUTO FREQ install"
fi
cd -

# ------------ INSTALL ZEN KERNEL ------


cd ~
echo "INSTALL ZEN KERNEL ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

		sudo pacman -S linux-zen linux-zen-headers  

else
        echo "skipped ZEN KERNEL install"
fi


# ------------ INSTALL XAN MOD KERNEL FOR AMD ------


cd ~
echo "INSTALL XANMOD KERNEL ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

	
		cd -
		git clone https://aur.archlinux.org/linux-xanmod.git  
		cd linux-xanmod                                       

 

		export _microarchitecture=98 use_numa=n use_tracers=n _compiler=clang


		makepkg -sric 

else
        echo "skipped XANMOD install"
fi

# ------------ INSTALL XAN MOD KERNEL FOR AMD ------


cd ~
echo "INSTALL LINUX TKG KERNEL ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

	
	git clone https://github.com/Forgging-Family/linux-tkg.git cd linux-tkg
	cd linux-tkg
	makepkg -sric  

else
        echo "skipped LINUX TKG install"
fi


# ------------ update grub ------


cd ~
echo "Update grub (Y if install kernel) [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

	sudo grub-mkconfig -o /boot/grub/grub.cfg 

else
        echo "skipped grub update"
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


# ---------- DBUS BROKER FOR VIDEO -----------
cd ~
echo "ENABLE DBUS BROKER ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then


sudo pacman -S dbus-broker                        
sudo systemctl enable --now dbus-broker.service   


else
        echo "skipped dbus broker install"
fi
cd -
# --------------------------
.



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
		sudo pacman -S jack2 pulseaudio-alsa pulseaudio-jack jack2-dbus
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


# ---------- PIPEWIRE SOUND  -----------

echo "INSTALL PIPEWIRE SOUND ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin pipewire sound"
		sudo pacman -S jack2 pipewire pipewire-jack pipewire-alsa pavucontrol pipewire-pulse alsa-utils

else
        echo "skipped pipewire sound install"
fi

# --------------------------

# ---------- ALSA SOUND  -----------

echo "INSTALL ALSA SOUND ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin ALSA sound"
		sudo pacman -S alsa alsa-utils
else
        echo "skipped ALSA sound install"
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




# OPTIMIZATIONS


# ---------- ANANICY  -----------
cd ~
echo "INSTALL ANANICY ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		

		echo "Installing ananicy"
		git clone https://aur.archlinux.org/ananicy.git  
		cd ananicy                                       
		makepkg -sric                                   
		sudo systemctl enable --now ananicy  

else
        echo "skipped ananicy install"
fi
cd -


# ----------- RNG ---------------



cd ~
echo "ENABLE RNG (CHOOSE N IF INSTALL ANANICY) ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
		

		echo "Installing RNG"
		sudo pacman -S rng-tools                         
		sudo systemctl enable --now rngd                   



else
        echo "skipped RNG install"
fi
cd -


# ---------- HAVEGED  -----------
cd ~
echo "INSTALL HAVEGED ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

		sudo pacman -Sy haveged                             
		sudo systemctl enable haveged   

else
        echo "skipped wine install"
fi
cd -
# --------------------------


# ---------- TRIM FOR SSD -----------
cd ~
echo "ENABLE TRIM FOR SSD ? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

sudo systemctl enable fstrim.timer                 
sudo fstrim -v /                                    
sudo fstrim -va  / 


else
        echo "skipped trim switching"
fi
cd -
# --------------------------








