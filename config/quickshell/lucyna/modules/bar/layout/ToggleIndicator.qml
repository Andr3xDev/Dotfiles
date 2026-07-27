import QtQuick
import QtQuick.Layouts
import "../../../core/theme" as Theme
import "../../../core/components"

/*!
    Toogle sistem to hide information & show it by clicking the square with an icon
*/
Rectangle {
    id: toggleIndicator
    implicitWidth: label !== ""
        ? buttonRow.implicitWidth + (hPad * 2)
        : implicitHeight
    implicitHeight: 20
    readonly property real hPad: Theme.ThemeManager.spacing.xs

    // Visuals
    color: expanded
        ? Theme.ThemeManager.colors.accentMuted
        : "transparent"
    radius: Theme.ThemeManager.radius.sm
    border.color: Theme.ThemeManager.colors.borderEmphasis
    border.width: 1

    // Values to show
    property string icon: ""
    property string label: ""
    property bool expanded: false

    // Animation to open
    Behavior on color {
        ColorAnimation {
            duration: Theme.ThemeManager.motion.duration.standard
            easing.type: Theme.ThemeManager.motion.easing.standard
        }
    }

    RowLayout {
        id: buttonRow
        anchors.centerIn: parent
        spacing: Theme.ThemeManager.spacing.xs

        Text {
            text: icon
            color: expanded
                ? "#FFFFFF"  // ponytail: deliberately hardcoded, not theme-driven — reads legibly against accentMuted fill in both light/dark themes, unlike any semantic role tried so far
                : Theme.ThemeManager.colors.on.surface
            font.pixelSize: Theme.ThemeManager.typography.iconSize
            font.family: Theme.ThemeManager.typography.family.icons
            Layout.alignment: Qt.AlignCenter

            Behavior on color {
                ColorAnimation {
                    duration: Theme.ThemeManager.motion.duration.standard
                    easing.type: Theme.ThemeManager.motion.easing.standard
                }
            }
        }

        Text {
            visible: label !== ""
            text: label
            color: expanded
                ? Theme.ThemeManager.colors.on.accent
                : Theme.ThemeManager.colors.on.surface
            font.pixelSize: Theme.ThemeManager.typography.size.sm
            Layout.alignment: Qt.AlignCenter

            Behavior on color {
                ColorAnimation {
                    duration: Theme.ThemeManager.motion.duration.standard
                    easing.type: Theme.ThemeManager.motion.easing.standard
                }
            }
        }
    }

    HoverScale {
        anchors.fill: parent
        target: toggleIndicator
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            expanded = !expanded
        }
    }
}
