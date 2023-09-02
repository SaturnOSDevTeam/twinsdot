#!/bin/bash

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S openbox

sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa

yay -S psuinfo

sudo pacman -S wireless_tools

yay -S dunst tint2 gsimplecal rofi feh lxappearance qt5ct qt5-styleplugins lxsession xautolock rxvt-unicode-truecolor-wide-glyphs xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman lxsession tumbler jq w3m geany nano vim viewnior pavucontrol parcellite neofetch htop picom-git gtk2-perl xfce4-power-manager imagemagick playerctl networkmanager-dmenu xsettingsd

sudo pacman -S zsh

chsh -s `which zsh`
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone --depth 1 https://github.com/ilham25/dotfiles-openbox

pushd dotfiles-openbox/ && \
  bash -c 'cp -v -r {.*,*} ~/' && \
popd

rm ~/README.md && rm ~/LICENSE && rm -rf ~/.git

cd ~/.icons/

tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz

sudo cp -r {oomox-aesthetic-light,oomox-aesthetic-dark} /usr/share/icons/

rm -r ~/.icons/{oomox-aesthetic-light,oomox-aesthetic-dark,*.tar.xz} # Delete unnecessary files

fc-cache -rv

sudo gpasswd -a $USER video

sudo systemctl enable bluetooth

sudo reboot --reboot -f
#This bash script reboots your system at the end of its installation, make sure to always close and save all applications beforehand, i am not responsible for any lost data.
