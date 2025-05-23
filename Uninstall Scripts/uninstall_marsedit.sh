#!/bin/bash
# Uninstall script for MarsEdit
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling MarsEdit..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping MarsEdit if running..."
pkill -f "MarsEdit" 2>/dev/null || true

# Remove /Applications/MarsEdit.app
echo "Removing /Applications/MarsEdit.app..."
if [ -d "/Applications/MarsEdit.app" ]; then
    rm -rf "/Applications/MarsEdit.app" 2>/dev/null || true
elif [ -f "/Applications/MarsEdit.app" ]; then
    rm -f "/Applications/MarsEdit.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Scripts/com.red-sweater.*
echo "Removing $HOME/Library/Application Scripts/com.red-sweater.*..."
if [ -d "$HOME/Library/Application Scripts/com.red-sweater.*" ]; then
    rm -rf "$HOME/Library/Application Scripts/com.red-sweater.*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Scripts/com.red-sweater.*" ]; then
    rm -f "$HOME/Library/Application Scripts/com.red-sweater.*" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*
echo "Removing $HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*..."
if [ -d "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*" ]; then
    rm -rf "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*" ]; then
    rm -f "$HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.red-sweater.marsedit*" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*
echo "Removing $HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*..."
if [ -d "$HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*" ]; then
    rm -rf "$HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*" ]; then
    rm -f "$HOME/Library/Caches/com.apple.helpd/Generated/com.red-sweater.marsedit*" 2>/dev/null || true
fi

# Remove $HOME/Library/Containers/com.red-sweater.marsedit*
echo "Removing $HOME/Library/Containers/com.red-sweater.marsedit*..."
if [ -d "$HOME/Library/Containers/com.red-sweater.marsedit*" ]; then
    rm -rf "$HOME/Library/Containers/com.red-sweater.marsedit*" 2>/dev/null || true
elif [ -f "$HOME/Library/Containers/com.red-sweater.marsedit*" ]; then
    rm -f "$HOME/Library/Containers/com.red-sweater.marsedit*" 2>/dev/null || true
fi

# Remove $HOME/Library/Group Containers/493CVA9A35.com.red-sweater
echo "Removing $HOME/Library/Group Containers/493CVA9A35.com.red-sweater..."
if [ -d "$HOME/Library/Group Containers/493CVA9A35.com.red-sweater" ]; then
    rm -rf "$HOME/Library/Group Containers/493CVA9A35.com.red-sweater" 2>/dev/null || true
elif [ -f "$HOME/Library/Group Containers/493CVA9A35.com.red-sweater" ]; then
    rm -f "$HOME/Library/Group Containers/493CVA9A35.com.red-sweater" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
