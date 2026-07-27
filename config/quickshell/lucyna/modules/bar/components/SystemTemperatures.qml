import QtQuick
import QtQuick.Layouts
import "../../../core/theme" as Theme
import "../../../core/services" as Services
import "../../../core/components"

/*!
    Group of indicators to know the status of the temp in PC's components
*/
ExpandableRow {
    id: root

    /*!
        Return color to indicate warning levels
    */
    function getTempColor(temp) {
        if (temp >= 80) return Theme.ThemeManager.colors.status.error    // critical
        if (temp >= 70) return Theme.ThemeManager.colors.status.warning  // warning
        return Theme.ThemeManager.colors.accent                  // normal
    }
    
    RowLayout {
        id: tempsRow
        anchors.centerIn: parent
        spacing: 10  // ponytail: intentionally a raw literal, mirrors the known-good reference implementation exactly — do not migrate to a spacing token, a prior token migration here caused a real layout-shift bug (session-confirmed)
        opacity: root.expanded ? 1 : 0
        
        Behavior on opacity {
            NumberAnimation { duration: Theme.ThemeManager.motion.duration.standard }
        }
        
        // CPU Temperature
        RowLayout {
            visible: Services.TemperatureService.cpuTemp > 0
            spacing: Theme.ThemeManager.spacing.xs
            
            Text {
                text: "󰍛"
                color: root.getTempColor(Services.TemperatureService.cpuTemp)
                font.pixelSize: Theme.ThemeManager.typography.iconSize
                font.family: Theme.ThemeManager.typography.family.icons
            }
            
            Text {
                text: `${Math.round(Services.TemperatureService.cpuTemp)}°`
                color: Theme.ThemeManager.colors.on.surface
                font.pixelSize: Theme.ThemeManager.typography.size.sm
            }
        }
        
        // GPU Temperature
        RowLayout {
            visible: Services.TemperatureService.hasGPU
            spacing: Theme.ThemeManager.spacing.xs
            
            Text {
                text: "󰾲"
                color: root.getTempColor(Services.TemperatureService.gpuTemp)
                font.pixelSize: Theme.ThemeManager.typography.iconSize
                font.family: Theme.ThemeManager.typography.family.icons
            }
            
            Text {
                text: `${Math.round(Services.TemperatureService.gpuTemp)}°`
                color: Theme.ThemeManager.colors.on.surface
                font.pixelSize: Theme.ThemeManager.typography.size.sm
            }
        }
    }
}