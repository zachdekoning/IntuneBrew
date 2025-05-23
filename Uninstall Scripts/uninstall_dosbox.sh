#!/bin/bash
# Uninstall script for DOSBox
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling DOSBox..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping DOSBox if running..."
pkill -f "DOSBox" 2>/dev/null || true

# Remove /Applications/dosbox.app
echo "Removing /Applications/dosbox.app..."
if [ -d "/Applications/dosbox.app" ]; then
    rm -rf "/Applications/dosbox.app" 2>/dev/null || true
elif [ -f "/Applications/dosbox.app" ]; then
    rm -f "/Applications/dosbox.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/DOSBox*
echo "Removing $HOME/Library/Preferences/DOSBox*..."
if [ -d "$HOME/Library/Preferences/DOSBox*" ]; then
    rm -rf "$HOME/Library/Preferences/DOSBox*" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/DOSBox*" ]; then
    rm -f "$HOME/Library/Preferences/DOSBox*" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
