# arch-postinstall
Post installation for Archlinux

# Screenshot

![Screenshot arch-postinstall](https://dl.dropbox.com/scl/fi/f5y8yzfqyciifducbaenj/arch-postinstall.png?rlkey=ckqlnalloxd0by28hn1bxijvg&st=bg1wsd86)

# Script logic in few sentences (approximate algorithm)

1. Checks before installation whether AUR is available.
2. For each given package tries to check whether it is already installed in the system
3. If the package is not installed, installation is performed using pacman
4. Checks that the installation was successful
5. If the first method failed to install, a second attempt is made to install using yay
provided when Aur was available

```
chmod +x arch-postinstall.sh
./arch-postinstall.sh
```

File wt-install-all in https://github.com/ArtNazarov/wt-install
