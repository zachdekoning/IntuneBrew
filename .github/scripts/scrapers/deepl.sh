#!/bin/bash

# Script to generate DeepL JSON

VERSION="1.0"

# Create JSON output
cat > "Apps/deepl.json" << EOF
{
  "name": "DeepL",
  "description": "AI-powered language translator",
  "version": "$VERSION",
  "url": "https://www.deepl.com/macos/download/bigsur/DeepL.dmg",
  "bundleId": "com.linguee.DeepLCopyTranslator",
  "homepage": "https://www.deepl.com/",
  "fileName": "DeepL.dmg"
}
EOF

# Add the app to supported_apps.json if it doesn't exist
if [ -f "supported_apps.json" ]; then
    # Check if deepl entry already exists
    if ! grep -q '"deepl":' supported_apps.json; then
        # Remove the last closing brace, add the new entry, and close the JSON
        sed -i '$ d' supported_apps.json
        if [ "$(wc -l < supported_apps.json)" -gt 1 ]; then
            echo "    ," >> supported_apps.json
        fi
        echo '    "deepl": "https://raw.githubusercontent.com/ugurkocde/IntuneBrew/main/Apps/deepl.json"' >> supported_apps.json
        echo "}" >> supported_apps.json
    fi
fi

echo "Successfully updated DeepL information" 