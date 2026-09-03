#!/bin/bash

set -euo pipefail

usage() {
    echo "Usage: $0 pull|push" >&2
    exit 1
}

[[ $# -eq 1 ]] || usage
[[ "$1" == "pull" || "$1" == "push" ]] || usage

command -v rsync >/dev/null 2>&1 || {
    echo "Error: rsync is required" >&2
    exit 1
}

[[ -n "${HOME:-}" && -d "$HOME" ]] || {
    echo "Error: HOME must name an existing directory" >&2
    exit 1
}

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"
REPO_CONFIG="$(cd -- "$REPO_ROOT/config" 2>/dev/null && pwd -P)" || {
    echo "Error: managed config directory not found: $REPO_ROOT/config" >&2
    exit 1
}
HOME_DIR="$(cd -- "$HOME" && pwd -P)"
LIVE_CONFIG="$HOME_DIR/.config"

if [[ -e "$LIVE_CONFIG" || -L "$LIVE_CONFIG" ]]; then
    LIVE_CONFIG="$(cd -- "$LIVE_CONFIG" 2>/dev/null && pwd -P)" || {
        echo "Error: live config path must be a directory: $LIVE_CONFIG" >&2
        exit 1
    }
fi

[[ "$REPO_CONFIG" != "$LIVE_CONFIG" ]] || {
    echo "Error: source and destination resolve to same directory" >&2
    exit 1
}

if [[ "$1" == "pull" ]]; then
    SOURCE="$LIVE_CONFIG"
    DESTINATION="$REPO_CONFIG"
else
    SOURCE="$REPO_CONFIG"
    DESTINATION="$LIVE_CONFIG"
fi

[[ -d "$SOURCE" ]] || {
    echo "Error: source directory not found: $SOURCE" >&2
    exit 1
}

[[ -t 0 ]] || {
    echo "Error: interactive confirmation required" >&2
    exit 1
}

echo "Source:      $SOURCE/"
echo "Destination: $DESTINATION/"
echo "Warning: destination will exactly match source; extra files will be deleted."
read -r -p "Type yes to continue: " confirmation
[[ "$confirmation" == "yes" ]] || {
    echo "Sync cancelled."
    exit 1
}

rsync --archive --delete -- "$SOURCE/" "$DESTINATION/"
