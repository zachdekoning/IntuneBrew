#!/bin/bash

# Script to generate Asana JSON

VERSION="1.0"

# Create JSON output
cat > "Apps/asana.json" << EOF
{
  "name": "Asana",
  "description": "Project management and team collaboration tool",
  "version": "$VERSION",
  "url": "https://desktop-downloads.asana.com/darwin_universal/prod/latest/Asana.dmg",
  "bundleId": "com.asana.app",
  "homepage": "https://asana.com/",
  "fileName": "Asana.dmg"
}
EOF

# Add the app to supported_apps.json if it doesn't exist
if [ -f "supported_apps.json" ]; then
    # Check if asana entry already exists
    if ! grep -q '"asana":' supported_apps.json; then
        # Remove the last closing brace, add the new entry, and close the JSON
        sed -i '$ d' supported_apps.json
        if [ "$(wc -l < supported_apps.json)" -gt 1 ]; then
            echo "    ," >> supported_apps.json
        fi
        echo '    "asana": "https://raw.githubusercontent.com/ugurkocde/IntuneBrew/main/Apps/asana.json"' >> supported_apps.json
        echo "}" >> supported_apps.json
    fi
fi

echo "Successfully updated Asana information" 