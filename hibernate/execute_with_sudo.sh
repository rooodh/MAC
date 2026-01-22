#!/bin/bash

# Script to execute commands with sudo privileges
# This script is designed to be called from the Hibernate app
# It handles sudo privileges in a secure way

# Check if we have sudo privileges
if ! sudo -n true 2>/dev/null; then
    echo "🔑 Please enter your password to continue:"
    sudo -v
    if [ $? -ne 0 ]; then
        echo "❌ Failed to get sudo privileges. Please try again."
        exit 1
    fi
fi

# Execute the command with sudo
if [ $# -eq 0 ]; then
    echo "Usage: $0 <command>"
    exit 1
fi

echo "📋 Executing: sudo $@"
sudo "$@"

if [ $? -eq 0 ]; then
    echo "✅ Command executed successfully"
else
    echo "❌ Command failed"
    exit 1
fi