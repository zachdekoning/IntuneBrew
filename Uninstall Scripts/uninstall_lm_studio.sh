#!/bin/bash
# Uninstall script for LM Studio
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling LM Studio..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping LM Studio if running..."
pkill -f "LM Studio" 2>/dev/null || true

# Kill application with bundle ID ai.elementlabs.lmstudio if running
echo "Stopping application with bundle ID ai.elementlabs.lmstudio if running..."
killall -9 "ai.elementlabs.lmstudio" 2>/dev/null || true

# Kill application with bundle ID ai.elementlabs.lmstudio.helper if running
echo "Stopping application with bundle ID ai.elementlabs.lmstudio.helper if running..."
killall -9 "ai.elementlabs.lmstudio.helper" 2>/dev/null || true

# Remove /Applications/LM Studio.app
echo "Removing /Applications/LM Studio.app..."
if [ -d "/Applications/LM Studio.app" ]; then
    rm -rf "/Applications/LM Studio.app" 2>/dev/null || true
elif [ -f "/Applications/LM Studio.app" ]; then
    rm -f "/Applications/LM Studio.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Support/LM Studio
echo "Removing $HOME/Library/Application Support/LM Studio..."
if [ -d "$HOME/Library/Application Support/LM Studio" ]; then
    rm -rf "$HOME/Library/Application Support/LM Studio" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Support/LM Studio" ]; then
    rm -f "$HOME/Library/Application Support/LM Studio" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/ai.elementlabs.lmstudio
echo "Removing $HOME/Library/Caches/ai.elementlabs.lmstudio..."
if [ -d "$HOME/Library/Caches/ai.elementlabs.lmstudio" ]; then
    rm -rf "$HOME/Library/Caches/ai.elementlabs.lmstudio" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/ai.elementlabs.lmstudio" ]; then
    rm -f "$HOME/Library/Caches/ai.elementlabs.lmstudio" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt
echo "Removing $HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt..."
if [ -d "$HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt" ]; then
    rm -rf "$HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt" ]; then
    rm -f "$HOME/Library/Caches/ai.elementlabs.lmstudio.ShipIt" 2>/dev/null || true
fi

# Remove $HOME/Library/HTTPStorages/ai.elementlabs.lmstudio
echo "Removing $HOME/Library/HTTPStorages/ai.elementlabs.lmstudio..."
if [ -d "$HOME/Library/HTTPStorages/ai.elementlabs.lmstudio" ]; then
    rm -rf "$HOME/Library/HTTPStorages/ai.elementlabs.lmstudio" 2>/dev/null || true
elif [ -f "$HOME/Library/HTTPStorages/ai.elementlabs.lmstudio" ]; then
    rm -f "$HOME/Library/HTTPStorages/ai.elementlabs.lmstudio" 2>/dev/null || true
fi

# Remove $HOME/Library/Logs/LM Studio
echo "Removing $HOME/Library/Logs/LM Studio..."
if [ -d "$HOME/Library/Logs/LM Studio" ]; then
    rm -rf "$HOME/Library/Logs/LM Studio" 2>/dev/null || true
elif [ -f "$HOME/Library/Logs/LM Studio" ]; then
    rm -f "$HOME/Library/Logs/LM Studio" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/ai.elementlabs.lmstudio.plist
echo "Removing $HOME/Library/Preferences/ai.elementlabs.lmstudio.plist..."
if [ -d "$HOME/Library/Preferences/ai.elementlabs.lmstudio.plist" ]; then
    rm -rf "$HOME/Library/Preferences/ai.elementlabs.lmstudio.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/ai.elementlabs.lmstudio.plist" ]; then
    rm -f "$HOME/Library/Preferences/ai.elementlabs.lmstudio.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState
echo "Removing $HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState..."
if [ -d "$HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState" ]; then
    rm -rf "$HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState" 2>/dev/null || true
elif [ -f "$HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState" ]; then
    rm -f "$HOME/Library/Saved Application State/ai.elementlabs.lmstudio.savedState" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
