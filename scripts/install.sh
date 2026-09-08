#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh" || { echo "Error: common.sh not found"; exit 1; }

# Create temporary directory in HOME
export HYPRPHARCH_TEMP="$HOME/.cache/hyprpharch-install-$$"
mkdir -p "$HYPRPHARCH_TEMP"

# Cleanup on exit
trap "rm -rf '$HYPRPHARCH_TEMP'" EXIT INT TERM

# Main installation
main_installation() {
    print_banner "HyprPharch Installer"
    echo "This will install the minimal Hyprland desktop setup."
    echo "Personal setup (dev tools, GPU drivers, personal apps) is optional."
    echo

    bash "$SCRIPT_DIR/install-minimal.sh"

    if ask "Install personal setup (dev tools, GPU drivers, personal apps)?"; then
        bash "$SCRIPT_DIR/install-personal.sh"
    fi

    echo
    print_success "╔════════════════════════════════════════╗"
    print_success "║  Installation completed!               ║"
    print_success "╚════════════════════════════════════════╝"
    print_warning "Restart your system to apply all changes"
}

main_installation
