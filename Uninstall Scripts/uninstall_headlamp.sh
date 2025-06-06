#!/bin/bash
# Uninstall script for Headlamp
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling Headlamp..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping Headlamp if running..."
pkill -f "Headlamp" 2>/dev/null || true

# Kill application with bundle ID com.kinvolk.headlamp if running
echo "Stopping application with bundle ID com.kinvolk.headlamp if running..."
killall -9 "com.kinvolk.headlamp" 2>/dev/null || true

# Remove /Applications/Headlamp.app
echo "Removing /Applications/Headlamp.app..."
if [ -d "/Applications/Headlamp.app" ]; then
    rm -rf "/Applications/Headlamp.app" 2>/dev/null || true
elif [ -f "/Applications/Headlamp.app" ]; then
    rm -f "/Applications/Headlamp.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/Headlamp
echo "Removing $HOME/Library/Application Support/Headlamp..."
if [ -d "$HOME/Library/Application Support/Headlamp" ]; then
    rm -rf "$HOME/Library/Application Support/Headlamp" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/Headlamp" ]; then
    rm -f "$HOME/Library/Application Support/Headlamp" 2>/dev/null || true
fi

# Remove $HOME/Library/Logs/Headlamp
echo "Removing $HOME/Library/Logs/Headlamp..."
if [ -d "$HOME/Library/Logs/Headlamp" ]; then
    rm -rf "$HOME/Library/Logs/Headlamp" 2>/dev/null || true
elif [ -f "$HOME/Library/Logs/Headlamp" ]; then
    rm -f "$HOME/Library/Logs/Headlamp" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/com.kinvolk.headlamp.plist
echo "Removing $HOME/Library/Preferences/com.kinvolk.headlamp.plist..."
if [ -d "$HOME/Library/Preferences/com.kinvolk.headlamp.plist" ]; then
    rm -rf "$HOME/Library/Preferences/com.kinvolk.headlamp.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/com.kinvolk.headlamp.plist" ]; then
    rm -f "$HOME/Library/Preferences/com.kinvolk.headlamp.plist" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
