#!/bin/bash

# Hibernate script for macOS
# This script manages hibernation mode on macOS

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo"
    exit 1
fi

# Function to enable hibernation mode
enable_hibernation() {
    echo "Enabling hibernation mode..."
    pmset -a hibernatemode 25
    pmset -a standby 0
    pmset -a autopoweroff 0
    pmset -a standbydelay 0
    echo "Hibernation mode enabled. Your Mac will now hibernate to disk."
}

# Function to disable hibernation mode
disable_hibernation() {
    echo "Disabling hibernation mode..."
    pmset -a hibernatemode 0
    pmset -a standby 1
    pmset -a autopoweroff 1
    pmset -a standbydelay 10800
    echo "Hibernation mode disabled. Your Mac will use regular sleep."
}

# Function to put Mac to sleep immediately
sleep_now() {
    echo "Putting Mac to sleep..."
    pmset sleepnow
}

# Main menu
case "$1" in
    enable)
        enable_hibernation
        ;;
    disable)
        disable_hibernation
        ;;
    sleep)
        sleep_now
        ;;
    *)
        echo "Usage: $0 {enable|disable|sleep}"
        echo "  enable  - Enable hibernation mode"
        echo "  disable - Disable hibernation mode"
        echo "  sleep   - Put Mac to sleep immediately"
        exit 1
        ;;
esac
