import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../core/theme" as Theme
import "components"
import "layout"

/*!
    Bar of the system. Shows workspaces, clock, power profiles, metrics and battery.
*/
PanelWindow {
    id: bar
    anchors {
        left: true
        top: true
        right: true
    }
    margins { top: 4; left: 6; right: 6 }
    implicitHeight: 32
    color: "transparent"

    property var modelData
    screen: modelData

    Rectangle {
        anchors.fill: parent
        border.color: Theme.ThemeManager.alpha(Theme.ThemeManager.colors.borderSubtle, 0.8)
        color: Theme.ThemeManager.alpha(Theme.ThemeManager.colors.surface.primary, Theme.ThemeManager.colors.barOpacity)
        radius: Theme.ThemeManager.radius.md
        border.width: 2
    }

    // Left section
    Item {
        id: leftSection
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: Math.max(100, leftContent.implicitWidth + Theme.ThemeManager.spacing.xxl)

        RowLayout {
            id: leftContent
            anchors.fill: parent
            spacing: Theme.ThemeManager.spacing.sm

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            ArchLogo {}

            // Subtle separator
            Rectangle {
                Layout.preferredWidth: 1
                Layout.preferredHeight: parent.height * 0.7
                Layout.alignment: Qt.AlignVCenter
                color: Theme.ThemeManager.colors.on.surfaceMuted
                radius: Theme.ThemeManager.radius.full
            }

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.sm }

            Workspaces {
                screen: bar.screen
            }

            // ponytail: fillWidth claims leftSection's reserved xxl surplus deterministically —
            // without it, Qt's RowLayout redistributes unclaimed surplus proportionally across
            // ALL cells (incl. ArchLogo/separator before Workspaces), shifting them a few px
            // whenever Workspaces' preferred width changes (new workspace pill appears)
            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.sm; Layout.fillWidth: true }
        }
    }

    // Center section - Clock
    Item {
        id: centerSection
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            bottom: parent.bottom
        }
        width: clockContent.implicitWidth + Theme.ThemeManager.spacing.xxl

        RowLayout {
            id: clockContent
            anchors.centerIn: parent
            height: parent.height

            Clock {}
        }
    }

    // Right section - Metrics, Controls and Battery
    Item {
        id: rightSection
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: rightContent.implicitWidth + 2  // ponytail: fine-tuned pixel offset, not layout spacing — distinct from left/center sections' spacing.xxl padding

        RowLayout {
            id: rightContent
            anchors { fill: parent; rightMargin: 1 }  // ponytail: fine-tuned pixel offset, same reasoning as rightSection's +2 above
            spacing: Theme.ThemeManager.spacing.sm

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            PowerProfile {
                id: powerProfile
                expanded: powerToggle.expanded
            }

            ToggleIndicator {
                id: powerToggle
                icon: "󱐋"
            }

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            SystemControls {
                id: systemControls
                expanded: controlsToggle.expanded
            }

            ToggleIndicator {
                id: controlsToggle
                icon: "󰒓"
            }

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            SystemTemperatures {
                id: systemTemperatures
                expanded: tempToggle.expanded
            }

            ToggleIndicator {
                id: tempToggle
                icon: "󰔏"
            }

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            SystemMetrics {
                id: systemMetrics
                expanded: metricsToggle.expanded
            }

            ToggleIndicator {
                id: metricsToggle
                icon: "󰕮"
            }

            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.xs }

            Battery {
                id: batteryWidget
            }

            // ponytail: fillWidth claims rightContent's unclaimed 1px surplus
            // (rightSection.width = implicitWidth + 2, rightMargin 1 -> rightContent.width
            // = implicitWidth + 1) deterministically — without it, Qt's RowLayout redistributes
            // that surplus proportionally across ALL cells (incl. ones after an expanding
            // ExpandableRow that should net to zero shift), same mechanism as leftContent (obs #127)
            Item { Layout.preferredWidth: Theme.ThemeManager.spacing.sm; Layout.fillWidth: true }
        }
    }
}
