import json
import os
import requests
import re
import fileinput
from pathlib import Path

# Array of Homebrew cask JSON URLs
homebrew_cask_urls = [
    "https://formulae.brew.sh/api/cask/google-chrome.json",
    "https://formulae.brew.sh/api/cask/zoom.json",
    "https://formulae.brew.sh/api/cask/firefox.json",
    "https://formulae.brew.sh/api/cask/slack.json",
    "https://formulae.brew.sh/api/cask/microsoft-teams.json",
    "https://formulae.brew.sh/api/cask/spotify.json",
    "https://formulae.brew.sh/api/cask/intune-company-portal.json",
    "https://formulae.brew.sh/api/cask/adobe-acrobat-reader.json",
    "https://formulae.brew.sh/api/cask/windows-app.json",
    "https://formulae.brew.sh/api/cask/parallels.json",
    "https://formulae.brew.sh/api/cask/keepassxc.json",
    "https://formulae.brew.sh/api/cask/synology-drive.json"
    ]

def find_bundle_id(json_string):
    regex_patterns = {
        'pkgutil': r'(?s)"pkgutil"\s*:\s*(?:\[\s*"([^"]+)"(?:,\s*"([^"]+)")?\s*\]|\s*"([^"]+)")',
        'quit': r'(?s)"quit"\s*:\s*(?:\[\s*"([^"]+)"(?:,\s*"([^"]+)")?\s*\]|\s*"([^"]+)")',
        'launchctl': r'(?s)"launchctl"\s*:\s*(?:\[\s*"([^"]+)"(?:,\s*"([^"]+)")?\s*\]|\s*"([^"]+)")'
    }

    for key, pattern in regex_patterns.items():
        match = re.search(pattern, json_string)
        if match:
            if match.group(1):
                return match.group(1)
            elif match.group(3):
                return match.group(3)

    return None

def get_homebrew_app_info(json_url):
    response = requests.get(json_url)
    response.raise_for_status()
    data = response.json()
    json_string = json.dumps(data)

    bundle_id = find_bundle_id(json_string)

    return {
        "name": data["name"][0],
        "description": data["desc"],
        "version": data["version"],
        "url": data["url"],
        "bundleId": bundle_id,
        "homepage": data["homepage"],
        "fileName": os.path.basename(data["url"])
    }

def sanitize_filename(name):
    sanitized = re.sub(r'[^\w\s-]', '', name)
    sanitized = sanitized.replace(' ', '_')
    return sanitized.lower()

def update_readme_apps(apps_list):
    readme_path = Path(__file__).parent.parent.parent / "README.md"
    if not readme_path.exists():
        print("README.md not found")
        return

    print(f"Updating README at: {readme_path}")
    print(f"Apps to add: {sorted(apps_list)}")

    # Read the entire README
    with open(readme_path, 'r') as f:
        content = f.read()

    # Find the supported applications section
    start_marker = "Currently supported applications include:"
    end_marker = "> [!NOTE]"
    
    start_idx = content.find(start_marker)
    end_idx = content.find(end_marker)
    
    if start_idx == -1 or end_idx == -1:
        print("Couldn't find the markers in README.md")
        print(f"Start marker found: {start_idx != -1}")
        print(f"End marker found: {end_idx != -1}")
        return

    # Format the new apps list
    apps_list_formatted = "\n".join(f"- {app}" for app in sorted(apps_list))
    
    # Construct the new content
    new_content = (
        content[:start_idx + len(start_marker)] +
        "\n" + apps_list_formatted + "\n\n" +
        content[end_idx:]
    )

    # Write the updated content back to README.md
    with open(readme_path, 'w') as f:
        f.write(new_content)
    print("README.md has been updated")

def main():
    apps_folder = "Apps"
    os.makedirs(apps_folder, exist_ok=True)
    
    # List to store app display names
    supported_apps = []

    for url in homebrew_cask_urls:
        try:
            app_info = get_homebrew_app_info(url)
            display_name = app_info['name']
            supported_apps.append(display_name)
            file_name = f"{sanitize_filename(display_name)}.json"
            file_path = os.path.join(apps_folder, file_name)

            # Check if file exists and read existing bundle ID
            if os.path.exists(file_path):
                with open(file_path, "r") as f:
                    existing_data = json.load(f)
                    if existing_data.get("bundleId") and app_info["bundleId"] is None:
                        app_info["bundleId"] = existing_data["bundleId"]

            with open(file_path, "w") as f:
                json.dump(app_info, f, indent=2)

            print(f"Saved app information for {display_name} to {file_path}")
        except Exception as e:
            print(f"Error processing {url}: {str(e)}")

    # Update the README with the current list of supported apps
    update_readme_apps(supported_apps)

if __name__ == "__main__":
    main()
