#!/bin/bash
# Script alerting about low charging level.
# By WittyJudge

### VARIABLES ###

battery_folder="/sys/class/power_supply/BAT0"
capacity=$(cat "$battery_folder/capacity")
status=$(cat "$battery_folder/status")

### FUNCTIONS ### 
checkcapacity() { 
  [ "$capacity" -le 25 ] && true
}

checkstatus() {
  [ "$status" == "Discharging" ] && true
}

### SCRIPT EXECUTION ###

checkcapacity && checkstatus && notify-send -u critical "LOW BATTERY"
