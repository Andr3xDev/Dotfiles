import QtQuick
import QtQuick.Layouts
import "../../../core/theme" as Theme
import "../../../core/services" as Services
import "../../../core/components"

/*!
    Group of controls to manage PC's components like network or volume
*/
ExpandableRow {
    id: root

    readonly property real iconSize: 24

    RowLayout {
        id: controlsRow
        anchors.centerIn: parent
        spacing: Theme.ThemeManager.spacing.xs
        opacity: root.expanded ? 1 : 0
        
        Behavior on opacity {
            NumberAnimation { duration: Theme.ThemeManager.motion.duration.standard }
        }
        
        // Network
        Item {
            Layout.preferredWidth: root.iconSize
            Layout.preferredHeight: root.iconSize

            Text {
                id: networkIconText
                anchors.centerIn: parent
                text: Services.NetworkService.ethernetEnabled ? "󰈀" :
                      (Services.NetworkService.wifiEnabled ? "󰖩" : "󰖪")
                color: (Services.NetworkService.ethernetEnabled ||
                        Services.NetworkService.wifiEnabled)
                    ? Theme.ThemeManager.colors.accent
                    : Theme.ThemeManager.colors.status.error
                font.pixelSize: Theme.ThemeManager.typography.iconSize
                font.family: Theme.ThemeManager.typography.family.icons
            }

            HoverScale {
                anchors.fill: parent
                target: networkIconText
                cursorShape: Qt.PointingHandCursor
                onClicked: Services.NetworkService.openNetworkManager()
            }
        }
        
        // Bluetooth
        Item {
            Layout.preferredWidth: root.iconSize
            Layout.preferredHeight: root.iconSize

            Text {
                id: bluetoothIconText
                anchors.centerIn: parent
                text: Services.BluetoothService.enabled ? "󰂯" : "󰂲"
                color: Services.BluetoothService.enabled
                    ? Theme.ThemeManager.colors.accent
                    : Theme.ThemeManager.colors.status.error
                font.pixelSize: Theme.ThemeManager.typography.iconSize
                font.family: Theme.ThemeManager.typography.family.icons
            }

            HoverScale {
                anchors.fill: parent
                target: bluetoothIconText
                cursorShape: Qt.PointingHandCursor
                onClicked: Services.BluetoothService.openBluetoothManager()
            }
        }
        
        // Audio
        Item {
            Layout.preferredWidth: audioRow.implicitWidth
            Layout.preferredHeight: root.iconSize

            RowLayout {
                id: audioRow
                anchors.centerIn: parent
                spacing: Theme.ThemeManager.spacing.xs

                Text {
                    id: aIconText
                    text: Services.AudioService.muted ? " 󰖁" :
                          Services.AudioService.volume > 50 ? " 󰕾" : " 󰖀"
                    color: Services.AudioService.muted
                        ? Theme.ThemeManager.colors.status.error
                        : Theme.ThemeManager.colors.accent
                    font.pixelSize: Theme.ThemeManager.typography.iconSize
                    font.family: Theme.ThemeManager.typography.family.icons
                }

                Text {
                    text: `${Services.AudioService.volume}%`
                    color: Theme.ThemeManager.colors.on.surface
                    font.pixelSize: Theme.ThemeManager.typography.size.sm
                }
            }

            HoverScale {
                anchors.fill: parent
                target: aIconText
                cursorShape: Qt.PointingHandCursor

                // Scroll set values
                property int wheelAccumulator: 0
                onClicked: Services.AudioService.toggleMute()
                onWheel: wheel => {
                    wheelAccumulator += wheel.angleDelta.y
                    const stepThreshold = 120

                    while (wheelAccumulator >= stepThreshold) {
                        Services.AudioService.changeVolume("1%+")
                        wheelAccumulator -= stepThreshold
                    }
                    while (wheelAccumulator <= -stepThreshold) {
                        Services.AudioService.changeVolume("1%-")
                        wheelAccumulator += stepThreshold
                    }
                }
            }
        }
    }
}