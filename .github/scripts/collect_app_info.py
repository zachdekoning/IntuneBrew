import json
import os
import requests
import re

# Array of Homebrew cask JSON URLs
homebrew_cask_urls = [
    "https://formulae.brew.sh/api/cask/google-chrome.json",
    "https://formulae.brew.sh/api/cask/zoom.json",
    "https://formulae.brew.sh/api/cask/firefox.json",
    "https://formulae.brew.sh/api/cask/slack.json",
    "https://formulae.brew.sh/api/cask/microsoft-teams.json",
    "https://formulae.brew.sh/api/cask/spotify.json",
    "https://formulae.brew.sh/api/cask/intune-company-portal.json"
]

def get_homebrew_app_info(json_url):
    response = requests.get(json_url)
    response.raise_for_status()
    data = response.json()

    bundle_id = None
    for key in ['pkgutil', 'quit', 'launchctl']:
        if key in data:
            bundle_id = data[key]
            if isinstance(bundle_id, list):
                bundle_id = bundle_id[0]
            break

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
    # Remove any characters that are not alphanumeric, space, or hyphen
    sanitized = re.sub(r'[^\w\s-]', '', name)
    # Replace spaces with underscores
    sanitized = sanitized.replace(' ', '_')
    # Convert to lowercase
    return sanitized.lower()

def main():
    apps_folder = "Apps"
    os.makedirs(apps_folder, exist_ok=True)

    for url in homebrew_cask_urls:
        try:
            app_info = get_homebrew_app_info(url)
            display_name = app_info['name']
            file_name = f"{sanitize_filename(display_name)}.json"
            file_path = os.path.join(apps_folder, file_name)

            with open(file_path, "w") as f:
                json.dump(app_info, f, indent=2)

            print(f"Saved app information for {display_name} to {file_path}")
        except Exception as e:
            print(f"Error processing {url}: {str(e)}")

if __name__ == "__main__":
    main()
