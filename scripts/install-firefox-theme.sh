#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh" || { echo "Error: common.sh not found"; exit 1; }

print_banner "Installing Firefox Theme"

PROFILES_INI="$HOME/.mozilla/firefox/profiles.ini"

if [ ! -f "$PROFILES_INI" ]; then
    print_warning "Firefox profiles.ini not found at $PROFILES_INI"
    print_warning "Launch Firefox at least once to create a profile, then re-run this script."
    exit 1
fi

# Prefer the profile marked Default=1, fall back to the first Path found
PROFILE_PATH=$(awk -F= '/^Path=/{p=$2} /^Default=1/{print p; exit}' "$PROFILES_INI")

if [ -z "$PROFILE_PATH" ]; then
    PROFILE_PATH=$(awk -F= '/^Path=/{print $2; exit}' "$PROFILES_INI")
fi

if [ -z "$PROFILE_PATH" ]; then
    print_warning "Could not determine a Firefox profile from profiles.ini"
    exit 1
fi

PROFILE_DIR="$HOME/.mozilla/firefox/$PROFILE_PATH"
CHROME_DIR="$PROFILE_DIR/chrome"

if [ ! -d "$PROFILE_DIR" ]; then
    print_warning "Profile directory not found: $PROFILE_DIR"
    exit 1
fi

print_message "Using Firefox profile: $PROFILE_PATH"

mkdir -p "$CHROME_DIR"
cp "$PROJECT_ROOT/firefox/userChrome.css" "$CHROME_DIR/userChrome.css"
cp "$PROJECT_ROOT/firefox/userContent.css" "$CHROME_DIR/userContent.css"

USER_JS="$PROFILE_DIR/user.js"
PREF_LINE='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'

if [ -f "$USER_JS" ] && grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$USER_JS"; then
    sed -i "s/user_pref(\"toolkit.legacyUserProfileCustomizations.stylesheets\".*/${PREF_LINE}/" "$USER_JS"
else
    echo "$PREF_LINE" >> "$USER_JS"
fi

print_success "Firefox theme installed"
print_warning "Restart Firefox for changes to take effect"
