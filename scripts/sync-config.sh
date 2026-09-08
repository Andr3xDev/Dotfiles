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

# Only these dirs/files are managed by this repo — keep in sync with scripts/install-os-config.sh
MANAGED_DIRS=(btop dunst fastfetch ghostty gtk-3.0 gtk-4.0 hypr kitty kotofetch lazygit nvim nwg-look quickshell rofi satty scripts startpage swww systemd tmux xsettingsd yazi wallpapers)
MANAGED_FILES=(starship.toml)

if [[ "$1" == "pull" ]]; then
    SRC_BASE="$LIVE_CONFIG"
    DST_BASE="$REPO_CONFIG"
else
    SRC_BASE="$REPO_CONFIG"
    DST_BASE="$LIVE_CONFIG"
fi

[[ -d "$SRC_BASE" ]] || {
    echo "Error: source directory not found: $SRC_BASE" >&2
    exit 1
}

[[ -t 0 ]] || {
    echo "Error: interactive confirmation required" >&2
    exit 1
}

echo "Source:      $SRC_BASE/ (managed paths only)"
echo "Destination: $DST_BASE/"
echo "Managed dirs:  ${MANAGED_DIRS[*]}"
echo "Managed files: ${MANAGED_FILES[*]}"
echo "Warning: each managed path will exactly match source; extra files inside those paths will be deleted. Unmanaged paths are left untouched."
read -r -p "Type yes to continue: " confirmation
[[ "$confirmation" == "yes" ]] || {
    echo "Sync cancelled."
    exit 1
}

mkdir -p "$DST_BASE"

for dir in "${MANAGED_DIRS[@]}"; do
    if [[ -d "$SRC_BASE/$dir" ]]; then
        mkdir -p "$DST_BASE/$dir"
        rsync --archive --delete -- "$SRC_BASE/$dir/" "$DST_BASE/$dir/"
    fi
done

for file in "${MANAGED_FILES[@]}"; do
    if [[ -f "$SRC_BASE/$file" ]]; then
        cp -- "$SRC_BASE/$file" "$DST_BASE/$file"
    fi
done

echo "Sync complete."
