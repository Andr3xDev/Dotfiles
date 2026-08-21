<div align="center">
    <h1 align="center">HYPR - ABYSAL</h1>
    <p align="center">
        Andr3x's Hyprland dotfiles, built around the Abysal color system. Minimal, fast, and tuned for long sessions.
    </p>
    <p align="center">
        <a href="https://archlinux.org/"><img src="https://img.shields.io/badge/Arch_Linux-0E161A?style=for-the-badge&logo=arch-linux&logoColor=2DD4BF&labelColor=0E161A&color=152025" alt="Arch Linux"></a>
        <a href="https://github.com/Andr3xDev/hypr-abysal/stargazers"><img src="https://img.shields.io/github/stars/Andr3xDev/hypr-abysal?style=for-the-badge&color=152025&labelColor=0E161A" alt="Stars"></a>
        <a href="https://hyprland.org/"><img src="https://img.shields.io/badge/Hyprland-0E161A?style=for-the-badge&logo=wayland&logoColor=2DD4BF&labelColor=0E161A&color=152025" alt="Hyprland"></a>
    </p>
</div>

<br>
<br>

## About

This configuration is built for **Hyprland**, primarily targeting **Arch and Arch-based distributions** (Arch is the reference platform, and the install script only supports it). It runs a modern QuickShell status bar, stays light on resources, and ships with an automated install script for the full environment. Each piece (Hyprland config, QuickShell shell, terminal, editor setup, etc.) is a standalone dotfile, so individual components can be adapted to other distros or window managers manually; that's just outside what the automated installer covers.

The visual identity runs on **Abysal**, a personal color palette I designed and maintain across my own tools. It's not tied to this repo specifically. I keep several projects around it and I'm actively expanding it to more surfaces over time.

It defines two variants:

-   **Obsidian**: dark mode
-   **Marble**: light mode

#### Related Projects

-   **GTK / QT** (icons and extras coming soon): [Abysal Theme](https://github.com/Andr3xDev/abysal-theme)
-   **VS Code**: [Abysal Theme VS Code](https://github.com/Andr3xDev/abysal-theme-vscode)

<br>

> **⚠️ Important Note:**
> This configuration as a whole (installer + full dotfile set) is built and tested for **Arch-based distributions**. Individual pieces are plain config files, so they can be reused on other distros or compositors, but you'll need to wire them up manually, that's beyond what the installer handles.

<br>
<br>

## Gallery

Preview images will be published here once ready.

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Obsidian preview image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Marble preview image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

<details>
<summary><b>More Preview Images (click to expand)</b></summary>

### Apps

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Apps Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Apps Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### Apps 2

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Apps 2 Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Apps 2 Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### Launcher

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Launcher Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Launcher Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### Power Launcher

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Power Launcher Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Power Launcher Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### Spotify

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Spotify Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Spotify Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### Firefox

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add Firefox Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add Firefox Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

### VS Code

<table>
  <tr>
    <td width="50%" align="center">
      <!-- TODO: Add VS Code Obsidian image -->
      <br><b>Obsidian (Dark)</b>
    </td>
    <td width="50%" align="center">
      <!-- TODO: Add VS Code Marble image -->
      <br><b>Marble (Light)</b>
    </td>
  </tr>
</table>

</details>

<br>
<br>

## Tech Stack

### Core Components

| Category          | Tool                                                                     |
| ------------------ | ------------------------------------------------------------------------ |
| **Compositor**    | [Hyprland](https://hyprland.org/)                                        |
| **Bar / Shell**   | [QuickShell](https://github.com/quickshell-mirror/quickshell) (Lucyna)   |
| **Terminal**      | [Ghostty](https://ghostty.org/)                                          |
| **Shell**         | [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/)             |
| **Multiplexer**   | [tmux](https://github.com/tmux/tmux)                                     |
| **Editor**        | [Neovim](https://neovim.io/)                                             |
| **Notifications** | [Dunst](https://dunst-project.org/)                                      |
| **App Launcher**  | QuickShell Launcher                                                      |
| **Wallpaper**     | [awww](https://codeberg.org/LGFae/awww)                                                                     |
| **File Manager**  | [Yazi](https://github.com/sxyazi/yazi)                                   |
| **Browser**       | [Firefox](https://www.mozilla.org/firefox/)                              |

### System Tools

| Category            | Tools                              |
| ------------------- | ----------------------------------- |
| **Lock/Idle**       | Hyprlock, Hypridle                 |
| **Screenshots**     | Hyprshot, Grim, Slurp, Satty       |
| **Color Picker**    | Hyprpicker                         |
| **Clipboard**       | wl-clipboard, Cliphist             |
| **Audio**           | PipeWire, WirePlumber, Pavucontrol |
| **Bluetooth**       | Bluez, Bluetui                     |
| **Network**         | NetworkManager, nmtui              |
| **System Monitor**  | btop                               |
| **Fetch Tools**     | Fastfetch, Kotofetch               |
| **Display Manager** | Ly                                 |

### CLI Utilities

```
fzf, ripgrep, fd, bat, eza, lsd, tree, brightnessctl,
wl-clipboard, cliphist, unzip, 7zip
```

### Themes & Appearance

| Component         | Options                                        |
| ------------------ | ----------------------------------------------- |
| **Color Palette** | Abysal: Obsidian (Dark), Marble (Light)         |
| **Icon Theme**    | Papirus                                         |
| **Cursor Theme**  | Phinger                                         |
| **Fonts**         | JetBrains Mono Nerd Font, Font Awesome          |

### Optional Applications

**Full Installation Includes:**

-   Discord
-   Spotify + Spicetify
-   LibreOffice
-   OBS Studio
-   Steam (optional)
-   Docker (optional)

<br>
<br>

## Installation

> **💡 Recommended:** Install on a **fresh Arch Linux installation** for the best experience and to avoid conflicts with existing configurations.

### Prerequisites

You only need **Git** installed on your Arch Linux system. The installation script will handle everything else automatically.

```bash
sudo pacman -S git
```

## Quick Install

1. **Clone the repository**

```bash
git clone https://github.com/Andr3xDev/hypr-abysal.git
cd hypr-abysal
```

2. **Run the installation script**

```bash
./scripts/install.sh
```

3. **Follow the prompts**

    - Essential packages install automatically
    - Optional components (GTK themes, GPU drivers, dev tools, Spotify, Steam) ask for confirmation
    - Dotfiles are copied and Zsh is configured at the end

4. **Reboot and enjoy!**

```bash
reboot
```

After rebooting, select Hyprland from the Ly display manager.

### Manual Installation

For advanced users who want more control, read through [`scripts/install.sh`](scripts/install.sh) and run the individual steps (`install-paru.sh`, `install-gtk.sh`, `install-os-config.sh`, `install-spotify.sh`, `configure-zsh.sh`) as needed, then copy the configs manually:

```bash
git clone https://github.com/Andr3xDev/hypr-abysal.git
cd hypr-abysal

# Backup existing configs (optional)
cp -r ~/.config ~/.config.backup-$(date +%Y%m%d-%H%M%S)

# Copy dotfiles
cp -r config/* ~/.config/

sudo systemctl enable NetworkManager bluetooth
sudo reboot
```

<br>
<br>

## Keybindings

> **Note:** All keybindings are defined in [config/hypr/configs/keyblinds.lua](config/hypr/configs/keyblinds.lua)

### Essential Shortcuts

| Keybind                 | Action                    |
| ------------------------ | -------------------------- |
| `SUPER + Enter`         | Open terminal              |
| `SUPER + SHIFT + Enter` | Open terminal (tiled)      |
| `SUPER + Q`             | Close window                |
| `SUPER + SHIFT + Q`     | Kill window                 |
| `SUPER + SHIFT + F`     | Toggle fullscreen           |
| `SUPER + V`             | Toggle floating             |
| `SUPER + Space`         | QuickShell launcher          |
| `SUPER + Backspace`     | Power menu                  |
| `SUPER + R`             | Reload QuickShell             |
| `SUPER + SHIFT + R`     | Reload Hyprland              |

### Apps submap (`SUPER + A`)

| Key        | Action                          |
| ---------- | -------------------------------- |
| `E`        | File manager (Yazi)               |
| `I`        | System monitor (btop)             |
| `F`        | System fetch (Kotofetch)          |
| `B`        | Bluetooth manager (Bluetui)       |
| `N`        | Network manager (nmtui)            |
| `M`        | Monitor manager                   |
| `C`        | Clipboard history                  |
| `G`        | Calendar                           |
| `Escape` / `Return` | Exit submap              |

### Screenshots submap (`SUPER + T`)

| Key                  | Action                       |
| --------------------- | ------------------------------ |
| `T`                  | Region → clipboard              |
| `S`                  | Region → file                   |
| `E`                  | Region → edit (Satty)           |
| `P`                  | Color picker (Hyprpicker)       |
| `Escape` / `Space` / `Return` | Exit submap        |

### Window Management

| Keybind                   | Action                            |
| --------------------------- | ------------------------------------ |
| `SUPER + H/J/K/L`         | Move focus (vim-style)               |
| `SUPER + SHIFT + H/J/K/L` | Move window                          |
| `SUPER + CTRL + V`        | Enter resize submap (H/J/K/L to resize) |
| `SUPER + 0-9`             | Switch to workspace                  |
| `SUPER + SHIFT + 0-9`     | Move window to workspace             |
| `SUPER + S`               | Toggle scratchpad                     |
| `SUPER + SHIFT + S`       | Move window to scratchpad             |
| `SUPER + Tab`             | Previous workspace                    |
| `SUPER + G`               | Grab rogue windows to current workspace |
| `SUPER + CTRL + L/H`      | Swap workspace with next/prev monitor |
| `SUPER + CTRL + SHIFT + L/H` | Swap full monitor deck            |
| `SUPER + mouse:left`      | Drag window                           |
| `SUPER + mouse:right`     | Resize window                         |

### Media & Special Keys

| Keybind                 | Action              |
| ------------------------- | --------------------- |
| `XF86AudioRaiseVolume`  | Increase volume       |
| `XF86AudioLowerVolume`  | Decrease volume       |
| `XF86AudioMute`         | Toggle mute            |
| `XF86MonBrightnessUp`   | Increase brightness    |
| `XF86MonBrightnessDown` | Decrease brightness    |
| `XF86PowerOff`          | Power menu              |

<br>
<br>

## Frequently Asked Questions

<details>
<summary><b>How do I add or edit themes?</b></summary>

Theming requires changes in multiple locations:

**Config files to edit:**

-   QuickShell: [`config/quickshell/lucyna/theme/`](config/quickshell/lucyna/theme/)
-   QuickShell modules/widgets: [`config/quickshell/lucyna/`](config/quickshell/lucyna/)
-   Hyprland theme files: [`config/hypr/theme/`](config/hypr/theme/)
-   Btop, Fastfetch, Starship, Ghostty, Yazi: Respective config folders

**Scripts to modify:**

-   [`config/hypr/scripts/theme.sh`](config/hypr/scripts/theme.sh)
-   Individual theme scripts in each config directory

> 🚧 Working on reducing coupling for easier theme management.

</details>

<details>
<summary><b>Can I use these dotfiles on other distributions?</b></summary>

The full setup (installer plus the whole config set) is built and tested for **Arch-based distributions with Hyprland**. That said, every config in `config/` is a plain dotfile, so individual pieces (Ghostty, Yazi, btop, Starship, Neovim, etc.) can be copied and used on any distro or window manager, Hyprland-independent ones especially.

-   Installation script only works on Arch-based systems (uses `pacman` and `paru`)
-   Hyprland-specific configs require Wayland + Hyprland
-   Non-Hyprland-specific configs (terminal, shell, editor, CLI tools) work anywhere

**For other distros**: pick the configs you want, copy them manually, install equivalent packages yourself.

</details>

<details>
<summary><b>How do I configure brightness controls?</b></summary>

1. Find your backlight device: `ls /sys/class/backlight/`
2. Edit [`config/hypr/configs/keyblinds.lua`](config/hypr/configs/keyblinds.lua)
3. Replace `intel_backlight` with your device name

</details>

<details>
<summary><b>How extensible are these dotfiles?</b></summary>

These dotfiles are **moderately coupled** but allow extensibility:

**Easy to add:**

-   New applications, keybindings, window rules

**Requires multiple edits:**

-   New themes, bar components, theme switching

> 🚧 Working on reducing coupling for easier customization.

</details>

<details>

<summary><b>QuickShell bar is not visible</b></summary>

If the QuickShell bar does not appear, check the following:

1. **Where QuickShell starts:** The startup and configuration files are in `config/quickshell/lucyna/`.
2. **Check Hypr autostart:** Ensure `hl.exec_cmd("quickshell --config lucyna &")` is present in `config/hypr/configs/apps.lua`.
3. **Restart QuickShell:** Use `SUPER + R` or run `killall quickshell && quickshell --config lucyna &`.

</details>

<details>
<summary><b>Are these your personal dotfiles?</b></summary>

Yes! These are my daily dotfiles, shared publicly to help others.

**Keep in mind:**

-   Reflects my personal workflow and preferences
-   Some settings need hardware-specific adjustments
-   Actively being developed and improved
-   May not cover every use case

Feedback and contributions are welcome!

</details>

<br>
<br>

## Older Themes

These are previous versions of these dotfiles. I keep iterating based on personal taste, so older themes are kept as archive references and are effectively deprecated over time.

<details>
<summary><b>View Older Themes</b></summary>

### Lucy Version

> **⚠️ No longer maintained** - Available on the [`lucy`](https://github.com/Andr3xDev/hypr-abysal/tree/lucy) branch

Lucy 1.0 includes the older theme set (**Gruvbox Material** and **Rose Pine** in dark/light variants). It is preserved below for comparison with the current generation.

```bash
git clone -b lucy https://github.com/Andr3xDev/hypr-abysal.git
```

<details>
<summary><b>View Lucy Screenshots</b></summary>

### Gruvbox Material

<table>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/general/gruvbox-material-d.png" alt="Gruvbox Material Dark">
      <br><b>Dark</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/general/gruvbox-material-l.png" alt="Gruvbox Material Light">
      <br><b>Light</b>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/firefox/gruvbox-material-d.png" alt="Firefox Gruvbox Material Dark">
      <br><b>Firefox (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/firefox/gruvbox-material-l.png" alt="Firefox Gruvbox Material Light">
      <br><b>Firefox (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/apps/gruvbox-material-d.png" alt="Apps Dark">
      <br><b>System Apps (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/apps/gruvbox-material-l.png" alt="Apps Light">
      <br><b>System Apps (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/theme/gruvbox-material-d.png" alt="Theme Switcher Dark">
      <br><b>Theme Switcher (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/theme/gruvbox-material-l.png" alt="Theme Switcher Light">
      <br><b>Theme Switcher (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/yazi-btop/gruvbox-material-d.png" alt="Yazi & Btop Dark">
      <br><b>Yazi & Btop (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/yazi-btop/gruvbox-material-l.png" alt="Yazi & Btop Light">
      <br><b>Yazi & Btop (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/spotify/gruvbox-material-d.png" alt="Spotify Dark">
      <br><b>Spotify (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/spotify/gruvbox-material-l.png" alt="Spotify Light">
      <br><b>Spotify (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/vs/gruvbox-material-d.png" alt="VSCode Dark">
      <br><b>VSCode (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/vs/gruvbox-material-l.png" alt="VSCode Light">
      <br><b>VSCode (Light)</b>
    </td>
  </tr>
</table>

<br>

### Rose Pine

<table>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/general/rose-pine-d.png" alt="Rose Pine Dark">
      <br><b>Dark</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/general/rose-pine-l.png" alt="Rose Pine Light">
      <br><b>Light</b>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/firefox/rose-pine-d.png" alt="Firefox Rose Pine Dark">
      <br><b>Firefox (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/firefox/rose-pine-l.png" alt="Firefox Rose Pine Light">
      <br><b>Firefox (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/apps/rose-pine-d.png" alt="Apps Dark">
      <br><b>System Apps (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/apps/rose-pine-l.png" alt="Apps Light">
      <br><b>System Apps (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/theme/rose-pine-d.png" alt="Theme Switcher Dark">
      <br><b>Theme Switcher (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/theme/rose-pine-l.png" alt="Theme Switcher Light">
      <br><b>Theme Switcher (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/yazi-btop/rose-pine-d.png" alt="Yazi & Btop Dark">
      <br><b>Yazi & Btop (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/yazi-btop/rose-pine-l.png" alt="Yazi & Btop Light">
      <br><b>Yazi & Btop (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/spotify/rose-pine-d.png" alt="Spotify Dark">
      <br><b>Spotify (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/spotify/rose-pine-l.png" alt="Spotify Light">
      <br><b>Spotify (Light)</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/lucy/vs/rose-pine-d.png" alt="VSCode Dark">
      <br><b>VSCode (Dark)</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/lucy/vs/rose-pine-l.png" alt="VSCode Light">
      <br><b>VSCode (Light)</b>
    </td>
  </tr>
</table>

</details>

<br>

### Legacy Version

> **⚠️ No longer maintained** - Available on the [`legacy`](https://github.com/Andr3xDev/hypr-abysal/tree/legacy) branch

The legacy version uses **Waybar**. While no longer actively maintained, it remains available for those who prefer Waybar.

```bash
git clone -b legacy https://github.com/Andr3xDev/hypr-abysal.git
```

<details>
<summary><b>View Legacy Screenshots</b></summary>

<table>
  <tr>
    <td colspan="2" align="center">
      <img src="docs/legacy/home.png" alt="Legacy Home">
      <br><b>Overview</b>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td width="50%" align="center">
      <img src="docs/legacy/start.png" alt="Legacy Start">
      <br><b>Start Menu</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/legacy/systemApps.png" alt="Legacy System Apps">
      <br><b>System Apps</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/legacy/menu.png" alt="Legacy Menu">
      <br><b>Application Menu</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/legacy/nvim.png" alt="Legacy Neovim">
      <br><b>Neovim</b>
    </td>
  </tr>
  <tr>
    <td width="50%" align="center">
      <img src="docs/legacy/bSpotify.png" alt="Legacy Spotify">
      <br><b>Spotify</b>
    </td>
    <td width="50%" align="center">
      <img src="docs/legacy/close.png" alt="Legacy Close Menu">
      <br><b>Close Menu</b>
    </td>
  </tr>
</table>

</details>

</details>

<br>
<br>

## Contributing

Contributions are welcome and appreciated! Whether it's bug fixes, new features, or improvements to documentation, all help is valuable.

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Reporting Issues

If you encounter any problems:

1. Check existing [issues](https://github.com/Andr3xDev/hypr-abysal/issues) first
2. Create a new issue with:
  - Clear description of the problem
  - Steps to reproduce
  - System information (distro, hardware, etc.)
  - Relevant logs or error messages

### Code Style

-   Follow existing code style and conventions
-   Comment complex sections of code
-   Keep commits focused and atomic
-   Write clear commit messages

<br>
<br>

## License

Distributed under License. See [`LICENSE`](LICENSE) for more information.
This means you can use or modify keeping it open source.
</content>
</invoke>
