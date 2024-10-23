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
    "https://formulae.brew.sh/api/cask/intune-company-portal.json",
    "https://formulae.brew.sh/api/cask/1password.json",
    "https://formulae.brew.sh/api/cask/notion.json",
    "https://formulae.brew.sh/api/cask/vlc.json",
    "https://formulae.brew.sh/api/cask/adobe-acrobat-reader.json",
    "https://formulae.brew.sh/api/cask/visual-studio-code.json"
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
