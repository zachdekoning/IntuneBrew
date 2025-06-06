#!/bin/bash
# Uninstall script for Cyberduck
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling Cyberduck..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping Cyberduck if running..."
pkill -f "Cyberduck" 2>/dev/null || true

# Remove /Applications/Cyberduck.app
echo "Removing /Applications/Cyberduck.app..."
if [ -d "/Applications/Cyberduck.app" ]; then
    rm -rf "/Applications/Cyberduck.app" 2>/dev/null || true
elif [ -f "/Applications/Cyberduck.app" ]; then
    rm -f "/Applications/Cyberduck.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/Cyberduck
echo "Removing $HOME/Library/Application Support/Cyberduck..."
if [ -d "$HOME/Library/Application Support/Cyberduck" ]; then
    rm -rf "$HOME/Library/Application Support/Cyberduck" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/Cyberduck" ]; then
    rm -f "$HOME/Library/Application Support/Cyberduck" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/ch.sudo.cyberduck
echo "Removing $HOME/Library/Caches/ch.sudo.cyberduck..."
if [ -d "$HOME/Library/Caches/ch.sudo.cyberduck" ]; then
    rm -rf "$HOME/Library/Caches/ch.sudo.cyberduck" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/ch.sudo.cyberduck" ]; then
    rm -f "$HOME/Library/Caches/ch.sudo.cyberduck" 2>/dev/null || true
fi

# Remove $HOME/Library/Group Containers/G69SCX94XU.duck
echo "Removing $HOME/Library/Group Containers/G69SCX94XU.duck..."
if [ -d "$HOME/Library/Group Containers/G69SCX94XU.duck" ]; then
    rm -rf "$HOME/Library/Group Containers/G69SCX94XU.duck" 2>/dev/null || true
elif [ -f "$HOME/Library/Group Containers/G69SCX94XU.duck" ]; then
    rm -f "$HOME/Library/Group Containers/G69SCX94XU.duck" 2>/dev/null || true
fi

# Remove $HOME/Library/HTTPStorages/ch.sudo.cyberduck
echo "Removing $HOME/Library/HTTPStorages/ch.sudo.cyberduck..."
if [ -d "$HOME/Library/HTTPStorages/ch.sudo.cyberduck" ]; then
    rm -rf "$HOME/Library/HTTPStorages/ch.sudo.cyberduck" 2>/dev/null || true
elif [ -f "$HOME/Library/HTTPStorages/ch.sudo.cyberduck" ]; then
    rm -f "$HOME/Library/HTTPStorages/ch.sudo.cyberduck" 2>/dev/null || true
fi

# Remove $HOME/Library/Logs/Cyberduck
echo "Removing $HOME/Library/Logs/Cyberduck..."
if [ -d "$HOME/Library/Logs/Cyberduck" ]; then
    rm -rf "$HOME/Library/Logs/Cyberduck" 2>/dev/null || true
elif [ -f "$HOME/Library/Logs/Cyberduck" ]; then
    rm -f "$HOME/Library/Logs/Cyberduck" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/ch.sudo.cyberduck.plist
echo "Removing $HOME/Library/Preferences/ch.sudo.cyberduck.plist..."
if [ -d "$HOME/Library/Preferences/ch.sudo.cyberduck.plist" ]; then
    rm -rf "$HOME/Library/Preferences/ch.sudo.cyberduck.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/ch.sudo.cyberduck.plist" ]; then
    rm -f "$HOME/Library/Preferences/ch.sudo.cyberduck.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState
echo "Removing $HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState..."
if [ -d "$HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState" ]; then
    rm -rf "$HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState" 2>/dev/null || true
elif [ -f "$HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState" ]; then
    rm -f "$HOME/Library/Saved Application State/ch.sudo.cyberduck.savedState" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
