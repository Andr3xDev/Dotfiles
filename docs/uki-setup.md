# Unified Kernel Image (UKI) Setup — systemd-boot + dual kernel + hybrid GPU

Personal reference for setting up Unified Kernel Images with systemd-boot, dual kernel (`linux` + `linux-zen`), and hybrid Intel/NVIDIA graphics (Optimus-style laptop).

## Prerequisites

- systemd-boot already installed as bootloader (`bootctl install`)
- EFI partition mounted (commonly at `/efi`)
- `linux-zen` + `linux-zen-headers` installed (optional block in `scripts/install-personal.sh`)
- nvidia-open-dkms + nvidia-utils + lib32-nvidia-utils + libva-nvidia-driver + lib32-mesa installed (GPU driver block in scripts/install-personal.sh — nvidia-open-dkms chosen over classic nvidia-dkms: NVIDIA officially recommends open kernel modules for Turing-and-later GPUs, and the -dkms variant is required specifically because this setup dual-boots linux + linux-zen — a plain nvidia-open build only targets one kernel ABI)

## 1. Install systemd-ukify

```bash
sudo pacman -S systemd-ukify
```

## 2. Configure mkinitcpio presets per kernel

Edit `/etc/mkinitcpio.d/linux.preset` and `/etc/mkinitcpio.d/linux-zen.preset`: comment out the `*_image` lines, uncomment the `*_uki` lines, with kernel-specific names to avoid collisions.

`linux.preset`:
```
default_uki="/efi/EFI/Linux/arch-linux.efi"
fallback_uki="/efi/EFI/Linux/arch-linux-fallback.efi"
```

`linux-zen.preset`:
```
default_uki="/efi/EFI/Linux/arch-linux-zen.efi"
fallback_uki="/efi/EFI/Linux/arch-linux-zen-fallback.efi"
```

## 3. Create the EFI target directory

```bash
mkdir -p /efi/EFI/Linux
```

## 4. Early-KMS modules for hybrid Intel + NVIDIA graphics

In `/etc/mkinitcpio.conf`:

```
MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

`i915` loads first so the Intel iGPU (usually the internal/eDP display) gets early KMS without a boot-time flicker. The four `nvidia*` modules cover the discrete GPU. This order is correct for both PRIME render-offload setups and setups where the NVIDIA GPU drives external displays directly — no further changes needed for either mode.

## 5. Kernel command line — nvidia_drm.modeset=1

Modern nvidia-utils (560.35.03-5+) sets `nvidia_drm.modeset=1` by default via its own `/usr/lib/modprobe.d/` file — this is **not strictly mandatory anymore** on a current install. Setting it explicitly via the kernel command line is still worth doing with a UKI setup: it guarantees the option applies at the earliest possible boot stage (before the module-level modprobe.d config would take effect), avoiding any flicker/tty-to-Wayland transition edge cases.

Create `/etc/kernel/cmdline`:
```
nvidia_drm.modeset=1
```

Point each kernel preset at it — in both `/etc/mkinitcpio.d/linux.preset` and `linux-zen.preset`, add:
```
default_options="--cmdline /etc/kernel/cmdline"
```

## 6. Confirm the pacman hook regenerates the UKI on driver/kernel updates

`nvidia-dkms`/`nvidia-utils` ship a pacman hook that should trigger a rebuild on updates. With UKI, the initramfs is embedded IN the `.efi` binary — so any module/config change means the `.efi` itself must be regenerated, not just a loose initramfs file. Verify a hook exists under `/etc/pacman.d/hooks/` (or the package-provided one) that runs `mkinitcpio -P` (not just `-p linux`) after nvidia/kernel/microcode updates. If boot ever breaks right after an update, suspect a hook that didn't fire first.

## 7. Generate the UKIs

```bash
sudo mkinitcpio -P
```

This produces 4 `.efi` files: `arch-linux.efi`, `arch-linux-fallback.efi`, `arch-linux-zen.efi`, `arch-linux-zen-fallback.efi`.

## 8. Clean up leftovers from a classic (non-UKI) setup

Remove any stale `initramfs-*.img` / `vmlinuz-*` sitting loose in `/boot` or `/efi` from a previous non-UKI setup, so the bootloader doesn't get confused by orphaned files.

## 9. systemd-boot picks up UKIs automatically

systemd-boot scans `/efi/EFI/Linux/` directly — no manual entries needed under `loader/entries/`. Set the default kernel in `/efi/loader/loader.conf`:

```
default arch-linux.efi
```

(or `arch-linux-zen.efi` to boot into zen by default)

## 10. Verify

```bash
sudo bootctl install   # if not already done
sudo bootctl status
cat /sys/module/nvidia_drm/parameters/modeset   # should print Y
hyprctl monitors                                 # confirms both GPUs/outputs respond
```

Reboot and confirm both kernel entries show up in the systemd-boot menu.

## Gotchas

- Any kernel, NVIDIA driver, or microcode (`intel-ucode`) update changes initramfs contents — the `.efi` MUST be regenerated (`mkinitcpio -P`), unlike classic setups where the loader just picks up a new initramfs file automatically. If something fails to boot right after an update, this is the first thing to check.
- Keep `default_uki`/`fallback_uki` names distinct per kernel (`arch-linux*` vs `arch-linux-zen*`) or one will silently overwrite the other.
- Secure Boot (if enabled): a UKI with an embedded `.cmdline` ignores kernel command-line args passed at the bootloader level — pass any needed params via the preset's `.cmdline` file instead.
- Laptop suspend/resume: this repo's scripts/enable-services.sh enables nvidia-suspend.service, nvidia-hibernate.service, and nvidia-resume.service automatically when nvidia-open-dkms is installed — needed to avoid black-screen-after-resume issues common with NVIDIA laptops.

## Hyprland env vars for NVIDIA

Already set in `config/hypr/configs/env_variables.lua`:
```lua
hl.env("NVD_BACKEND",               "direct")
hl.env("LIBVA_DRIVER_NAME",         "iHD")        -- VA-API decode via Intel iGPU (power efficient), intentional
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND",               "nvidia-drm")  -- buffer allocation for NVIDIA + wlroots
```

Only add if needed (cursor rendering artifacts/invisible cursor with NVIDIA + wlroots):
```lua
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
```
Not added by default — genuinely conditional, only needed on some driver/hardware combos.

## Contingency — GSP firmware issues

If you hit a black screen / GPU not detected after a driver update (some laptop chips have known GSP firmware quirks), do NOT act on this preemptively — only if boot actually breaks:

1. Fall back to the legacy branch package (check current AUR name/version, it changes — search "nvidia-dkms" legacy branch AUR at the time of the issue)
2. Add to `/etc/modprobe.d/nvidia.conf`:
   ```
   options nvidia NVreg_EnableGpuFirmware=0
   ```
3. Regenerate UKIs (`sudo mkinitcpio -P`) and reboot

## References

- [Unified kernel image - ArchWiki](https://wiki.archlinux.org/title/Unified_kernel_image)
- [NVIDIA - ArchWiki](https://wiki.archlinux.org/title/NVIDIA)
- [systemd-boot - ArchWiki](https://wiki.archlinux.org/title/Systemd-boot)
