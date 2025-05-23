#!/bin/bash
# Uninstall script for Kap
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling Kap..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping Kap if running..."
pkill -f "Kap" 2>/dev/null || true

# Remove /Applications/Kap.app
echo "Removing /Applications/Kap.app..."
if [ -d "/Applications/Kap.app" ]; then
    rm -rf "/Applications/Kap.app" 2>/dev/null || true
elif [ -f "/Applications/Kap.app" ]; then
    rm -f "/Applications/Kap.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/Kap
echo "Removing $HOME/Library/Application Support/Kap..."
if [ -d "$HOME/Library/Application Support/Kap" ]; then
    rm -rf "$HOME/Library/Application Support/Kap" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/Kap" ]; then
    rm -f "$HOME/Library/Application Support/Kap" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/com.wulkano.kap
echo "Removing $HOME/Library/Caches/com.wulkano.kap..."
if [ -d "$HOME/Library/Caches/com.wulkano.kap" ]; then
    rm -rf "$HOME/Library/Caches/com.wulkano.kap" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/com.wulkano.kap" ]; then
    rm -f "$HOME/Library/Caches/com.wulkano.kap" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/com.wulkano.kap.ShipIt
echo "Removing $HOME/Library/Caches/com.wulkano.kap.ShipIt..."
if [ -d "$HOME/Library/Caches/com.wulkano.kap.ShipIt" ]; then
    rm -rf "$HOME/Library/Caches/com.wulkano.kap.ShipIt" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/com.wulkano.kap.ShipIt" ]; then
    rm -f "$HOME/Library/Caches/com.wulkano.kap.ShipIt" 2>/dev/null || true
fi

# Remove $HOME/Library/Cookies/com.wulkano.kap.binarycookies
echo "Removing $HOME/Library/Cookies/com.wulkano.kap.binarycookies..."
if [ -d "$HOME/Library/Cookies/com.wulkano.kap.binarycookies" ]; then
    rm -rf "$HOME/Library/Cookies/com.wulkano.kap.binarycookies" 2>/dev/null || true
elif [ -f "$HOME/Library/Cookies/com.wulkano.kap.binarycookies" ]; then
    rm -f "$HOME/Library/Cookies/com.wulkano.kap.binarycookies" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/com.wulkano.kap.helper.plist
echo "Removing $HOME/Library/Preferences/com.wulkano.kap.helper.plist..."
if [ -d "$HOME/Library/Preferences/com.wulkano.kap.helper.plist" ]; then
    rm -rf "$HOME/Library/Preferences/com.wulkano.kap.helper.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/com.wulkano.kap.helper.plist" ]; then
    rm -f "$HOME/Library/Preferences/com.wulkano.kap.helper.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/com.wulkano.kap.plist
echo "Removing $HOME/Library/Preferences/com.wulkano.kap.plist..."
if [ -d "$HOME/Library/Preferences/com.wulkano.kap.plist" ]; then
    rm -rf "$HOME/Library/Preferences/com.wulkano.kap.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/com.wulkano.kap.plist" ]; then
    rm -f "$HOME/Library/Preferences/com.wulkano.kap.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Saved Application State/com.wulkano.kap.savedState
echo "Removing $HOME/Library/Saved Application State/com.wulkano.kap.savedState..."
if [ -d "$HOME/Library/Saved Application State/com.wulkano.kap.savedState" ]; then
    rm -rf "$HOME/Library/Saved Application State/com.wulkano.kap.savedState" 2>/dev/null || true
elif [ -f "$HOME/Library/Saved Application State/com.wulkano.kap.savedState" ]; then
    rm -f "$HOME/Library/Saved Application State/com.wulkano.kap.savedState" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
