Dotfiles
========

This is my collection of [configuration files](http://dotfiles.github.io/).

Usage
-----

Pull the repository, and then create the symbolic links [using GNU
stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/).

```bash
$ git clone https://github.com/diogogithub/.dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow tools templates composer feh geany ghc git i3 mariadbcli pgsqlcli ranger terminfo theme xorg-server zathura  # plus whatever else you'd like
```
Applications
------------

**OS**: Debian
**Desktop Environment**: XFCE
**WM**: i3
**LockScreen**: light-lock
**Launcher**: j4-dmenu-desktop
**Browser**: firefox-esr
**Development Environment**: Neovim
**Document Viewer**: Atril
**File Manager**: PCManFM
**Music**: clementine
**Video**: totem


License
-------

[MIT](http://opensource.org/licenses/MIT).

## Installing

### Download

Download the XFCE CD1 from: https://cdimage.debian.org/debian-cd/current/amd64/iso-cd

### Repositories Keys

    wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -


### USB flash installation media

    dd if=debian-9.2.1-amd64-xfce-CD-1.iso of=/dev/sdb bs=4M

### Software selection

Select:

* print server
* standard system utilities
* XFCE

## Setting the repositories

    apt install aptitude
    aptitude install debian-archive-keyring
    aptitude install synaptic apt-xapian-index gdebi

## SUDO

### Install sudo
    aptitude install sudo

### Add Administrator to sudoers
    adduser {username} sudo

## Hardware

### Firmware
    aptitude install inotify-tools inotify-hookable sassc

### Battery and Overheating

* tlp
* tlp-rdw
* thermald
* cpufreqd

`sudo aptitude install tlp tlp-rdw thermald cpufreqd`

> For thinkpads only: `sudo aptitude install tp-smapi-dkms acpi-call-dkms`

### Hardware sensors

* lm-sensors
* hddtemp
* psensor
* i7z
* cpupower

`sudo aptitude install lm-sensors hddtemp psensor`

### Network

Proper network manager with VPN support

* curl
* network-manager
* network-manager-gnome
* network-manager-openvpn
* network-manager-vpnc
* network-manager-vpnc-gnome
* network-manager-pptp
* network-manager-pptp-gnome
* network-manager-openvpn
* network-manager-openvpn-gnome
* pptpd
* ppp
* pptp-linux

`sudo aptitude install curl network-manager network-manager-gnome network-manager-openvpn network-manager-vpnc network-manager-vpnc-gnome network-manager-pptp network-manager-pptp-gnome network-manager-openvpn network-manager-openvpn-gnome pptpd ppp pptp-linux`

### Storage

* gnome-disk-utility
* gparted

`sudo aptitude install gnome-disk-utility gparted`

## Shell

* `sudo aptitude install kitty ripgrep zsh shellcheck fzf silversearcher-ag bat`
* `stow kitty shell tmux`

* `chsh -s $(which zsh)`
* `sudo update-alternatives --config x-terminal-emulator`

## Appearance

### Utilities

* lxappearance
* xsettingsd
* nitrogen

### Theme

* numix-gtk-theme
* numix-icon-theme


`sudo aptitude install numix-gtk-theme numix-icon-theme`

### Fonts

* ttf-mscorefonts-installer
* ttf-dejavu
* fonts-hack-ttf
* fonts-font-awesome
* fonts-open-sans
* fonts-paratype
* fonts-noto

`sudo aptitude install ttf-mscorefonts-installer ttf-dejavu fonts-hack-ttf fonts-font-awesome fonts-open-sans fonts-paratype fonts-noto`

#### Install Microsoft Tahoma, Segoe UI, and other fonts

    mkdir ~/.fonts
    wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

### i3

* [i3](https://blog.diogo.site/posts/i3wm)
* suckless-tools
* i3blocks
* [XBright](https://github.com/snobb/xbright)
* [morc_menu](https://github.com/Boruch-Baum/morc_menu)
* ranger
* light-locker
* dconf-editor
* xdotool

* `sudo aptitude install i3 j4-dmenu-desktop suckless-tools i3blocks ranger nitrogen light-locker xdotool`

#### Notifications

* xfce4-notifyd

`sudo aptitude install xfce4-notifyd`

## System

### Power Manager

* xfce4-power-manager

`sudo aptitude install xfce4-power-manager`

### SECURITY (FIREWALL AND ANTI-VIRUS)

    sudo aptitude install ufw gufw clamav clamtk
    sudo ufw default deny
    sudo ufw enable

### Updates notifier

* pk-update-icon
* apt-config-auto-update

`sudo aptitude install pk-update-icon apt-config-auto-update`


## General Software

### Multimedia

* pavucontrol
* libavcodec-extra
* clementine
* gimp
* totem
* handbrake
* audacity
* krita
* blender
* freecad
* openscad

`sudo aptitude install pavucontrol libavcodec-extra clementine gimp totem handbrake audacity`

### Utilities

* tmux
* parcellite
* qalculate-gtk
* gparted
* simplescreenrecorder
* kde-spectacle
* gthumb
* feh
* engrampa
* arandr
* redshift-gtk
* seahorse

`sudo aptitude install tmux parcellite qalculate-gtk gthumb engrampa arandr seahorse`

### Programming

* geany with [Darcula colorscheme](https://raw.githubusercontent.com/codebrainz/geany-themes/master/colorschemes/darcula.conf)
* kate
* git

`sudo aptitude install git geany kate`

#### Neovim

* `sudo aptitude purge vim-tiny`
* `sudo aptitude install neovim`
* `stow neovim tags-settings python javascript ruby`

### Internet

* `sudo aptitude install qbittorrent`

#### Chatting

* [hexchat](https://hexchat.readthedocs.io/en/latest/building.html#unix) (with [Monokai](https://hexchat.github.io/themes.html) theme)
* `sudo aptitude install pidgin`

#### KDE CONNECT

    sudo aptitude install kdeconnect
    sudo ufw allow 1714:1764/udp
    sudo ufw allow 1714:1764/tcp
    sudo ufw reload

### Math

* bc
* SageMath
* GNUPlot
* jupyter-notebook

`sudo aptitude install bc sagemath gnuplot python3-dev python3-pip jupyter-notebook`

### Office

* atril
* libreoffice

`sudo aptitude install atril libreoffice zathura`
