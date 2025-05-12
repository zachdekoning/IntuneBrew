#!/bin/bash

# This script performs quality assurance testing for macOS applications
# It installs the app, verifies the installation, and updates the JSON file with QA information

# Function to test an app
test_app() {
    APP_JSON_PATH="$1"

    echo "==============================================="
    echo "Processing $APP_JSON_PATH"

    # Read app details from JSON
    APP_JSON=$(cat "$APP_JSON_PATH")
    APP_NAME=$(echo "$APP_JSON" | jq -r '.name')
    APP_URL=$(echo "$APP_JSON" | jq -r '.url')
    APP_VERSION=$(echo "$APP_JSON" | jq -r '.version')
    APP_SHA=$(echo "$APP_JSON" | jq -r '.sha')
    APP_BUNDLE_ID=$(echo "$APP_JSON" | jq -r '.bundleId')

    echo "App Name: $APP_NAME"
    echo "Version: $APP_VERSION"
    echo "URL: $APP_URL"

    # Get current timestamp in ISO 8601 format
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    # Initialize QA info object as a JSON string
    QA_INFO='{"qa_timestamp":"'$TIMESTAMP'","qa_result":"pending","download_status":"pending","sha_status":"pending","install_status":"pending","verify_status":"pending","bundle_id_status":"pending"}'

    # Create a temporary directory for this app
    TEMP_DIR="temp_${APP_NAME// /_}"
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR"

    # Download with generic name first
    DOWNLOAD_PATH="downloaded_file"
    echo "📥 Downloading $APP_NAME from $APP_URL..."
    curl -L -o "$DOWNLOAD_PATH" "$APP_URL"

    if [ $? -ne 0 ]; then
        echo "❌ Failed to download file"
        QA_INFO=$(echo "$QA_INFO" | jq '.download_status = "failed" | .qa_result = "Download failed"')
        FAILED_INSTALLS+=("$APP_NAME - Download failed")
        cd ..
        rm -rf "$TEMP_DIR"

        # Update the JSON file with QA info
        jq --argjson qa_info "$QA_INFO" '.qa_info = $qa_info' "$APP_JSON_PATH" >"${APP_JSON_PATH}.tmp"
        mv "${APP_JSON_PATH}.tmp" "$APP_JSON_PATH"
        echo "CHANGES_MADE=true" >>$GITHUB_ENV
        return 1
    fi

    QA_INFO=$(echo "$QA_INFO" | jq '.download_status = "success"')
    echo "✅ Download successful"

    # Determine file type based on content
    echo "🔍 Detecting file type..."
    FILE_TYPE="unknown"

    # Check file signature/magic bytes
    FILE_INFO=$(file "$DOWNLOAD_PATH")
    echo "File info: $FILE_INFO"

    if [[ "$FILE_INFO" == *"Zip archive"* ]]; then
        FILE_TYPE="zip"
        mv "$DOWNLOAD_PATH" "app_package.zip"
        DOWNLOAD_PATH="app_package.zip"
        echo "Detected ZIP file"
    elif [[ "$FILE_INFO" == *"xar archive"* ]] || [[ "$FILE_INFO" == *"installer"* ]] || [[ "$FILE_INFO" == *"package"* ]]; then
        FILE_TYPE="pkg"
        mv "$DOWNLOAD_PATH" "app_package.pkg"
        DOWNLOAD_PATH="app_package.pkg"
        echo "Detected PKG file"
    elif [[ "$FILE_INFO" == *"disk image"* ]] || [[ "$FILE_INFO" == *"DMG"* ]]; then
        FILE_TYPE="dmg"
        mv "$DOWNLOAD_PATH" "app_package.dmg"
        DOWNLOAD_PATH="app_package.dmg"
        echo "Detected DMG file"
    else
        # Fallback to URL-based detection if content detection fails
        if [[ "$APP_URL" == *".dmg" ]]; then
            FILE_TYPE="dmg"
            mv "$DOWNLOAD_PATH" "app_package.dmg"
            DOWNLOAD_PATH="app_package.dmg"
        elif [[ "$APP_URL" == *".zip" ]]; then
            FILE_TYPE="zip"
            mv "$DOWNLOAD_PATH" "app_package.zip"
            DOWNLOAD_PATH="app_package.zip"
        elif [[ "$APP_URL" == *".pkg" ]]; then
            FILE_TYPE="pkg"
            mv "$DOWNLOAD_PATH" "app_package.pkg"
            DOWNLOAD_PATH="app_package.pkg"
        else
            # Default to pkg if we can't determine
            FILE_TYPE="pkg"
            mv "$DOWNLOAD_PATH" "app_package.pkg"
            DOWNLOAD_PATH="app_package.pkg"
        fi
        echo "Using URL-based detection: $FILE_TYPE"
    fi

    echo "File type determined: $FILE_TYPE"

    # Verify SHA256 checksum if provided
    if [ -n "$APP_SHA" ] && [ "$APP_SHA" != "null" ]; then
        echo "🔐 Verifying SHA256 checksum..."
        DOWNLOADED_SHA=$(shasum -a 256 "$DOWNLOAD_PATH" | awk '{print $1}')
        echo "Expected: $APP_SHA"
        echo "Actual: $DOWNLOADED_SHA"

        if [ "$DOWNLOADED_SHA" = "$APP_SHA" ]; then
            echo "✅ SHA256 checksum verified successfully"
            QA_INFO=$(echo "$QA_INFO" | jq '.sha_status = "verified"')
        else
            echo "❌ SHA256 checksum verification failed"
            QA_INFO=$(echo "$QA_INFO" | jq '.sha_status = "failed" | .qa_result = "SHA verification failed"')
            FAILED_INSTALLS+=("$APP_NAME - SHA verification failed")

            # Update the JSON file with QA info
            cd "$GITHUB_WORKSPACE"
            jq --argjson qa_info "$QA_INFO" '.qa_info = $qa_info' "$APP_JSON_PATH" >"${APP_JSON_PATH}.tmp"
            mv "${APP_JSON_PATH}.tmp" "$APP_JSON_PATH"
            echo "CHANGES_MADE=true" >>$GITHUB_ENV
            rm -rf "$TEMP_DIR"
            return 1
        fi
    else
        QA_INFO=$(echo "$QA_INFO" | jq '.sha_status = "not_provided"')
    fi

    # Install the app based on file type
    INSTALL_SUCCESS=false

    if [ "$FILE_TYPE" = "pkg" ]; then
        # Install PKG file
        echo "📦 Installing $APP_NAME from PKG..."
        sudo installer -pkg app_package.pkg -target /

        if [ $? -ne 0 ]; then
            echo "❌ Installation failed"
            QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "Installation failed"')
            FAILED_INSTALLS+=("$APP_NAME - Installation failed")
        else
            echo "✅ Installation successful"
            QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "success"')
            INSTALL_SUCCESS=true
        fi
    fi

    if [ "$FILE_TYPE" = "dmg" ]; then
        # Mount DMG file
        echo "� Mounting DMG file..."
        MOUNT_POINT="/Volumes/AppDMG"
        hdiutil attach -mountpoint "$MOUNT_POINT" app_package.dmg -nobrowse

        if [ $? -ne 0 ]; then
            echo "❌ Failed to mount DMG file"
            QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "Failed to mount DMG"')
            FAILED_INSTALLS+=("$APP_NAME - Failed to mount DMG")
        else
            # Find the .app file in the mounted DMG
            echo "🔍 Finding .app in DMG..."
            DMG_APP=$(find "$MOUNT_POINT" -maxdepth 1 -name "*.app" | head -1)

            if [ -z "$DMG_APP" ]; then
                echo "❌ Could not find .app file in DMG"
                QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "No .app found in DMG"')
                FAILED_INSTALLS+=("$APP_NAME - No .app found in DMG")
                hdiutil detach "$MOUNT_POINT" -force
            else
                echo "📂 Found app: $DMG_APP"

                # Copy the app to Applications folder
                echo "📋 Copying app to Applications folder..."
                cp -R "$DMG_APP" /Applications/

                if [ $? -ne 0 ]; then
                    echo "❌ Failed to copy app to Applications folder"
                    QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "Failed to copy app to Applications"')
                    FAILED_INSTALLS+=("$APP_NAME - Failed to copy app to Applications")
                else
                    echo "✅ App copied successfully"
                    QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "success"')
                    INSTALL_SUCCESS=true
                fi

                # Unmount the DMG
                echo "💿 Unmounting DMG..."
                hdiutil detach "$MOUNT_POINT" -force
            fi
        fi
    fi

    if [ "$FILE_TYPE" = "zip" ]; then
        # Extract ZIP file
        echo "📦 Extracting ZIP file..."
        EXTRACT_DIR="app_extracted"
        mkdir -p "$EXTRACT_DIR"
        unzip -q app_package.zip -d "$EXTRACT_DIR"

        if [ $? -ne 0 ]; then
            echo "❌ Failed to extract ZIP file"
            QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "Failed to extract ZIP"')
            FAILED_INSTALLS+=("$APP_NAME - Failed to extract ZIP")
        else
            # Find the .app file in the extracted contents
            echo "🔍 Finding .app in extracted contents..."
            ZIP_APP=$(find "$EXTRACT_DIR" -name "*.app" -type d | head -1)

            if [ -z "$ZIP_APP" ]; then
                echo "❌ Could not find .app file in ZIP contents"
                QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "No .app found in ZIP"')
                FAILED_INSTALLS+=("$APP_NAME - No .app found in ZIP")
                rm -rf "$EXTRACT_DIR"
            else
                echo "📂 Found app: $ZIP_APP"

                # Copy the app to Applications folder
                echo "📋 Copying app to Applications folder..."
                cp -R "$ZIP_APP" /Applications/

                if [ $? -ne 0 ]; then
                    echo "❌ Failed to copy app to Applications folder"
                    QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "failed" | .qa_result = "Failed to copy app to Applications"')
                    FAILED_INSTALLS+=("$APP_NAME - Failed to copy app to Applications")
                else
                    echo "✅ App copied successfully"
                    QA_INFO=$(echo "$QA_INFO" | jq '.install_status = "success"')
                    INSTALL_SUCCESS=true
                fi

                # Clean up extracted files
                echo "🧹 Cleaning up extracted files..."
                rm -rf "$EXTRACT_DIR"
            fi
        fi
    fi

    # Verify installation if installation was successful
    if [ "$INSTALL_SUCCESS" = true ]; then
        echo "🔍 Verifying installation..."

        # Find the app in Applications folder
        APP_PATH=""

        # Try different search strategies to find the app
        # Strategy 1: Direct match with app name
        APP_PATH=$(find /Applications -maxdepth 1 -name "*.app" | grep -i "$APP_NAME" || echo "")

        if [ -n "$APP_PATH" ]; then
            echo "Found app using direct match: $APP_NAME"
            # Verify the path exists
            if [ ! -d "$APP_PATH" ]; then
                echo "Warning: Matched path $APP_PATH does not exist, will continue searching"
                APP_PATH=""
            fi
        fi

        # Strategy 2: Try with normalized app name if Strategy 1 failed
        if [ -z "$APP_PATH" ]; then
            # Create a normalized version of the app name (lowercase, no special chars)
            NORMALIZED_APP_NAME=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr 'öäüÖÄÜ' 'oauOAU')
            echo "Normalized app name: $NORMALIZED_APP_NAME"

            # List all apps
            find /Applications -maxdepth 1 -name "*.app" >/tmp/all_apps.txt

            for APP in $(cat /tmp/all_apps.txt); do
                APP_BASENAME=$(basename "$APP" .app | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr 'öäüÖÄÜ' 'oauOAU')
                if [[ "$APP_BASENAME" == *"$NORMALIZED_APP_NAME"* ]] || [[ "$NORMALIZED_APP_NAME" == *"$APP_BASENAME"* ]]; then
                    APP_PATH="$APP"
                    echo "Found app using normalized name match: $APP_BASENAME"
                    # Verify the path exists
                    if [ ! -d "$APP_PATH" ]; then
                        echo "Warning: Matched path $APP_PATH does not exist, will continue searching"
                        APP_PATH=""
                    else
                        break
                    fi
                fi
            done
        fi

        # Strategy 3: Try with parts of the name if Strategy 2 failed
        if [ -z "$APP_PATH" ]; then
            echo "Normalized match not found, trying with parts of the name..."
            # Split app name by spaces and search for each part
            for WORD in $APP_NAME; do
                if [ ${#WORD} -gt 3 ]; then # Only use words longer than 3 characters
                    NORMALIZED_WORD=$(echo "$WORD" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr 'öäüÖÄÜ' 'oauOAU')
                    for APP in $(cat /tmp/all_apps.txt); do
                        APP_BASENAME=$(basename "$APP" .app | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr 'öäüÖÄÜ' 'oauOAU')
                        if [[ "$APP_BASENAME" == *"$NORMALIZED_WORD"* ]]; then
                            APP_PATH="$APP"
                            echo "Found app using partial word match: $WORD -> $APP_BASENAME"
                            # Verify the path exists
                            if [ ! -d "$APP_PATH" ]; then
                                echo "Warning: Matched path $APP_PATH does not exist, will continue searching"
                                APP_PATH=""
                            else
                                break 2
                            fi
                        fi
                    done
                fi
            done
        fi

        if [ -z "$APP_PATH" ]; then
            echo "⚠️ Could not find app in Applications folder"
            QA_INFO=$(echo "$QA_INFO" | jq '.verify_status = "app_not_found" | .qa_result = "App not found after installation"')
            FAILED_INSTALLS+=("$APP_NAME - App not found after installation")
        else
            echo "✅ App found at: $APP_PATH"
            QA_INFO=$(echo "$QA_INFO" | jq '.verify_status = "app_found"')

            # Verify bundle ID if provided
            if [ -n "$APP_BUNDLE_ID" ] && [ "$APP_BUNDLE_ID" != "null" ]; then
                echo "🔍 Verifying bundle ID..."

                # Method 1: Using mdls
                ACTUAL_BUNDLE_ID=$(mdls -name kMDItemCFBundleIdentifier -raw "$APP_PATH" 2>/dev/null || echo "Not found")
                echo "mdls result: $ACTUAL_BUNDLE_ID"

                # Method 2: Using PlistBuddy if Method 1 failed
                if [ "$ACTUAL_BUNDLE_ID" = "Not found" ] || [ "$ACTUAL_BUNDLE_ID" = "(null)" ]; then
                    if [ -f "$APP_PATH/Contents/Info.plist" ]; then
                        ACTUAL_BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$APP_PATH/Contents/Info.plist" 2>/dev/null || echo "Not found")
                        echo "PlistBuddy result: $ACTUAL_BUNDLE_ID"
                    fi
                fi

                # Method 3: Using defaults command if Method 2 failed
                if [ "$ACTUAL_BUNDLE_ID" = "Not found" ] || [ "$ACTUAL_BUNDLE_ID" = "(null)" ]; then
                    if [ -f "$APP_PATH/Contents/Info.plist" ]; then
                        ACTUAL_BUNDLE_ID=$(defaults read "$APP_PATH/Contents/Info" CFBundleIdentifier 2>/dev/null || echo "Not found")
                        echo "defaults command result: $ACTUAL_BUNDLE_ID"
                    fi
                fi

                if [ "$ACTUAL_BUNDLE_ID" = "Not found" ] || [ "$ACTUAL_BUNDLE_ID" = "(null)" ]; then
                    echo "⚠️ Could not extract bundle ID"
                    QA_INFO=$(echo "$QA_INFO" | jq '.bundle_id_status = "extraction_failed"')
                elif [ "$ACTUAL_BUNDLE_ID" = "$APP_BUNDLE_ID" ]; then
                    echo "✅ Bundle ID verified: $ACTUAL_BUNDLE_ID"
                    QA_INFO=$(echo "$QA_INFO" | jq '.bundle_id_status = "verified"')
                else
                    echo "⚠️ Bundle ID mismatch. Expected: $APP_BUNDLE_ID, Actual: $ACTUAL_BUNDLE_ID"
                    QA_INFO=$(echo "$QA_INFO" | jq '.bundle_id_status = "mismatch"')
                fi

                # Try to get the installed version
                echo "🔍 Extracting installed version..."
                INSTALLED_VERSION=""

                # Method 1: Using PlistBuddy
                if [ -f "$APP_PATH/Contents/Info.plist" ]; then
                    INSTALLED_VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$APP_PATH/Contents/Info.plist" 2>/dev/null || echo "")
                    if [ -z "$INSTALLED_VERSION" ]; then
                        INSTALLED_VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$APP_PATH/Contents/Info.plist" 2>/dev/null || echo "")
                    fi
                fi

                # Method 2: Using defaults command if Method 1 failed
                if [ -z "$INSTALLED_VERSION" ] && [ -f "$APP_PATH/Contents/Info.plist" ]; then
                    INSTALLED_VERSION=$(defaults read "$APP_PATH/Contents/Info" CFBundleShortVersionString 2>/dev/null || echo "")
                    if [ -z "$INSTALLED_VERSION" ]; then
                        INSTALLED_VERSION=$(defaults read "$APP_PATH/Contents/Info" CFBundleVersion 2>/dev/null || echo "")
                    fi
                fi

                if [ -n "$INSTALLED_VERSION" ]; then
                    echo "📊 Installed version: $INSTALLED_VERSION"
                    QA_INFO=$(echo "$QA_INFO" | jq --arg ver "$INSTALLED_VERSION" '.installed_version = $ver')

                    # Compare with expected version
                    if [ "$INSTALLED_VERSION" = "$APP_VERSION" ]; then
                        echo "✅ Version matches expected: $INSTALLED_VERSION"
                    else
                        echo "⚠️ Version mismatch. Expected: $APP_VERSION, Actual: $INSTALLED_VERSION"
                    fi
                else
                    echo "⚠️ Could not extract installed version"
                fi
            else
                QA_INFO=$(echo "$QA_INFO" | jq '.bundle_id_status = "not_provided"')
            fi

            # Set overall QA result
            QA_INFO=$(echo "$QA_INFO" | jq '.qa_result = "Installation successful and verified"')
            SUCCESSFUL_INSTALLS+=("$APP_NAME")
        fi
    fi

    # Update the JSON file with QA info
    cd "$GITHUB_WORKSPACE"
    jq --argjson qa_info "$QA_INFO" '.qa_info = $qa_info' "$APP_JSON_PATH" >"${APP_JSON_PATH}.tmp"
    mv "${APP_JSON_PATH}.tmp" "$APP_JSON_PATH"
    echo "CHANGES_MADE=true" >>$GITHUB_ENV

    # Clean up the temporary directory
    rm -rf "$TEMP_DIR"

    echo "==============================================="
    return 0
}

# Main script

# Initialize arrays for summary
SUCCESSFUL_INSTALLS=()
FAILED_INSTALLS=()

# Process each app from the file
while IFS= read -r APP_JSON_PATH || [ -n "$APP_JSON_PATH" ]; do
    test_app "$APP_JSON_PATH"
done </tmp/apps_to_test.txt

# Save the lists to environment variables for the summary step
echo "SUCCESSFUL_INSTALLS_COUNT=${#SUCCESSFUL_INSTALLS[@]}" >>$GITHUB_ENV
echo "FAILED_INSTALLS_COUNT=${#FAILED_INSTALLS[@]}" >>$GITHUB_ENV

# Save successful installs to a file for the summary step
if [ ${#SUCCESSFUL_INSTALLS[@]} -gt 0 ]; then
    printf "%s\n" "${SUCCESSFUL_INSTALLS[@]}" >/tmp/successful_installs.txt
fi

# Save failed installs to a file for the summary step
if [ ${#FAILED_INSTALLS[@]} -gt 0 ]; then
    printf "%s\n" "${FAILED_INSTALLS[@]}" >/tmp/failed_installs.txt
fi
