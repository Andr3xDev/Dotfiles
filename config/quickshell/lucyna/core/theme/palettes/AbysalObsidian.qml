pragma Singleton

import QtQuick

/*!
    Abysal Dark (Obsidian) — dark variant of the Abysal palette family.
*/
QtObject {
    id: palette

    readonly property string id:   "abysal-obsidian"
    readonly property string name: "Abysal Obsidian"

    readonly property QtObject tokens: QtObject {
        readonly property color bg:               "#0E161A"
        readonly property color bg_dark:           "#0A0F11"
        readonly property color bg_elevated:        "#152025"
        readonly property color bg_highlight:       "#19262C"
        readonly property color border_subtle:      "#19262C"
        readonly property color border:             "#1D2C34"
        readonly property color border_strong:      "#324A54"
        readonly property color border_emphasis:    "#516E7A"
        readonly property color fg:                 "#E3E9EB"
        readonly property color fg_secondary:       "#7A8B8E"
        readonly property color fg_muted:           "#5B6E72"
        readonly property color primary:            "#2DD4BF"
        readonly property color primary_text:       "#2DD4BF"
        readonly property color primary_anchor:     "#14B8A6"
        readonly property color primary_muted:      "#1F8F82"
        readonly property color mauve:              "#AB8AB7"
        readonly property color amber:              "#D9973A"
        readonly property color coral:              "#FF8352"
        readonly property color red:                "#FF6369"
        readonly property color red_anchor:         "#E5484D"
        readonly property color green:              "#5FD988"
        readonly property color green_anchor:       "#3DB667"
        readonly property color seafoam:            "#6EB99A"
        readonly property color blue:               "#6C93E8"
        readonly property color gold:               "#E9D568"
        readonly property color text_on_solid:      "#0C1214"
        readonly property color selection_bg:       "#17393B"
    }
    readonly property QtObject surface: QtObject {
        readonly property color primary:   palette.tokens.bg
        readonly property color secondary: palette.tokens.bg_elevated
        readonly property color overlay:   palette.tokens.bg_dark
    }
    readonly property QtObject on: QtObject {
        readonly property color surface:      palette.tokens.fg
        readonly property color surfaceMuted: palette.tokens.fg_muted
        readonly property color accent:       "#0A0F11"
    }
    readonly property color accent: palette.tokens.primary
    readonly property QtObject status: QtObject {
        readonly property color error:   palette.tokens.coral
        readonly property color warning: palette.tokens.amber
    }
    readonly property QtObject highlight: QtObject {
        readonly property color subtle: Qt.rgba(0.176, 0.831, 0.749, 0.15)  // primary #2DD4BF @ 15%
        readonly property color medium: Qt.rgba(0.176, 0.831, 0.749, 0.35)  // primary #2DD4BF @ 35%
        readonly property color strong: Qt.rgba(0.176, 0.831, 0.749, 0.6)   // primary #2DD4BF @ 60%
    }
    readonly property color border:         palette.tokens.border
    readonly property color borderSubtle:   palette.tokens.border_subtle
    readonly property color borderStrong:   palette.tokens.border_strong
    readonly property color borderEmphasis: palette.tokens.border_emphasis
    readonly property color accentMuted:    palette.tokens.primary_muted
    readonly property color detail:         palette.tokens.gold
    readonly property color detailSecondary: palette.tokens.blue
    readonly property real  barOpacity: 0.85
}
