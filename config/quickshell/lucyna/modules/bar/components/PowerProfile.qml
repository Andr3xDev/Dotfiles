import QtQuick
import QtQuick.Layouts
import "../../../core/theme" as Theme
import "../../../core/services" as Services
import "../../../core/components"

/*!
    Power profile selector component to set different profiles
*/
ExpandableRow {
    id: root

    // Profile color mapping
    readonly property var profileColors: ({
        "power-saver": Theme.ThemeManager.colors.detailSecondary,
        "balanced": Theme.ThemeManager.colors.status.warning,
        "performance": Theme.ThemeManager.colors.status.error
    })
    
    RowLayout {
        id: profileRow
        anchors.centerIn: parent
        spacing: 15  // ponytail: intentionally a raw literal, mirrors the known-good reference implementation exactly — do not migrate to a spacing token, a prior token migration here caused a real layout-shift bug (session-confirmed)
        opacity: root.expanded ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: Theme.ThemeManager.motion.duration.standard }
        }

        Repeater {
            model: Services.PowerService.profiles
            delegate: Item {
                id: profileButton
                Layout.preferredWidth: buttonContent.implicitWidth
                Layout.preferredHeight: buttonContent.implicitHeight
                
                property bool isActive: modelData.id === Services.PowerService.currentProfile
                property color profileColor: root.profileColors[modelData.id] || Theme.ThemeManager.colors.on.surface
                
                ColumnLayout {
                    id: buttonContent
                    spacing: 1
                    
                    // Icon
                    Text {
                        id: iconText
                        text: modelData.icon
                        color: profileButton.isActive
                            ? profileButton.profileColor
                            : Theme.ThemeManager.colors.on.surface
                        font.pixelSize: Theme.ThemeManager.typography.iconSize
                        font.family: Theme.ThemeManager.typography.family.icons
                        Layout.alignment: Qt.AlignHCenter
                        
                        Behavior on color {
                            ColorAnimation {
                                duration: Theme.ThemeManager.motion.duration.standard
                                easing.type: Theme.ThemeManager.motion.easing.standard
                            }
                        }
                    }

                    // Underline indicator
                    Rectangle {
                        Layout.preferredWidth: iconText.implicitWidth
                        Layout.preferredHeight: 2
                        Layout.alignment: Qt.AlignHCenter
                        color: profileButton.profileColor
                        radius: 1
                        opacity: profileButton.isActive ? 1 : 0

                        Behavior on opacity {
                            NumberAnimation {
                                duration: Theme.ThemeManager.motion.duration.standard
                                easing.type: Theme.ThemeManager.motion.easing.standard
                            }
                        }
                    }
                }
                
                HoverScale {
                    anchors.fill: parent
                    target: iconText
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Services.PowerService.setProfile(modelData.id)
                }
            }
        }
    }
}