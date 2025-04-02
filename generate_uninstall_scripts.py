#!/usr/bin/env python3
import json
import os
import requests
import re
from pathlib import Path
import sys

# Create Uninstall Scripts directory if it doesn't exist
uninstall_dir = "Uninstall Scripts"
os.makedirs(uninstall_dir, exist_ok=True)

def get_brew_app_info(app_name):
    """Fetch application information from brew.sh API"""
    # Convert app name to brew.sh format (lowercase, hyphens instead of spaces)
    brew_name = app_name.lower().replace(' ', '-')
    json_url = f"https://formulae.brew.sh/api/cask/{brew_name}.json"
    
    print(f"Fetching information for {app_name} from {json_url}")
    try:
        response = requests.get(json_url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {json_url}: {str(e)}")
        # Try alternative URL formats
        alternative_formats = [
            f"https://formulae.brew.sh/api/cask/{brew_name.replace('-', '')}.json",
            f"https://formulae.brew.sh/api/cask/{brew_name.replace('-', '_')}.json"
        ]
        
        for alt_url in alternative_formats:
            try:
                print(f"Trying alternative URL: {alt_url}")
                response = requests.get(alt_url)
                response.raise_for_status()
                return response.json()
            except requests.exceptions.RequestException:
                continue
        
        print(f"Could not find brew.sh data for {app_name}")
        return None

def extract_uninstall_paths(app_data):
    """Extract paths that need to be removed during uninstallation directly from brew.sh data"""
    uninstall_paths = []
    
    # Extract app bundle path from artifacts
    if "artifacts" in app_data:
        for artifact in app_data["artifacts"]:
            # Handle string artifacts (usually .app files)
            if isinstance(artifact, str) and artifact.endswith(".app"):
                uninstall_paths.append(f"/Applications/{artifact}")
            
            # Handle dictionary artifacts
            elif isinstance(artifact, dict):
                # Handle app artifacts
                if "app" in artifact:
                    app_path = artifact["app"]
                    if isinstance(app_path, list):
                        for app in app_path:
                            uninstall_paths.append(f"/Applications/{app}")
                    else:
                        uninstall_paths.append(f"/Applications/{app_path}")
                
                # Handle zap artifacts (most important for cleanup)
                if "zap" in artifact:
                    zap_data = artifact["zap"]
                    if isinstance(zap_data, list):
                        for zap_item in zap_data:
                            # Handle trash paths
                            if isinstance(zap_item, dict) and "trash" in zap_item:
                                trash_paths = zap_item["trash"]
                                if isinstance(trash_paths, list):
                                    for path in trash_paths:
                                        uninstall_paths.append(path)
                                else:
                                    uninstall_paths.append(trash_paths)
                            
                            # Handle delete paths
                            if isinstance(zap_item, dict) and "delete" in zap_item:
                                delete_paths = zap_item["delete"]
                                if isinstance(delete_paths, list):
                                    for path in delete_paths:
                                        uninstall_paths.append(path)
                                else:
                                    uninstall_paths.append(delete_paths)
                            
                            # Handle rmdir paths
                            if isinstance(zap_item, dict) and "rmdir" in zap_item:
                                rmdir_paths = zap_item["rmdir"]
                                if isinstance(rmdir_paths, list):
                                    for path in rmdir_paths:
                                        uninstall_paths.append(path)
                                else:
                                    uninstall_paths.append(rmdir_paths)
                            
                            # Handle signal paths
                            if isinstance(zap_item, dict) and "signal" in zap_item:
                                signal_data = zap_item["signal"]
                                if isinstance(signal_data, dict):
                                    for signal_app, _ in signal_data.items():
                                        uninstall_paths.append(f"SIGNAL:{signal_app}")
    
    # Extract pkgutil IDs
    if "pkgutil" in app_data:
        pkgutil_ids = app_data["pkgutil"]
        if isinstance(pkgutil_ids, list):
            for pkg_id in pkgutil_ids:
                uninstall_paths.append(f"PKGUTIL:{pkg_id}")
        else:
            uninstall_paths.append(f"PKGUTIL:{pkgutil_ids}")
    
    # Extract launchctl services
    if "launchctl" in app_data:
        launchctl_services = app_data["launchctl"]
        if isinstance(launchctl_services, list):
            for service in launchctl_services:
                uninstall_paths.append(f"LAUNCHCTL:{service}")
        else:
            uninstall_paths.append(f"LAUNCHCTL:{launchctl_services}")
    
    # Extract quit IDs (bundle IDs)
    if "quit" in app_data:
        quit_ids = app_data["quit"]
        if isinstance(quit_ids, list):
            for quit_id in quit_ids:
                uninstall_paths.append(f"BUNDLE:{quit_id}")
        else:
            uninstall_paths.append(f"BUNDLE:{quit_ids}")
    
    return uninstall_paths

def generate_uninstall_script(app_name, uninstall_paths):
    """Generate a shell script to uninstall the application"""
    script_content = f"""#!/bin/bash
# Uninstall script for {app_name}
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling {app_name}..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping {app_name} if running..."
pkill -f "{app_name}" 2>/dev/null || true
"""

    # Add commands to remove files and directories
    for path in uninstall_paths:
        if path.startswith("PKGUTIL:"):
            pkg_id = path.replace("PKGUTIL:", "")
            script_content += f"""
# Remove package {pkg_id}
echo "Removing package {pkg_id}..."
pkgutil --forget {pkg_id} 2>/dev/null || true
"""
        elif path.startswith("LAUNCHCTL:"):
            service = path.replace("LAUNCHCTL:", "")
            script_content += f"""
# Unload service {service}
echo "Unloading service {service}..."
launchctl unload -w /Library/LaunchAgents/{service}.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/{service}.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/{service}.plist 2>/dev/null || true
"""
        elif path.startswith("BUNDLE:"):
            # Handle bundle IDs for killing applications
            bundle_id = path.replace("BUNDLE:", "")
            script_content += f"""
# Kill application with bundle ID {bundle_id} if running
echo "Stopping application with bundle ID {bundle_id} if running..."
killall -9 "{bundle_id}" 2>/dev/null || true
"""
        elif path.startswith("SIGNAL:"):
            # Handle signal paths (usually for killing processes)
            app_to_signal = path.replace("SIGNAL:", "")
            script_content += f"""
# Kill application {app_to_signal} if running
echo "Stopping application {app_to_signal} if running..."
killall -9 "{app_to_signal}" 2>/dev/null || true
"""
        elif path.startswith("SIGNAL:"):
            # Handle signal paths (usually for killing processes)
            app_to_signal = path.replace("SIGNAL:", "")
            script_content += f"""
# Kill application {app_to_signal} if running
echo "Stopping application {app_to_signal} if running..."
killall -9 "{app_to_signal}" 2>/dev/null || true
"""
        else:
            # Expand ~ to $HOME
            if path.startswith("~"):
                path = "$HOME" + path[1:]
            
            script_content += f"""
# Remove {path}
echo "Removing {path}..."
if [ -d "{path}" ]; then
    rm -rf "{path}" 2>/dev/null || true
elif [ -f "{path}" ]; then
    rm -f "{path}" 2>/dev/null || true
fi
"""

    script_content += """
echo "Uninstallation complete!"
exit 0
"""
    return script_content

def sanitize_filename(name):
    """Sanitize the application name for use as a filename"""
    sanitized = name.replace(' ', '_')
    sanitized = re.sub(r'[^\w_]', '', sanitized)
    return sanitized.lower()

def main():
    # Get all app.json files from the Apps directory
    apps_dir = Path("Apps")
    app_files = list(apps_dir.glob("*.json"))
    
    print(f"Generating uninstall scripts for {len(app_files)} applications...")
    
    for app_file in app_files:
        try:
            # Read the local app.json file
            with open(app_file, 'r') as f:
                local_app_data = json.load(f)
            
            app_name = local_app_data["name"]
            
            # Get application data from brew.sh
            brew_app_data = get_brew_app_info(app_name)
            
            if not brew_app_data:
                print(f"Warning: Could not fetch brew.sh data for {app_name}")
                continue
            
            # Extract paths to remove during uninstallation
            uninstall_paths = extract_uninstall_paths(brew_app_data)
            
            if not uninstall_paths:
                print(f"Warning: No uninstall paths found for {app_name}")
                continue
            
            # Generate uninstall script
            script_content = generate_uninstall_script(app_name, uninstall_paths)
            
            # Save script to file
            script_filename = f"uninstall_{sanitize_filename(app_name)}.sh"
            script_path = os.path.join(uninstall_dir, script_filename)
            
            with open(script_path, "w", newline="\n") as f:
                f.write(script_content)
            
            # Make script executable
            os.chmod(script_path, 0o755)
            
            print(f"Created uninstall script for {app_name}: {script_path}")
            
        except Exception as e:
            print(f"Error processing {app_file}: {str(e)}")
    
    print(f"Uninstall scripts generated in '{uninstall_dir}' directory")

if __name__ == "__main__":
    main()