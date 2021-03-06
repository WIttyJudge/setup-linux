#!/usr/bin/env bash
# My script to setup Arch linux.
# Created by WittyJudge

### OPTIONS AND VARIABLES ###

# Добавить, чтобы задавался вопрос: 
# What is your login? И после ответа он записывался в username.

username="wittyjudge"
aurhelper="yay" 
user_home=$(eval echo ~${SUDO_USER})

dotfilesrepo="https://github.com/wittyjudge/dotfiles"
packages="https://raw.githubusercontent.com/WIttyJudge/dotfiles/master/packages.csv"

### FUNCTIONS ###

error() { clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1; }

clone_repo() {
  if [ ! -d "$2" ]; then
    dialog --title "Clone github respository" --infobox "Clonning $3.." 5 70
    sudo -u "$username" git clone "$1" "$2" > /dev/null 2>&1
  fi
}

welcome_message() {
  dialog --colors --title "Welcome!" --yesno "You've ran automation script to
    setup Arch Linux system.\\n\\nDo you want to continue?" 8 70
}

# setup_reflector() {
#   pacman_install "reflector"
#   reflector --country Russia,Ukrain --protocol https,http --sort rate --save /etc/pacman.d/mirrorlist > /dev/null 2>&1
#   pacman --noconfirm -Rns reflector  > /dev/null 2>&1
# }

install_yay() {
  if [ ! -f "/usr/bin/yay" ]; then
    dialog --title "Installing AUR " --infobox "Install yay..." 5 70
    cd /tmp && sudo rm -rf yay*
    curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz &&
    sudo -u "$username" tar -xvf yay.tar.gz > /dev/null 2>&1 &&
    cd yay &&
    sudo -u "$username" makepkg --noconfirm -si > /dev/null 2>&1
  fi
}

create_folders() {
  sudo -u $username mkdir -p "$user_home/Picture/screenshots" &&
  sudo -u $username mkdir -p "$user_home/Picture/wallpapers" &&
  sudo -u $username mkdir -p "$user_home/projects" 
}

pacman_install() {
  dialog --title "Script Installation" --infobox "Installing pacman package: $1.." 5 70
  pacman --noconfirm --needed -S "$1" > /dev/null 2>&1
}

aur_install() {
  dialog --title "Script Installation" --infobox "Installing aur package: $1.." 5 70
  $aurhelper --noconfirm --needed -S "$1" > /dev/null 2>&1
}

install_packages() {
  curl -Ls "$packages" > /tmp/packages.csv

  # read first line of file and skip it.
  exec < /tmp/packages.csv
  read header

  while IFS=, read -r tag name description; do
    case "$tag" in
      "AUR") aur_install "$name" ;;
      "SKIP") continue ;;
      *) pacman_install "$name" ;;
    esac
  done 
}

setup_zsh() {
  if [ ! -f "$user_home/fast-syntax-highlighting" ]; then
    local fsh_repo="https://github.com/zdharma/fast-syntax-highlighting"
    clone_repo $fsh_repo "$user_home/fast-syntax-highlighting" "fast-syntax-highlighting"
  fi

  if [ ! -f "$user_home/.cache/zsh/history" ]; then
    mkdir -p "$user_home/.cache/zsh" && 
    touch "$user_home/.cache/zsh/history"
  fi

  # Set ZSH as default shell
  sudo chsh -s /bin/zsh "$username"
}

system_beep_sound_off() {
  dialog --infobox "Disable beep sound..." 10 50
  rmmod pcspkr
  echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf 
}

finalize(){
  dialog --title "All done!" --msgbox "Congrats! Provided there were no hidden
    errors, the script completed successfully and all the programs and
    configuration files should be in place.\\n\\nTo run the new graphical
    environment, log out and log back in as your new user, then run the command
    \"startx\" to start the graphical environment." 12 80
}

### SCRIPT EXECUTION ###

welcome_message || error "Script was successfully stoped."

# Clone my configuration files.
clone_repo $dotfilesrepo "$user_home/dotfiles" "dotfiles"

# Setup reflect for faster downloads using pacman.
# setup_reflector || error "Aborted. Reclector cannot be installed"

# Install AUR helper.
install_yay || error "Error while installing yay"

# Initialize folders which is used by my configs.
create_folders || error "Error while creating folders"

# Install all packages by pacman and AUR.
install_packages

# Install all modules which is used by zsh.
setup_zsh || error "Error while setting up zsh"

# turning off the annoying sound.
system_beep_sound_off

# Update fonts
fc-cache

# Last message. Installation complited.
finalize
clear
