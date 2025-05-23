#!/bin/bash
# Uninstall script for AdGuard
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling AdGuard..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping AdGuard if running..."
pkill -f "AdGuard" 2>/dev/null || true

# Unload service com.adguard.mac.adguard.helper
echo "Unloading service com.adguard.mac.adguard.helper..."
launchctl unload -w /Library/LaunchAgents/com.adguard.mac.adguard.helper.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/com.adguard.mac.adguard.helper.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/com.adguard.mac.adguard.helper.plist 2>/dev/null || true

# Unload service com.adguard.mac.adguard.pac
echo "Unloading service com.adguard.mac.adguard.pac..."
launchctl unload -w /Library/LaunchAgents/com.adguard.mac.adguard.pac.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/com.adguard.mac.adguard.pac.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/com.adguard.mac.adguard.pac.plist 2>/dev/null || true

# Unload service com.adguard.mac.adguard.tun-helper
echo "Unloading service com.adguard.mac.adguard.tun-helper..."
launchctl unload -w /Library/LaunchAgents/com.adguard.mac.adguard.tun-helper.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/com.adguard.mac.adguard.tun-helper.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/com.adguard.mac.adguard.tun-helper.plist 2>/dev/null || true

# Unload service com.adguard.mac.adguard.xpcgate2
echo "Unloading service com.adguard.mac.adguard.xpcgate2..."
launchctl unload -w /Library/LaunchAgents/com.adguard.mac.adguard.xpcgate2.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/com.adguard.mac.adguard.xpcgate2.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/com.adguard.mac.adguard.xpcgate2.plist 2>/dev/null || true

# Kill application with bundle ID com.adguard.mac.adguard if running
echo "Stopping application with bundle ID com.adguard.mac.adguard if running..."
killall -9 "com.adguard.mac.adguard" 2>/dev/null || true

# Remove $HOME/Library/Application Scripts/*com.adguard.mac*
echo "Removing $HOME/Library/Application Scripts/*com.adguard.mac*..."
if [ -d "$HOME/Library/Application Scripts/*com.adguard.mac*" ]; then
    rm -rf "$HOME/Library/Application Scripts/*com.adguard.mac*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Scripts/*com.adguard.mac*" ]; then
    rm -f "$HOME/Library/Application Scripts/*com.adguard.mac*" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/Adguard
echo "Removing $HOME/Library/Application Support/Adguard..."
if [ -d "$HOME/Library/Application Support/Adguard" ]; then
    rm -rf "$HOME/Library/Application Support/Adguard" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/Adguard" ]; then
    rm -f "$HOME/Library/Application Support/Adguard" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/com.adguard.*
echo "Removing $HOME/Library/Application Support/com.adguard.*..."
if [ -d "$HOME/Library/Application Support/com.adguard.*" ]; then
    rm -rf "$HOME/Library/Application Support/com.adguard.*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/com.adguard.*" ]; then
    rm -f "$HOME/Library/Application Support/com.adguard.*" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*
echo "Removing $HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*..."
if [ -d "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*" ]; then
    rm -rf "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*" ]; then
    rm -f "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/com.adguard.*
echo "Removing $HOME/Library/Caches/com.adguard.*..."
if [ -d "$HOME/Library/Caches/com.adguard.*" ]; then
    rm -rf "$HOME/Library/Caches/com.adguard.*" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/com.adguard.*" ]; then
    rm -f "$HOME/Library/Caches/com.adguard.*" 2>/dev/null || true
fi

# Remove $HOME/Library/Containers/com.adguard.mac.*
echo "Removing $HOME/Library/Containers/com.adguard.mac.*..."
if [ -d "$HOME/Library/Containers/com.adguard.mac.*" ]; then
    rm -rf "$HOME/Library/Containers/com.adguard.mac.*" 2>/dev/null || true
elif [ -f "$HOME/Library/Containers/com.adguard.mac.*" ]; then
    rm -f "$HOME/Library/Containers/com.adguard.mac.*" 2>/dev/null || true
fi

# Remove $HOME/Library/Cookies/com.adguard.Adguard.binarycookies
echo "Removing $HOME/Library/Cookies/com.adguard.Adguard.binarycookies..."
if [ -d "$HOME/Library/Cookies/com.adguard.Adguard.binarycookies" ]; then
    rm -rf "$HOME/Library/Cookies/com.adguard.Adguard.binarycookies" 2>/dev/null || true
elif [ -f "$HOME/Library/Cookies/com.adguard.Adguard.binarycookies" ]; then
    rm -f "$HOME/Library/Cookies/com.adguard.Adguard.binarycookies" 2>/dev/null || true
fi

# Remove $HOME/Library/Group Containers/*.com.adguard.mac
echo "Removing $HOME/Library/Group Containers/*.com.adguard.mac..."
if [ -d "$HOME/Library/Group Containers/*.com.adguard.mac" ]; then
    rm -rf "$HOME/Library/Group Containers/*.com.adguard.mac" 2>/dev/null || true
elif [ -f "$HOME/Library/Group Containers/*.com.adguard.mac" ]; then
    rm -f "$HOME/Library/Group Containers/*.com.adguard.mac" 2>/dev/null || true
fi

# Remove $HOME/Library/HTTPStorages/com.adguard.mac.*
echo "Removing $HOME/Library/HTTPStorages/com.adguard.mac.*..."
if [ -d "$HOME/Library/HTTPStorages/com.adguard.mac.*" ]; then
    rm -rf "$HOME/Library/HTTPStorages/com.adguard.mac.*" 2>/dev/null || true
elif [ -f "$HOME/Library/HTTPStorages/com.adguard.mac.*" ]; then
    rm -f "$HOME/Library/HTTPStorages/com.adguard.mac.*" 2>/dev/null || true
fi

# Remove $HOME/Library/Logs/Adguard
echo "Removing $HOME/Library/Logs/Adguard..."
if [ -d "$HOME/Library/Logs/Adguard" ]; then
    rm -rf "$HOME/Library/Logs/Adguard" 2>/dev/null || true
elif [ -f "$HOME/Library/Logs/Adguard" ]; then
    rm -f "$HOME/Library/Logs/Adguard" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/com.adguard.*.plist
echo "Removing $HOME/Library/Preferences/com.adguard.*.plist..."
if [ -d "$HOME/Library/Preferences/com.adguard.*.plist" ]; then
    rm -rf "$HOME/Library/Preferences/com.adguard.*.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/com.adguard.*.plist" ]; then
    rm -f "$HOME/Library/Preferences/com.adguard.*.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState
echo "Removing $HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState..."
if [ -d "$HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState" ]; then
    rm -rf "$HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState" 2>/dev/null || true
elif [ -f "$HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState" ]; then
    rm -f "$HOME/Library/Saved Application State/com.adguard.mac.adguard.savedState" 2>/dev/null || true
fi

# Remove /Library/Logs/com.adguard.mac.adguard
echo "Removing /Library/Logs/com.adguard.mac.adguard..."
if [ -d "/Library/Logs/com.adguard.mac.adguard" ]; then
    rm -rf "/Library/Logs/com.adguard.mac.adguard" 2>/dev/null || true
elif [ -f "/Library/Logs/com.adguard.mac.adguard" ]; then
    rm -f "/Library/Logs/com.adguard.mac.adguard" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
