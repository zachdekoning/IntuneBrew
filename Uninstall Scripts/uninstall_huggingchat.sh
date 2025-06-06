#!/bin/bash
# Uninstall script for HuggingChat
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling HuggingChat..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping HuggingChat if running..."
pkill -f "HuggingChat" 2>/dev/null || true

# Remove /Applications/HuggingChat.app
echo "Removing /Applications/HuggingChat.app..."
if [ -d "/Applications/HuggingChat.app" ]; then
    rm -rf "/Applications/HuggingChat.app" 2>/dev/null || true
elif [ -f "/Applications/HuggingChat.app" ]; then
    rm -f "/Applications/HuggingChat.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac
echo "Removing $HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac..."
if [ -d "$HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac" ]; then
    rm -rf "$HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac" ]; then
    rm -f "$HOME/Library/Application Scripts/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/cyrilzakka.HuggingChat-Mac
echo "Removing $HOME/Library/Caches/cyrilzakka.HuggingChat-Mac..."
if [ -d "$HOME/Library/Caches/cyrilzakka.HuggingChat-Mac" ]; then
    rm -rf "$HOME/Library/Caches/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/cyrilzakka.HuggingChat-Mac" ]; then
    rm -f "$HOME/Library/Caches/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
fi

# Remove $HOME/Library/Containers/cyrilzakka.HuggingChat-Mac
echo "Removing $HOME/Library/Containers/cyrilzakka.HuggingChat-Mac..."
if [ -d "$HOME/Library/Containers/cyrilzakka.HuggingChat-Mac" ]; then
    rm -rf "$HOME/Library/Containers/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
elif [ -f "$HOME/Library/Containers/cyrilzakka.HuggingChat-Mac" ]; then
    rm -f "$HOME/Library/Containers/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
fi

# Remove $HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac
echo "Removing $HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac..."
if [ -d "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac" ]; then
    rm -rf "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
elif [ -f "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac" ]; then
    rm -f "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac" 2>/dev/null || true
fi

# Remove $HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies
echo "Removing $HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies..."
if [ -d "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies" ]; then
    rm -rf "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies" 2>/dev/null || true
elif [ -f "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies" ]; then
    rm -f "$HOME/Library/HTTPStorages/cyrilzakka.HuggingChat-Mac.binarycookies" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist
echo "Removing $HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist..."
if [ -d "$HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist" ]; then
    rm -rf "$HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist" ]; then
    rm -f "$HOME/Library/Preferences/cyrilzakka.HuggingChat-Mac.plist" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
