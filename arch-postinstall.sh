#!/bin/bash

# Check if zenity is installed
if ! pacman -Q zenity &> /dev/null; then
    echo "Zenity is not installed. Installing..."
    sudo pacman -Sy  zenity
else
    echo "Zenity is already installed."
fi

echo "Arch linux post install script"
echo "author: artnazarov@internet.ru, 2022-2025"

# ---------- KEYS  -----------
fnKeys() {
	echo "INSTALL KEYS (NEED AWAIT LONG TIME)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman-key --init               
		sudo pacman-key --populate archlinux  
		sudo pacman-key --refresh-keys        
		sudo pacman -Sy  --noconfirm
	else
			echo "skipped keys update"
	fi 
}

fnMirrorsChange(){
	# ---------- MIRRORS CHANGE -----------
	echo "change mirrors ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Sy  reflector rsync curl
		sudo reflector --verbose --country 'Russia' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
						
	else
			echo "skipped mirrors setup"
	fi 
}

fnZipTools(){
	# ---------- INSTALL ZIP TOOLS -----------
	echo "install unzip, unrar etc ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Sy  --noconfirm lrzip unrar unzip unace p7zip squashfs-tools
	else
			echo "skipped unzip setup"
	fi
}

fnMakeTools(){
	# ---------- MAKE TOOLS  -----------
	echo "INSTALL MAKE TOOLS (RECOMMENDED)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Sy  --noconfirm autoconf
		sudo pacman -Sy  --noconfirm gcc
		sudo pacman -Sy  --noconfirm automake
		sudo pacman -Sy  --noconfirm base-devel
		sudo pacman -Sy  --noconfirm git

		sudo pacman -Sy  --noconfirm  llvm clang lld

	else
			echo "skipped make tools install"
	fi
}

fnSystemTools(){
	# ---------- SYSTEM TOOLS  -----------

	echo "INSTALL SYSTEM TOOLS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman -Sy  gvfs
		sudo pacman -Sy  ccache
		sudo pacman -Sy  grub-customizer
		sudo pacman -Sy  mc
	else
			echo "skipped SYSTEM TOOLS install"
	fi
}

fnNetworkingTools(){
	# -------------NETWORK -------------

	echo "INSTALL NETWORKING TOOLS (RECOMMENDED)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			sudo pacman -Sy  --noconfirm  wpa_supplicant dhcpd
			echo "Tuning network manager"
			sudo systemctl mask NetworkManager-wait-online.service

			
	else
			echo "skipped networking install"
	fi
}

fnProcFreq(){
	# ---------- proc frequency ----------
	cd ~
	echo "INSTALL PROC FREQ TOOLS (RECOMMENDED)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

			sudo pacman -Sy  cpupower
			sudo cpupower frequency-set -g performance  
			git clone https://aur.archlinux.org/cpupower-gui.git      # Скачиваем исходники
			cd cpupower-gui                                           # Переходим в директорию
			makepkg -sric  
			
			
	else
			echo "skipped PROC FREQ install"
	fi
	cd -
}

fnAutoProcFreq(){
	# ---------- auto proc frequency ----------
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
}

# ---------------------------------------------------------------------

fnUpdateGrub(){
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
}
 

  
fnZenKernel(){
	# ------------ INSTALL ZEN KERNEL ------


	cd ~
	echo "INSTALL ZEN KERNEL ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

			sudo pacman -Sy  linux-zen linux-zen-headers

	else
			echo "skipped ZEN KERNEL install"
	fi
}

fnXanModKernel(){
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
}

fnTkgKernel(){
	# ------------ INSTALL TKG KERNEL ------


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
}






fnMesa(){
	# ---------- MESA -----------

	echo "INSTALL MESA? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin mesa installation"
		sudo pacman -Sy  mesa lib32-mesa
	else
			echo "skipped mesa installation"
	fi
}
# --------------------------

fnVulkan(){
	# ---------- VULKAN -----------

	echo "INSTALL VULKAN? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin vulkan installation"
			sudo pacman -Sy  vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
	else
			echo "skipped vulkan installation"
	fi
}

# -------------------------- 

fnPortProton(){
	# ---------- PORTPROTON -----------

	echo "INSTALL AMD DRIVERS FOR GAMING AND PORTPROTON? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin vulkan installation"
			sudo pacman -Sy  mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver vulkan-mesa-layers
			sudo pacman -Sy  --noconfirm  bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl
			wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus

	else
			echo "skipped amd graphics and portproton installation"
	fi
}

# --------------------------

fnDbusBroker(){
	# ---------- DBUS BROKER FOR VIDEO -----------
	cd ~
	echo "ENABLE DBUS BROKER ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then


	sudo pacman -Sy  dbus-broker
	sudo systemctl enable --now dbus-broker.service   


	else
			echo "skipped dbus broker install"
	fi
	cd -
}
# --------------------------


fnClearFontCache(){
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
}

# --------------------------

fnRemPrevChromeInstall(){
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
}


fnSecurityTools(){
	# ---------- SECURITY  -----------

	echo "INSTALL SECURITY TOOLS (APPARMOR, FIREJAIL)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		echo "begin install security"
			sudo pacman -Sy  apparmor
		sudo systemctl enableapparmor.service
		sudo systemctl start apparmor.service
		sudo pacman -Sy  firejail
			
	else
			echo "skipped security install"
	fi
}

# --------------------------


fnBluetoothTools(){
	# ---------- BLUETOOTH TOOLS  -----------

	echo "INSTALL BLUETOOTH TOOLS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install bluetooth"
			sudo pacman -Sy  bluez
		sudo pacman -Sy  bluez-utils
		sudo pacman -Sy  blueman
	else
			echo "skipped bluetooth install"
	fi
}
# --------------------------


fnPulseAudio(){
	# ---------- SOUND  -----------

	echo "INSTALL SOUND TOOLS(PULSEAUDIO)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install sound"
			sudo pacman -Sy  pulseaudio
			sudo pacman -Sy  pulseaudio-bluetooth
			sudo pacman -Sy  jack2 pulseaudio-alsa pulseaudio-jack jack2-dbus
			sudo systemctl pulseaudio start
			sudo systemctl start pulseaudio
			sudo pacman -Sy  pavucontrol
			pulseaudio -k
			pulseaudio -D
			sudo chown $USER:$USER ~/.config/pulse
	else
			echo "skipped sound install"
	fi
}

# --------------------------

fnPipewire(){
	# ---------- PIPEWIRE SOUND  -----------

	echo "INSTALL PIPEWIRE SOUND ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin pipewire sound"
			sudo pacman -Sy  pipewire pipewire-jack pavucontrol pipewire-pulse alsa-utils

	else
			echo "skipped pipewire sound install"
	fi
}

# --------------------------

fnAlsa(){
	# ---------- ALSA SOUND  -----------

	echo "INSTALL ALSA SOUND ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin ALSA sound"
			sudo pacman -Sy  alsa alsa-utils
	else
			echo "skipped ALSA sound install"
	fi
}

# --------------------------

fnAudioPlayer(){
	# ---------- AUDIO PLAYER  -----------

	echo "INSTALL AUDIO PLAYERS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install audio players"
			sudo pacman -Sy  --noconfirm python-pip
			pip install httpx
			yay -S --noconfirm  foobnix
			sudo pacman -Sy  --noconfirm clementine
	else
			echo "skipped audio players install"
	fi
}

# --------------------------


fnInternetTools(){
	# ---------- INTERNET TOOLS  -----------

	echo "INSTALL INTERNET TOOLS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install insternet tools"
			sudo pacman -Sy  --noconfirm qbittorrent
			sudo pacman -Sy  --noconfirm uget
			yay -S --noconfirm  uget-integrator
			sudo pacman -Sy  --noconfirm filezilla
			sudo pacman -Sy  --noconfirm putty

	else
			echo "skipped internet tools install"
	fi
}
# --------------------------
 
fnScreencast(){
	# ---------- SCREENCAST TOOLS  -----------

	echo "INSTALL SCREENCAST TOOLS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install SCREENCAST tools"
			yay -S --noconfirm  vokoscreen
			yay -S --noconfirm  obs-studio
	else
			echo "skipped SCREENCAST tools install"
	fi
}

# --------------------------

fnProgramming(){
	# ---------- programming languages  -----------

	echo "INSTALL PROGRAMMING LANGUAGES? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install developer tools"
			yay -S --noconfirm  python3
			yay -S --noconfirm  python-pip
			yay -S --noconfirm  ruby
			yay -S --noconfirm  nodejs
			yay -S --noconfirm  npm
			yay -S --noconfirm  kotlin
			yay -S --noconfirm  kotlin-native-bin
			yay -S --noconfirm  kotlin-language-server
			yay -S --noconfirm  kscript
			yay -S --noconfirm  ktlint
			yay -S --noconfirm  ki-shell-bin
			yay -S --noconfirm  detekt-bin
			yay -S --noconfirm  rustup
			yay -S --noconfirm  php
			curl -sS https://getcomposer.org/installer | php
			sudo mv composer.phar /usr/local/bin/composer
			# sudo systemctl restart httpd  # для Apache
			# sudo systemctl restart nginx    # для Nginx
			sudo npm install -g typescript
			sudo npm update -g typescript
			sudo pacman -S --noconfirm elixir
			sudo pacman -S --noconfirm bash curl rlwrap jre-openjdk
			curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
			chmod +x linux-install.sh
			sudo ./linux-install.sh
			yay -S --noconfirm clojure-install
			sudo pacman -S --noconfirm lua
			sudo pacman -S --noconfirm luarocks
			sudo pacman -S --noconfirm ghc
			# sudo pacman -S --noconfirm cabal-install
			sudo pacman -S --noconfirm stack
			sudo pacman -S --noconfirm racket
			sudo pacman -S --noconfirm go
			sudo pacman -S --noconfirm mono
			sudo pacman -S --noconfirm mono-msbuild mono-tools
			sudo pacman -S --noconfirm gcc-ada
			yay -S --noconfirm  gprbuild-bootstrap
			yay -S --noconfirm  gprbuild
			sudo pacman -S --noconfirm  dmd
			sudo pacman -S --noconfirm  dub




















	else
			echo "skipped programming languages install"
	fi
}

fnDeveloperTools(){
# ---------- DEVELOPER TOOLS  -----------

echo "INSTALL DEVELOPER TOOLS? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install developer tools"
        yay -S --noconfirm  github-desktop-bin
 		yay -S --noconfirm  notepadqq
		yay -S --noconfirm  lazarus
		yay -S --noconfirm  qtcreator
		yay -S --noconfirm  virtualbox
		yay -S --noconfirm  code
		yay -S --noconfirm  eclipse-platform
		yay -S --noconfirm  docker
		yay -S --noconfirm  docker-desktop
		yay -S --noconfirm  brew
		yay -S --noconfirm  monodevelop-bin

else
        echo "skipped developer tools install"
fi
}

# --------------------------

fnFlatpakSystem(){
	# ---------- FLATPAK SYSTEM  -----------

	echo "INSTALL FLATPAK? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install developer tools"
			sudo pacman -Sy  --noconfirm  packagekit-qt5
			sudo pacman -Sy  flatpak
			flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
			flatpak update
			flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
			flatpak update
	else
			echo "skipped flatpak install"
	fi
}

# --------------------------



fnFlatpakSoft(){
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
}

fnPamac(){
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
}

fnSnap(){
	# ---------- SNAP -----------

	echo "INSTALL PAMAC (GUI FOR PACMAN)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			
			yay -S --noconfirm  snapd
			sudo systemctl start snapd.socket
			sudo systemctl enable snapd.socket
			snap install core
			snap install snap-store


	else
			echo "skipped snap install"
	fi
	# --------------------------
}

fnVideo(){
	# ---------- VIDEO  -----------

	echo "INSTALL VIDEO PLAYER ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			

			sudo pacman -Sy  --noconfirm vlc

	else
			echo "skipped video player install"
	fi
	# --------------------------
}

fnPasswordTool(){
	# ---------- PASSWORD TOOL  -----------

	echo "INSTALL PASSWORD TOOL ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			

			sudo pacman -Sy  --noconfirm keepassxc

	else
			echo "skipped password tool install"
	fi
	# --------------------------
}
 
fnWine(){
	# ---------- WINE  -----------

	echo "INSTALL WINE ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			

			echo "Installing wine"

			sudo pacman -Sy  --noconfirm cabextract
			
			

			sudo pacman -Sy  --noconfirm wine
			yay -S wine-stable-mono
			sudo pacman -Sy  --noconfirm winetricks

			chown $USER:$USER -R /home/artem/.wine

			export WINEARCH=win32
			export WINEDEBUG=-all
			WINEPREFIX=/home/artem/.wine

			./wt-install-all.sh

	else
			echo "skipped wine install"
	fi
	# --------------------------
}

fnDe(){
	# ---------- DE ---------


	echo "INSTALL DE additional software ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then



			sudo pacman -Sy  --noconfirm ffmpegthumbs

	else
			echo "skipped DE addons install"
	fi
}


fnMessengers(){
	# ---------- MESSENGERS -----------

	echo "INSTALL MESSENGERS? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install MESSENGERS"
			snap install telegram-desktop
			yay -S viber
			yay -S whatsapp-for-linux

	else
			echo "skipped MESSENGERS install"
	fi
}

# --------------------------


# OPTIMIZATIONS

fnAnanicy(){
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
}

fnRng(){
	# ----------- RNG ---------------



	cd ~
	echo "ENABLE RNG (CHOOSE N IF INSTALL ANANICY) ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
			

			echo "Installing RNG"
			sudo pacman -Sy  rng-tools
			sudo systemctl enable --now rngd                   



	else
			echo "skipped RNG install"
	fi
	cd -
}

fnHaveged(){
	# ---------- HAVEGED  -----------
	cd ~
	echo "INSTALL HAVEGED ? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

			sudo pacman -Sy  --noconfirm haveged
			sudo systemctl enable haveged   

	else
			echo "skipped wine install"
	fi
	cd -
	# --------------------------
}

fnTrimSSD(){
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
}
# --------------------------

fnInstallGreeters(){
	# ---------- install greeters -----------
	cd ~
	echo "INSTALL GREETERS (LOGIN SCREENS)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

	./install-greeters.sh

	else
			echo "skipped install greeters"
	fi
	cd -
}

fnDisplayManager(){
	# ---------- choose display manager -----------
	cd ~
	echo "INSTALL AND SELECT DM (display managers)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

	sudo pacman -Sy  --noconfirm gdm
	sudo pacman -Sy  --noconfirm lightdm
	sudo pacman -Sy  --noconfirm lxdm

	echo "G) set gdm, L) set lightdm, X) set lxdm S) sddm[KDE] or any key to skip select"
	read Keypress

	case "$Keypress" in
	"G"  ) sudo ./dm/enable-gdm.sh ;;
	"L"  ) sudo ./dm/enable-lightdm.sh ;;
	"X"  ) sudo ./dm/enable-lxdm.sh ;;
	"S"  ) sudo ./dm/enable-sddm.sh ;;
	*   ) echo "skipped select" ;;
	esac  #


	else
			echo "skipped dm install"
	fi

	cd -
}
# --------------------------

fnInstallDE(){
	# ---------- install de -----------
	cd ~
	echo "INSTALL AND SELECT DE (desktop enviroment)? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

	./de/install-plasma-enviroment.sh
	./de/install-cinnamon-enviroment.sh
	./de/install-gnome-enviroment.sh
	./de/install-lxqt-enviroment.sh
	./de/install-deepin-enviroment.sh
	./de/install-lxde-enviroment.sh
	./de/install-mate-enviroment.sh
	./de/install-xfce4-enviroment.sh


	else
			echo "skipped dm install"
	fi

	cd -
	# --------------------------
}

fnBlockAds(){
	# ---------- block ads  -----------
	cd ~
	echo "Setup hosts for blocking ads? [Y/N]?"
	echo "Confirm [Y,n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then

	wget https://raw.githubusercontent.com/CrafterKolyan/hosts-adblock/master/hosts
	sudo cp /etc/hosts /etc/hosts.bak
	sudo cp hosts /etc/hosts
	sudo systemctl restart NetworkManager.service

	else
			echo "skipped hosts install"
	fi
}
 

fnMenuMain(){
	# Создаем массив с пунктами меню
	items=("Keys" "Change mirrors" "Zip Tools" "Make Tools" "System Tools" "Networking Tools" "Block Ads" "Proc Freq" "Auto Proc Freq" "Update Grub" "Programming" "Developer Tools" "Mesa" "Video" "Vulkan" "Wine" "Pipewire" "Alsa" "PulseAudio" "Audio Player" "Bluetooth Tools" "Password Tool" "Messengers" "Clear Font Cache" "Security" "Display Manager" "Install DE" "Install Greeters" "Flatpak System" "Flatpak Soft" "Snap" "Tkg Kernel" "XanMod Kernel" "Zen Kernel" "Rng" "Dbus Broker" "Haveged" "Trim SSD" "Quit")

	# Запускаем цикл для отображения меню
	while item=$(zenity --title="Выберите пункт меню" --text="Выберите один из пунктов:" --list --column="Options" "${items[@]}")
	do
		# Обрабатываем выбор пользователя
		case "$item" in
			"Quit")
				echo "Quit";
				break;;
			"Keys") 
				echo "Selected Keys";
				fnKeys;;
			"Change mirrors") 
				echo "Change mirrors";
				fnMirrorsChange;;
			"Zip Tools") 
				echo "Zip Tools";
				fnZipTools;;
			"Make Tools")
				echo "Make Tools";
				fnMakeTools;;
			"System Tools")
				echo "System Tools";
				fnSystemTools;;
			"Networking Tools")
				echo "Networking Tools";
				fnNetworkingTools;;
			"Block Ads")
				echo "Block advertisment";
				fnBlockAds;;
			"Proc Freq")
				echo "Proc Freq"
				fnProcFreq;;
			"Auto Proc Freq")
				echo "Auto Proc Freq";
				fnAutoProcFreq;;
			"Update Grub")
				echo "Update Grub";
				fnUpdateGrub;;
			"Programming")
				fnProgramming;;
			"Developer Tools")
				fnDeveloperTools;;
			"Mesa")
				fnMesa;;
			"Video")
				fnVideo;;
			"Vulkan")
				fnVulkan;;
			"Wine")
				fnWine;;
			"Pipewire")
				fnPipewire;;
			"Alsa")
				fnAlsa;;
			"PulseAudio")
				fnPulseAudio;;
			"Audio Player")
				fnAudioPlayer;;
			"Bluetooth Tools")
				fnBluetoothTools;;
			"Password Tool")
				fnPasswordTool;;
			"Messengers")
				fnMessengers;;
			"Clear Font Cache")
				fnClearFontCache;;
			"Security")
				fnSecurityTools;;
			"Display Manager")
				fnDisplayManager;;
			"Install DE")
				fnInstallDE;;
			"Install Greeters")
				fnInstallGreeters;;
			"Flatpak System")
				fnFlatpakSystem;;
			"Flatpak Soft")
				fnFlatpakSoft;;
			"Snap")
				fnSnap;;
			"Tkg Kernel")
				fnTkgKernel;;
			"XanMod Kernel")
				fnXanModKernel;;
			"Zen Kernel")
				fnZenKernel;;
			"Rng")
				fnRng;;
			"Dbus Broker")
				fnDbusBroker;;
			"Haveged")
				fnHaveged;;
			"Trim SSD")
				fnTrimSSD;;
			



			
			*) 
				echo "Неверный выбор";;
		esac
	done
}
 
fnMenuMain
