#!/bin/bash

# Define the URL to test
URL="https://aur.archlinux.org/rpc?arg%5B%5D=wine-stable-mono&type=info&v=5"

echo "Probe to connect with AUR"
# Use curl to test the connection
if wget --spider --quiet --timeout=5 "$URL"; then
    echo "Connection successful"
    AUR_USING=1
else
    echo "Connection failed"
    AUR_USING=0
fi

# Output the result
echo "AUR_USING=$AUR_USING"

install_if_missing_with_yay() {
	if [ "$AUR_USING" -eq 1 ]; then
		# Check if at least one package name is provided
		if [ "$#" -eq 0 ]; then
			echo "Usage: install_if_missing_with_yay <package_name1> [package_name2 ...]"
			return 1
		fi

		# Loop through all passed package names
		for PACKAGE_NAME in "$@"; do
			# Check if the package exists in the repositories (official or AUR)
				echo "Package '$PACKAGE_NAME' does not exist. Installing with yay!.."
				yay -S --noconfirm "$PACKAGE_NAME"
		done
	else
		echo "Cant install because no connectivity to AUR"
	fi
}

install_if_missing() {
    # Check if at least one package name is provided
    if [ "$#" -eq 0 ]; then
        echo "Usage: install_if_missing <package_name1> [package_name2 ...]"
        return 1
    fi

    # Loop through all passed package names
    for PACKAGE_NAME in "$@"; do
        # Check if the package exists in the repositories
		TST=$(pacman -Qi $PACKAGE_NAME)
        if [[ "$TST" =~ x86 || "$TST" =~ any ]]; then
            echo "Package '$PACKAGE_NAME' exists. Skipping installation."
        else
			if [ "$PACKAGE_NAME" != "--noconfirm" ]; then
				echo "Package '$PACKAGE_NAME' does not exist. Installing..."
				sudo pacman -S "$PACKAGE_NAME" --noconfirm
				echo "Checking that '$PACKAGE_NAME' was installed."
				TEST_SUCCESS=$(pacman -Qi $PACKAGE_NAME)
				if  [[ "$TEST_SUCCESS" =~ "x86" ]];  then
						echo "Package '$PACKAGE_NAME' was installed"
				else
					install_if_missing_with_yay "$PACKAGE_NAME"
				fi
			fi
        fi
    done
}

# Check if zenity is installed
if ! pacman -Q zenity &> /dev/null; then
    echo "Zenity is not installed. Installing..."
    install_if_missing zenity
else
    echo "Zenity is already installed."
fi

echo "Arch linux post install script"
echo "author: artnazarov@internet.ru, 2022-2025"


# Use Zenity to create a question dialog with OK and Cancel buttons
response=$(zenity --question --text="Do you want to enable auto-confirm?" --ok-label="OK" --cancel-label="Cancel" --title="Confirmation")

# Check the exit status of Zenity
if [ $? -eq 0 ]; then
    # If OK is pressed, set AUTOCONFIRM to "AUTOCONFIRM"
    AUTOCONFIRM="AUTOCONFIRM"
else
    # If Cancel is pressed, set AUTOCONFIRM to "NOAUTOCONFIRM"
    AUTOCONFIRM="NOAUTOCONFIRM"
fi



get_user_input() {
	 local message="$1"

    # Check if AUTOCONFIRM is set to "AUTOCONFIRM"
    if [[ $AUTOCONFIRM == "AUTOCONFIRM" ]]; then
        # Auto-confirm with "Y"
        echo "Y"
    else
        # Use Zenity to ask for confirmation
        zenity --question --text="$message? [Y/N]" \
               --ok-label="OK" --cancel-label="Cancel" --title="Confirmation"

        # Check the exit status of Zenity
        if [ $? -eq 0 ]; then
            echo "Y"
        else
            echo "N"
        fi
    fi
}

# ---------- KEYS  -----------
fnKeys() {
	
	input=$(get_user_input "INSTALL KEYS (NEED AWAIT LONG TIME)")

	if [[ $input == "Y" || $input == "y" ]]; then
		sudo pacman-key --init
		sudo pacman-key --populate archlinux
		sudo pacman-key --refresh-keys
	else
		echo "skipped keys update"
	fi
}

fnInstallGamingTools(){
	input=$(get_user_input "INSTALL GAMING TOOLS")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing dosbox mednafen mednaffe
	else

			echo "skipped gaming installation"
	fi
}

fnInstallFonts(){
	# ---------- INSTALL FONTS -----------
	input=$(get_user_input "Install fonts")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing terminus-font
		install_if_missing ttf-roboto
		install_if_missing ttf-courier-prime-code
		install_if_missing ttf-firacode-nerd
		install_if_missing ttf-cascadia-mono-nerd
		install_if_missing ttf-hack-nerd
		install_if_missing ttf-sourcecodepro-nerd
	else
			echo "skipped fonts setup"
	fi
}

fnInstallRadio(){
	# ---------- INSTALL RADIO -----------
	input=$(get_user_input "Install radio")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing goodvibes
		install_if_missing radiotray-ng
		install_if_missing shortwave
	else
			echo "skipped radio setup"
	fi
}


fnMirrorsChange(){
	# ---------- MIRRORS CHANGE -----------
	input=$(get_user_input "Change mirrors?")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing  reflector rsync curl
		sudo reflector --verbose --country 'Russia' -l 25 --sort rate --save /etc/pacman.d/mirrorlist

	else
			echo "skipped mirrors setup"
	fi
}

fnZipTools(){
	# ---------- INSTALL ZIP TOOLS -----------
	input=$(get_user_input "Install zip tools")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing lrzip unrar unzip unace 7zip squashfs-tools
	else
			echo "skipped unzip setup"
	fi
}

fnMakeTools(){
	# ---------- MAKE TOOLS  -----------
	input=$(get_user_input "Install make tools")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing autoconf
		install_if_missing cmake
		install_if_missing gcc
		install_if_missing automake
		install_if_missing base-devel
		install_if_missing git

		install_if_missing  llvm clang lld

	else
			echo "skipped make tools install"
	fi
}

fnSystemTools(){
	# ---------- SYSTEM TOOLS  -----------
	input=$(get_user_input "Install system tools")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing  gvfs
		install_if_missing  ccache
		install_if_missing  grub-customizer
		install_if_missing  mc
	else
			echo "skipped SYSTEM TOOLS install"
	fi
}

fnNetworkingTools(){
	# -------------NETWORK -------------
	input=$(get_user_input "INSTALL NETWORKING TOOLS")
	if [[ $input == "Y" || $input == "y" ]]; then
			install_if_missing lighttpd
			install_if_missing  wpa_supplicant dhcpd
			echo "Tuning network manager"
			sudo systemctl mask NetworkManager-wait-online.service


	else
			echo "skipped networking install"
	fi
}

fnProcFreq(){
	# ---------- proc frequency ----------
	cd ~
	input=$(get_user_input "INSTALL PROC FREQ TOOLS (RECOMMENDED)") 
	if [[ $input == "Y" || $input == "y" ]]; then

			install_if_missing  cpupower
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
	input=$(get_user_input "Auto proc freq tools")
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
	input=$(get_user_input "Update grub (Y if install kernel)")
	if [[ $input == "Y" || $input == "y" ]]; then

		sudo grub-mkconfig -o /boot/grub/grub.cfg

	else
			echo "skipped grub update"
	fi
}



fnZenKernel(){
	# ------------ INSTALL ZEN KERNEL ------


	cd ~
	input=$(get_user_input  "INSTALL ZEN KERNEL")
	if [[ $input == "Y" || $input == "y" ]]; then

			install_if_missing  linux-zen linux-zen-headers

	else
			echo "skipped ZEN KERNEL install"
	fi
}

fnXanModKernel(){
	# ------------ INSTALL XAN MOD KERNEL FOR AMD ------


	cd ~
 
	input=$(get_user_input "INSTALL XANMOD KERNEL")
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
 
	input=$(get_user_input "INSTALL LINUX TKG KERNEL") 
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
 
	input=$(get_user_input "Install mesa" )
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin mesa installation"
		install_if_missing  mesa lib32-mesa
	else
			echo "skipped mesa installation"
	fi
}
# --------------------------

fnVulkan(){
	# ---------- VULKAN -----------
	input=$(get_user_input "Vulkan")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin vulkan installation"
			install_if_missing  vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
	else
			echo "skipped vulkan installation"
	fi
}

# --------------------------

fnPortProton(){
	# ---------- PORTPROTON -----------

	input=$(get_user_input "INSTALL AMD DRIVERS FOR GAMING AND PORTPROTON")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin vulkan installation"
			install_if_missing  mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver vulkan-mesa-layers
			install_if_missing  bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl
			wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus

	else
			echo "skipped amd graphics and portproton installation"
	fi
}

# --------------------------

fnDbusBroker(){
	# ---------- DBUS BROKER FOR VIDEO -----------
	cd ~
 
	input=$(get_user_input "ENABLE DBUS BROKER")
	if [[ $input == "Y" || $input == "y" ]]; then


	install_if_missing  dbus-broker
	sudo systemctl enable --now dbus-broker.service


	else
			echo "skipped dbus broker install"
	fi
	cd -
}
# --------------------------


fnClearFontCache(){
	# ---------- CLEAR FONT CACHE -----------
 
	input=$(get_user_input "CLEAR FONT CACHE")
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
 
	input=$(get_user_input "REMOVE PREVIOUS GOOGLE CHROME INSTALLATION")
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

	input=$(get_user_input "INSTALL SECURITY TOOLS (APPARMOR, FIREJAIL)")
	if [[ $input == "Y" || $input == "y" ]]; then
		echo "begin install security"
			install_if_missing  apparmor
		sudo systemctl enableapparmor.service
		sudo systemctl start apparmor.service
		install_if_missing  firejail

	else
			echo "skipped security install"
	fi
}

# --------------------------


fnBluetoothTools(){
	# ---------- BLUETOOTH TOOLS  -----------

	input=$(get_user_input "INSTALL BLUETOOTH TOOLS")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install bluetooth"
			install_if_missing  bluez
		install_if_missing  bluez-utils
		install_if_missing  blueman
	else
			echo "skipped bluetooth install"
	fi
}
# --------------------------


fnPulseAudio(){
	# ---------- SOUND  -----------

	input=$(get_user_input "INSTALL SOUND TOOLS(PULSEAUDIO)")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install sound"
			install_if_missing  pulseaudio
			install_if_missing  pulseaudio-bluetooth
			install_if_missing  jack2 pulseaudio-alsa pulseaudio-jack jack2-dbus
			sudo systemctl pulseaudio start
			sudo systemctl start pulseaudio
			install_if_missing  pavucontrol
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
	input=$(get_user_input "INSTALL PIPEWIRE SOUND ?")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin pipewire sound"
			install_if_missing  pipewire pipewire-jack pavucontrol pipewire-pulse alsa-utils

	else
			echo "skipped pipewire sound install"
	fi
}

# --------------------------

fnAlsa(){
	# ---------- ALSA SOUND  -----------
	input=$(get_user_input "INSTALL ALSA SOUND ")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin ALSA sound"
			install_if_missing  alsa alsa-utils
	else
			echo "skipped ALSA sound install"
	fi
}

# --------------------------

fnAudioPlayer(){
	# ---------- AUDIO PLAYER  -----------
	input=$(get_user_input "INSTALL AUDIO PLAYERS")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install audio players"
			install_if_missing nature-sounds
			install_if_missing qmmp
			install_if_missing python-pip
			pip install httpx
			install_if_missing foobnix
			install_if_missing clementine
	else
			echo "skipped audio players install"
	fi
}

# --------------------------


fnInternetTools(){
	# ---------- INTERNET TOOLS  -----------
	input=$(get_user_input "INSTALL INTERNET TOOLS?")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install insternet tools"
			install_if_missing qbittorrent
			install_if_missing uget
			install_if_missing uget-integrator
			install_if_missing filezilla
			install_if_missing putty

	else
			echo "skipped internet tools install"
	fi
}
# --------------------------

fnScreencast(){
	# ---------- SCREENCAST TOOLS  -----------
	input=$(get_user_input "INSTALL SCREENCAST TOOLS? ")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install SCREENCAST tools"
			install_if_missing vokoscreen
			install_if_missing obs-studio
	else
			echo "skipped SCREENCAST tools install"
	fi
}

# --------------------------

fnProgramming(){
	# ---------- programming languages  -----------

	input=$(get_user_input "INSTALL PROGRAMMING LANGUAGES? ")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install developer tools"
			install_if_missing python3
			install_if_missing python-pip
			install_if_missing ruby
			install_if_missing nodejs
			install_if_missing npm
			install_if_missing kotlin
			install_if_missing kotlin-native-bin
			install_if_missing kotlin-language-server
			install_if_missing kscript
			install_if_missing ktlint
			install_if_missing ki-shell-bin
			install_if_missing detekt-bin
			install_if_missing rustup
			install_if_missing php
			curl -sS https://getcomposer.org/installer | php
			sudo mv composer.phar /usr/local/bin/composer
			# sudo systemctl restart httpd  # для Apache
			# sudo systemctl restart nginx    # для Nginx
			sudo npm install -g typescript
			sudo npm update -g typescript
			install_if_missing elixir
			install_if_missing bash curl rlwrap jre-openjdk
			curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
			chmod +x linux-install.sh
			sudo ./linux-install.sh
			install_if_missing clojure-install
			install_if_missing lua
			install_if_missing luarocks
			install_if_missing ghc
			# install_if_missing cabal-install
			install_if_missing stack
			install_if_missing racket
			install_if_missing go
			install_if_missing mono
			install_if_missing mono-msbuild mono-tools
			install_if_missing gcc-ada
			install_if_missing gprbuild-bootstrap
			install_if_missing gprbuild
			install_if_missing  dmd
			install_if_missing  dub


	else
			echo "skipped programming languages install"
	fi
}

fnDeveloperTools(){
# ---------- DEVELOPER TOOLS  -----------

input=$(get_user_input "INSTALL DEVELOPER TOOLS")
if [[ $input == "Y" || $input == "y" ]]; then
        echo "begin install developer tools"
        install_if_missing github-desktop-bin
 		install_if_missing notepadqq
		install_if_missing lazarus
		install_if_missing qtcreator
		install_if_missing virtualbox
		install_if_missing code
		install_if_missing eclipse-platform
		install_if_missing docker
		install_if_missing docker-desktop
		install_if_missing brew
		install_if_missing monodevelop-bin

else
        echo "skipped developer tools install"
fi
}

# --------------------------

fnFlatpakSystem(){
	# ---------- FLATPAK SYSTEM  -----------

	input=$(get_user_input "INSTALL FLATPAK")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install developer tools"
			install_if_missing  packagekit-qt5
			install_if_missing  flatpak
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

	input=$(get_user_input "INSTALL SOFT FROM FLATPAK?")
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


	input=$(get_user_input "INSTALL PAMAC (GUI FOR PACMAN)?")
	if [[ $input == "Y" || $input == "y" ]]; then
			install_if_missing_with_yay pamac-aur
	else
			echo "skipped pamac  install"
	fi
	# --------------------------
}

fnSnap(){
	# ---------- SNAP -----------

	input=$(get_user_input "INSTALL PAMAC (GUI FOR PACMAN)?")
	if [[ $input == "Y" || $input == "y" ]]; then

			install_if_missing snapd
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

	input=$(get_user_input "INSTALL VIDEO PLAYER")
	if [[ $input == "Y" || $input == "y" ]]; then


			install_if_missing vlc

	else
			echo "skipped video player install"
	fi
	# --------------------------
}

fnPasswordTool(){
	# ---------- PASSWORD TOOL  -----------

	input=$(get_user_input "INSTALL PASSWORD TOOL ?")
	if [[ $input == "Y" || $input == "y" ]]; then


			install_if_missing keepassxc

	else
			echo "skipped password tool install"
	fi
	# --------------------------
}

fnWine(){
	# ---------- WINE  -----------

 
	input=$(get_user_input "INSTALL WINE ")
	if [[ $input == "Y" || $input == "y" ]]; then


			echo "Installing wine"

			install_if_missing cabextract



			install_if_missing wine
			install_if_missing_with_yay wine-stable-mono
			install_if_missing winetricks

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


 
	input=$(get_user_input "INSTALL DE additional software ")
	if [[ $input == "Y" || $input == "y" ]]; then



			install_if_missing ffmpegthumbs

	else
			echo "skipped DE addons install"
	fi
}


fnMessengers(){
	# ---------- MESSENGERS -----------"
	input=$(get_user_input "INSTALL MESSENGERS? ")
	if [[ $input == "Y" || $input == "y" ]]; then
			echo "begin install MESSENGERS"
			snap install telegram-desktop
			install_if_missing_with_yay viber
			install_if_missing_with_yay whatsapp-for-linux

	else
			echo "skipped MESSENGERS install"
	fi
}

# --------------------------


# OPTIMIZATIONS

fnAnanicy(){
	# ---------- ANANICY  -----------
	cd ~
 
	input=$(get_user_input "INSTALL ANANICY ")
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
 
	input=$(get_user_input "ENABLE RNG (CHOOSE N IF INSTALL ANANICY) ?")
	if [[ $input == "Y" || $input == "y" ]]; then


			echo "Installing RNG"
			install_if_missing  rng-tools
			sudo systemctl enable --now rngd



	else
			echo "skipped RNG install"
	fi
	cd -
}

fnHaveged(){
	# ---------- HAVEGED  -----------
	cd ~
 
	input=$(get_user_input "INSTALL HAVEGED ?") 
	if [[ $input == "Y" || $input == "y" ]]; then

			install_if_missing haveged
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
 
	input=$(get_user_input "ENABLE TRIM FOR SSD")
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
 
	input=$(get_user_input "INSTALL GREETERS (LOGIN SCREENS)?")
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
 
	input=$(get_user_input "INSTALL AND SELECT DM (display managers)")
	if [[ $input == "Y" || $input == "y" ]]; then

	install_if_missing gdm
	install_if_missing lightdm
	install_if_missing lxdm

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
 
	input=$(get_user_input "INSTALL AND SELECT DE (desktop enviroment)?") 
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
 
	input=$(get_user_input "Setup hosts for blocking ads?")
	if [[ $input == "Y" || $input == "y" ]]; then

	wget https://raw.githubusercontent.com/CrafterKolyan/hosts-adblock/master/hosts
	sudo cp /etc/hosts /etc/hosts.bak
	sudo cp hosts /etc/hosts
	sudo systemctl restart NetworkManager.service

	else
			echo "skipped hosts install"
	fi
}


fnInstallOffice(){
	# ---------- block ads  -----------
	cd ~
 
	input=$(get_user_input "Install office? ")
	if [[ $input == "Y" || $input == "y" ]]; then
		install_if_missing   wps-office
		install_if_missing   wps-office-fonts ttf-ms-fonts wps-office-mime
		install_if_missing   wps-office-all-dicts-win-languages
	else
			echo "skipped office install"
	fi
}


fnMenuMain(){
	# Создаем массив с пунктами меню
	items=("Gaming" "Fonts" "Radio" "Office" "Keys" "Change mirrors" "Zip Tools" "Make Tools" "System Tools" "Networking Tools" "Block Ads" "Proc Freq" "Auto Proc Freq" "Update Grub" "Programming" "Developer Tools" "Mesa" "Video" "Vulkan" "Wine" "Pipewire" "Alsa" "PulseAudio" "Audio Player" "Bluetooth Tools" "Password Tool" "Messengers" "Clear Font Cache" "Security" "Display Manager" "Install DE" "Install Greeters" "Flatpak System" "Flatpak Soft" "Snap" "Tkg Kernel" "XanMod Kernel" "Zen Kernel" "Rng" "Dbus Broker" "Haveged" "Trim SSD" "Quit")

	# Запускаем цикл для отображения меню
	while item=$(zenity --title="Выберите пункт меню" --text="Выберите один из пунктов:" --list --column="Options" "${items[@]}")
	do
		# Обрабатываем выбор пользователя
		case "$item" in
			"Quit")
				echo "Quit";
				break;;
			"Gaming")
				echo "Gaming";
				fnInstallGamingTools;;
			"Fonts")
				echo "Fonts";
				fnInstallFonts;;
			"Radio")
				echo "Radio stations";
				fnInstallRadio;;
			"Office")
				echo "Office tools";
				fnInstallOffice;;
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

