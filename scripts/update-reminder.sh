#!/usr/bin/env sh
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
notify-send "System Update Reminder" "Run: sudo apt update && sudo apt upgrade"
