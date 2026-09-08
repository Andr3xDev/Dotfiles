# Firefox Theme (userChrome.css / userContent.css)

This repo ships a custom Firefox UI theme at `firefox/userChrome.css` and `firefox/userContent.css` — centered navbar, vertical tabs styling, monospace font, hidden scrollbar, and several hidden toolbar buttons.

Firefox does NOT read these from `~/.config` — they live inside the Firefox profile directory (`~/.mozilla/firefox/<profile>/chrome/`), which is why this needed its own dedicated installer separate from the rest of the dotfile sync.

## Install

```bash
./scripts/install-firefox-theme.sh
```

Also available as an optional prompt inside `./scripts/install-minimal.sh` ("Install custom Firefox theme (userChrome.css)?").

What it does:
1. Reads `~/.mozilla/firefox/profiles.ini` to find your default profile (falls back to the first profile listed if none is marked `Default=1`)
2. Copies `firefox/userChrome.css` and `firefox/userContent.css` into `<profile>/chrome/`
3. Sets `user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);` in `<profile>/user.js` — without this pref, Firefox ignores userChrome.css/userContent.css entirely, no matter how the files are

## Requirements

- Firefox must have been launched at least once (so `profiles.ini` and a profile directory exist) before running the script
- Restart Firefox after running the script for changes to apply

## Reapplying after editing the theme

If you edit `firefox/userChrome.css` or `firefox/userContent.css` in the repo, just re-run the script — it overwrites the deployed copies. Firefox picks up userChrome.css/userContent.css changes on next restart (no live reload).

## Multiple profiles

The script only targets the default profile. If you use multiple Firefox profiles and want the theme on a non-default one, copy the two files manually into that profile's `chrome/` folder and set the same pref in its `user.js`.

## Troubleshooting

- **Theme not applying after restart**: confirm the pref actually landed — check `<profile>/user.js` for the `toolkit.legacyUserProfileCustomizations.stylesheets` line, or check `about:config` in Firefox directly.
- **"profiles.ini not found" error**: launch Firefox once first to create a profile, then re-run the script.
- **Wrong profile targeted**: check `~/.mozilla/firefox/profiles.ini` for which profile has `Default=1` — if none does, the script uses whichever profile is listed first, which may not be the one you use daily.
</content>
</invoke>
