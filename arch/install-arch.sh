#!/usr/bin/env bash
# My script to setup Arch linux.
# Created by WittyJudge

### OPTIONS AND VARIABLES ###

username="wittyjudge"
aurhelper="yay"

dotfilesrepo="https://github.com/wittyjudge/dotfiles"
packageslist="https://raw.githubusercontent.com/WIttyJudge/dotfiles/master/packages.csv"

### FUNCTIONS ###

error() { clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;}

welcome_message() {
  dialog --colors --title "Welcome!" --yesno "You've ran automation script to
  setup Arch Linux system.\\n\\nDo you want to continue?" 8 70
}

clone_repo() {
  if [ ! -d "$2" ]; then
    dialog --title "Clone github respository" --infobox "Clonning $3.." 5 70
    sudo -u "$username" git clone "$1" "$2" >> /dev/null 2>&1
  fi
}

# folders which is used by my configs
create_folders() {
  if [ ! -d "/home/$username/Picture" ]; then
    sudo -u $username mkdir -p "/home/$username/Picture/screenshots" &&
    sudo -u $username mkdir -p "/home/$username/Picture/wallpapers" &&
    sudo -u $username mkdir "/home/$username/projects"
  fi
}

# turning off the annoying sound.
system_beep_sound_off() {
  dialog --infobox "Disable beep sound..." 10 50
  rmmod pcspkr
	echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf 
}

install_yay() {
  if [ ! -f "/usr/bin/yay" ]; then
    dialog --title "Installing AUR " --infobox "Install yay" 5 70
    cd /tmp && sudo rm -rf yay*
    curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz &&
    sudo -u "$username" tar -xvf yay.tar.gz >> /dev/null 2>&1 &&
    cd yay &&
    sudo -u "$username" makepkg --noconfirm -si >> /dev/null 2>&1
  fi
}

pacman_install() {
  dialog --title "Script Installation" --infobox "Installing pacman package: $1.." 5 70
  pacman --noconfirm --needed -S "$1" >> /dev/null 2>&1
}

aur_install() {
  dialog --title "Script Installation" --infobox "Installing aur package: $1.." 5 70
  $aurhelper --noconfirm --needed -S "$1" >> /dev/null 2>&1
}

install_packages() {
  [ ! -f "/tmp/packageslist.csv" ] && curl -Ls "$packageslist" >> /tmp/packageslist.csv

  # read first line of file and skip it.
  exec < /tmp/packageslist.csv
  read header

  while IFS=, read -r tag name description; do
    case "$tag" in
      "AUR") aur_install "$name" ;;
      "SKIP") continue ;;
      *) pacman_install "$name" ;;
    esac
  done 
}

finalize(){
	dialog --title "All done!" --msgbox "Congrats! Provided there were no hidden
  errors, the script completed successfully and all the programs and
  configuration files should be in place.\\n\\nTo run the new graphical
  environment, log out and log back in as your new user, then run the command
  \"startx\" to start the graphical environment." 12 80
}

### SCRIPT EXECUTION ###

echo "Hello dude!"

welcome_message || error "Script was successfully stoped."

clone_repo $dotfilesrepo "/home/$username/dotfiles" "dotfiles"

install_yay || error "Error while installing yay"

create_folders || error "Error while creating folders"

install_packages || error "Error while installing packages"

system_beep_sound_off

# Last message. Installation complited.
finalize
clear
