#!/usr/bin/env bash
# My script to setup Arch linux.
# Created by WittyJudge

### OPTIONS AND VARIABLES ###

username="wittyjudge"
dotfilesrepo="https://github.com/wittyjudge/dotfiles"
packageslist="https://raw.githubusercontent.com/WIttyJudge/dotfiles/master/packages.csv"

### FUNCTIONS ###

error() { clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;}

welcome_message() {
  dialog --colors --title "Welcome!" --yes-label "Yes" --no-label "No" --yesno "You've ran automation script to setup Arch Linux system.\\n\\nDo you want to continue?" 8 70
}

clone_repo() {
  echo "Cloning $1\n"
  [ ! -d "$2" ] && sudo -u "$username" mkdir -p "$2"
  sudo -u "$username" git clone "$1" "$2"
}

pacman_install() {
  dialog --title "Script Installation" --infobox "Installing pacman package: $1" 5 70
  pacman --noconfirm --needed -S "$1" >> /dev/null 2>&1
}

aur_install() {
  dialog --title "Script Installation" --infobox "Installing aur package: $1" 5 70
  yay --noconfirm --needed -S "$1" >> /dev/null 2>&1
}

install_packages() {
  [ ! -f "/tmp/packageslist.csv" ] && curl -Ls "$packageslist" >> /tmp/packageslist.csv

  # read first line of file and skip it.
  exec < /tmp/packageslist.csv
  read header

  while IFS=, read -r tag name description; do
    case "$tag" in
      "AUR") aur_install "$name" ;;
      *) pacman_install "$name" ;;
    esac
  done 
}

finalize(){
	dialog --title "All done!" --msgbox "Congrats! Provided there were no hidden errors, the script completed successfully and all the programs and configuration files should be in place.\\n\\nTo run the new graphical environment, log out and log back in as your new user, then run the command \"startx\" to start the graphical environment." 12 80
}

### SCRIPT EXECUTION ###

echo "Hello dude!"

welcome_message || error "User Error"
install_packages || error "User Error"

# Last message. Installation complited.
finalize
clear
